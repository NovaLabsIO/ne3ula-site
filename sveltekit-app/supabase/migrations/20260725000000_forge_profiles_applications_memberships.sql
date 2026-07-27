-- Forge Phase 2B local migration candidate — NOT APPLIED.
--
-- Prerequisites before any Phase 2C application:
--   * approve this exact candidate and the reconciliation plan in ../PHASE_2B.md;
--   * confirm the target is the approved non-production AXZIO/Forge project;
--   * confirm the migration role owns these new objects and can reference auth.users;
--   * validate PostgreSQL/Supabase support for gen_random_uuid() and trigger
--     EXECUTE behavior with the target versions.
--
-- This migration intentionally creates only the approved Forge tables. It does
-- not alter, grant on, or reconcile existing AXZIO tables.

create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  username text,
  display_name text,
  avatar_url text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint profiles_username_format_check
    check (username is null or username ~ '^[a-z0-9_]{3,30}$')
);

create unique index profiles_username_lower_unique
  on public.profiles (lower(username))
  where username is not null;

create table public.forge_applications (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null unique references auth.users(id) on delete cascade,
  intent text,
  application_data jsonb not null default '{}'::jsonb,
  schema_version integer not null default 1,
  submitted_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint forge_applications_data_object_check
    check (jsonb_typeof(application_data) = 'object'),
  constraint forge_applications_schema_version_check
    check (schema_version > 0),
  constraint forge_applications_intent_length_check
    check (intent is null or char_length(intent) <= 2000),
  constraint forge_applications_data_size_check
    check (octet_length(application_data::text) <= 65536)
);

create table public.forge_memberships (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null unique references auth.users(id) on delete cascade,
  status text not null default 'pending'
    constraint forge_memberships_status_check
      check (status in ('pending', 'active', 'paused', 'declined')),
  contribution_role text,
  forge_path text,
  joined_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.profiles enable row level security;
alter table public.forge_applications enable row level security;
alter table public.forge_memberships enable row level security;

-- Reset the exposed client roles before granting the narrow column sets below.
revoke all on table public.profiles, public.forge_applications,
  public.forge_memberships from anon;
revoke all on table public.profiles, public.forge_applications,
  public.forge_memberships from authenticated;

grant select on table public.profiles, public.forge_applications,
  public.forge_memberships to authenticated;

grant insert (id, username, display_name, avatar_url)
  on table public.profiles to authenticated;
grant update (username, display_name, avatar_url)
  on table public.profiles to authenticated;

grant insert (user_id, intent, application_data, schema_version)
  on table public.forge_applications to authenticated;
grant update (intent, application_data, schema_version)
  on table public.forge_applications to authenticated;

create policy "profiles_select_own"
  on public.profiles for select to authenticated
  using ((select auth.uid()) = id);

create policy "profiles_insert_own"
  on public.profiles for insert to authenticated
  with check ((select auth.uid()) = id);

create policy "profiles_update_own"
  on public.profiles for update to authenticated
  using ((select auth.uid()) = id)
  with check ((select auth.uid()) = id);

create policy "forge_applications_select_own"
  on public.forge_applications for select to authenticated
  using ((select auth.uid()) = user_id);

create policy "forge_applications_insert_own_draft"
  on public.forge_applications for insert to authenticated
  with check (
    (select auth.uid()) = user_id
    and submitted_at is null
  );

create policy "forge_applications_update_own_draft"
  on public.forge_applications for update to authenticated
  using (
    (select auth.uid()) = user_id
    and submitted_at is null
  )
  with check (
    (select auth.uid()) = user_id
    and submitted_at is null
  );

create policy "forge_memberships_select_own"
  on public.forge_memberships for select to authenticated
  using ((select auth.uid()) = user_id);

-- No DELETE policies are created. There is deliberately no INSERT, UPDATE, or
-- DELETE grant for memberships, and no client grant for generated IDs,
-- ownership keys, timestamps, or submitted_at.

-- Not SECURITY DEFINER: this function does not bypass RLS or caller context.
-- pg_catalog is fixed to prevent search-path object shadowing.
create function public.set_forge_updated_at()
returns trigger
language plpgsql
set search_path = pg_catalog
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create trigger profiles_set_updated_at
before update on public.profiles
for each row execute function public.set_forge_updated_at();

create trigger forge_applications_set_updated_at
before update on public.forge_applications
for each row execute function public.set_forge_updated_at();

create trigger forge_memberships_set_updated_at
before update on public.forge_memberships
for each row execute function public.set_forge_updated_at();

-- CREATE TRIGGER requires the migration role to retain EXECUTE until the
-- triggers exist. Remove all direct callable access afterwards; Phase 2C must
-- verify this target-version behavior with the migration role and client roles.
revoke execute on function public.set_forge_updated_at() from public;
revoke execute on function public.set_forge_updated_at() from anon;
revoke execute on function public.set_forge_updated_at() from authenticated;
