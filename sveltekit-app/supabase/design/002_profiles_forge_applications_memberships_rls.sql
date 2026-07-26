-- DESIGN DRAFT ONLY — NOT A MIGRATION. Apply only with explicit Phase 2C
-- remote-change approval. No administrative policies are defined here.

alter table public.profiles enable row level security;
alter table public.forge_applications enable row level security;
alter table public.forge_memberships enable row level security;

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
-- A client may supply profiles.id only during creation; profiles_insert_own
-- requires it to equal auth.uid(). No UPDATE grant exists for profiles.id.

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

-- Client creation is draft-only. The client cannot provide submitted_at.
create policy "forge_applications_insert_own_draft"
  on public.forge_applications for insert to authenticated
  with check (
    (select auth.uid()) = user_id
    and submitted_at is null
  );

-- Direct client updates remain draft-only. Both predicates prevent an owner
-- from setting submitted_at through ordinary UPDATE and prevent edits after a
-- server-side submission has populated it.
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

-- No client DELETE policies are created. Memberships have no authenticated
-- INSERT or UPDATE grant/policy. forge_applications.id and all membership IDs
-- are system-generated/system-controlled. Ownership keys, timestamps,
-- submitted_at, and membership administration remain protected by the column
-- grants and RLS design.
-- The draft defines neither an administrative policy nor service-role access.
