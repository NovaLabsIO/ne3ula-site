-- Local pgTAP policy/grant test candidate for the Forge Phase 2B migration.
-- Run only against a disposable local Supabase database; see ../../PHASE_2B.md.
-- The transaction rolls back the three synthetic auth fixtures and all test rows.

begin;

set local search_path = extensions, public, auth, pg_catalog;
select plan(28);

-- Test-only FK fixtures. These are not application users and must never be
-- inserted into a remote project. This column set matches the current local
-- Supabase auth.users contract; see PHASE_2B.md for the compatibility check.
insert into auth.users (
  id, instance_id, aud, role, email, encrypted_password, email_confirmed_at,
  raw_app_meta_data, raw_user_meta_data
) values
  (
    '11111111-1111-1111-1111-111111111111',
    '00000000-0000-0000-0000-000000000000',
    'authenticated', 'authenticated', 'forge-test-owner-a@example.invalid',
    'test-fixture-not-for-login', now(),
    '{"provider":"email","providers":["email"]}', '{}'
  ),
  (
    '22222222-2222-2222-2222-222222222222',
    '00000000-0000-0000-0000-000000000000',
    'authenticated', 'authenticated', 'forge-test-owner-b@example.invalid',
    'test-fixture-not-for-login', now(),
    '{"provider":"email","providers":["email"]}', '{}'
  ),
  (
    '33333333-3333-3333-3333-333333333333',
    '00000000-0000-0000-0000-000000000000',
    'authenticated', 'authenticated', 'forge-test-owner-c@example.invalid',
    'test-fixture-not-for-login', now(),
    '{"provider":"email","providers":["email"]}', '{}'
  );

-- Seed an administrator-controlled membership as the test runner (a table
-- owner or equivalent local administrative role), then test it as clients.
insert into public.forge_memberships (user_id, status, contribution_role)
values ('11111111-1111-1111-1111-111111111111', 'active', 'member');

set local role anon;
select throws_ok(
  $$ select * from public.profiles $$,
  '42501', null, 'anonymous profile reads are denied'
);
select throws_ok(
  $$ select * from public.forge_applications $$,
  '42501', null, 'anonymous application reads are denied'
);
select throws_ok(
  $$ select * from public.forge_memberships $$,
  '42501', null, 'anonymous membership reads are denied'
);

set local role postgres;
select set_config('request.jwt.claim.sub', '11111111-1111-1111-1111-111111111111', true);
select set_config('request.jwt.claims', '{"sub":"11111111-1111-1111-1111-111111111111","role":"authenticated"}', true);
set local role authenticated;

select lives_ok(
  $$ insert into public.profiles (id, username, display_name)
     values ('11111111-1111-1111-1111-111111111111', 'owner_a', 'Owner A') $$,
  'an authenticated user can create only their own profile'
);
select is(
  (select count(*) from public.profiles), 1::bigint,
  'the profile owner can read their profile'
);
select throws_ok(
  $$ insert into public.profiles (id, username)
     values ('22222222-2222-2222-2222-222222222222', 'owner_b') $$,
  '42501', null, 'profile creation requires id = auth.uid()'
);
select throws_ok(
  $$ update public.profiles
     set id = '22222222-2222-2222-2222-222222222222' $$,
  '42501', null, 'profile ID is immutable to clients'
);
select throws_ok(
  $$ update public.profiles set created_at = now() $$,
  '42501', null, 'profile timestamps are protected from clients'
);
select lives_ok(
  $$ insert into public.forge_applications (user_id, intent, application_data, schema_version)
     values ('11111111-1111-1111-1111-111111111111', 'draft', '{"answer":"one"}', 1) $$,
  'the owner can create a draft application'
);
select is(
  (select count(*) from public.forge_applications where submitted_at is null), 1::bigint,
  'the owner can read their draft application'
);
select lives_ok(
  $$ update public.forge_applications set intent = 'edited draft'
     where submitted_at is null $$,
  'the owner can edit a draft application'
);
select throws_ok(
  $$ insert into public.forge_applications (id, user_id, intent)
     values (gen_random_uuid(), '11111111-1111-1111-1111-111111111111', 'bad id') $$,
  '42501', null, 'application IDs are protected from clients'
);
select throws_ok(
  $$ update public.forge_applications set user_id = '22222222-2222-2222-2222-222222222222'
     where submitted_at is null $$,
  '42501', null, 'application ownership fields are protected from clients'
);
select throws_ok(
  $$ update public.forge_applications set created_at = now()
     where submitted_at is null $$,
  '42501', null, 'application timestamps are protected from clients'
);
select throws_ok(
  $$ update public.forge_applications set updated_at = now()
     where submitted_at is null $$,
  '42501', null, 'application updated_at is protected from clients'
);
select throws_ok(
  $$ update public.forge_applications set submitted_at = now()
     where submitted_at is null $$,
  '42501', null, 'submitted_at is protected from clients'
);

