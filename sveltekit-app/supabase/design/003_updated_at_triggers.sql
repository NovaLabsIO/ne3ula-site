-- DESIGN DRAFT ONLY — NOT A MIGRATION. Requires Phase 2B/2C review.
-- The function is not SECURITY DEFINER. It uses a fixed search_path because
-- the function owner and migration role must be reviewed and controlled.

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

-- PostgreSQL checks EXECUTE on a trigger function when CREATE TRIGGER runs;
-- the migration role must therefore have EXECUTE at that point. These revokes
-- remove the default callable-function privilege afterwards. The trigger still
-- executes under its intended ownership model; confirm this with the target
-- PostgreSQL/Supabase version during Phase 2C validation.
revoke execute on function public.set_forge_updated_at() from public;
revoke execute on function public.set_forge_updated_at() from anon;
revoke execute on function public.set_forge_updated_at() from authenticated;

-- Before application, review function ownership, public-schema function
-- privileges, deployment role, and whether timestamp precision meets the audit
-- requirements. Trigger execution does not replace RLS or authorization.