-- Test cross-user access while owner A's application is still a draft.
set local role postgres;
select set_config('request.jwt.claim.sub', '22222222-2222-2222-2222-222222222222', true);
select set_config('request.jwt.claims', '{"sub":"22222222-2222-2222-2222-222222222222","role":"authenticated"}', true);
set local role authenticated;

select is((select count(*) from public.profiles), 0::bigint,
  'a different user cannot read another profile');
select is((select count(*) from public.forge_applications), 0::bigint,
  'a different user cannot read another draft application');
select is((select count(*) from public.forge_memberships), 0::bigint,
  'a different user cannot read another membership');
select is(
  (with changed as (
    update public.profiles set display_name = 'cross-user write' returning 1
  ) select count(*) from changed),
  0::bigint,
  'a different user cannot update another profile'
);
select is(
  (with changed as (
    update public.forge_applications set intent = 'cross-user write'
    where submitted_at is null returning 1
  ) select count(*) from changed),
  0::bigint,
  'a different user cannot update another draft application'
);
select throws_ok(
  $$ insert into public.forge_applications (user_id, intent)
     values ('33333333-3333-3333-3333-333333333333', 'cross-user create') $$,
  '42501', null, 'application creation requires user_id = auth.uid()'
);
select throws_ok(
  $$ insert into public.forge_applications (user_id, submitted_at)
     values ('22222222-2222-2222-2222-222222222222', now()) $$,
  '42501', null, 'client inserts cannot set submitted_at'
);

-- Simulate the future approved server-side submission while running as the
-- local test administrator. This is deliberately not a client table write.
set local role postgres;
update public.forge_applications
set submitted_at = now()
where user_id = '11111111-1111-1111-1111-111111111111'
  and submitted_at is null;
select set_config('request.jwt.claim.sub', '11111111-1111-1111-1111-111111111111', true);
select set_config('request.jwt.claims', '{"sub":"11111111-1111-1111-1111-111111111111","role":"authenticated"}', true);
set local role authenticated;

select is(
  (with changed as (
    update public.forge_applications set intent = 'should not change'
    where submitted_at is not null returning 1
  ) select count(*) from changed),
  0::bigint,
  'submitted applications are immutable to the owner'
);
select is(
  (select count(*) from public.forge_memberships), 1::bigint,
  'the membership owner can read their membership'
);
select throws_ok(
  $$ insert into public.forge_memberships (user_id, status)
     values ('11111111-1111-1111-1111-111111111111', 'active') $$,
  '42501', null, 'clients cannot create memberships'
);
select throws_ok(
  $$ update public.forge_memberships set status = 'paused' $$,
  '42501', null, 'clients cannot update memberships'
);
select throws_ok(
  $$ delete from public.forge_memberships $$,
  '42501', null, 'clients cannot delete memberships'
);

select * from finish();
rollback;
