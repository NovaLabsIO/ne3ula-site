# Forge Phase 2B migration candidate and local security tests

## Status

This is a reviewed **local migration candidate**, not evidence of an applied migration. It must not be applied to any database until the Phase 2B approval gate accepts the exact SQL, baseline reconciliation, and the approved development-project plan. No project reference, key, URL, remote connection, or application integration is included here.

The candidate is [20260725000000_forge_profiles_applications_memberships.sql](migrations/20260725000000_forge_profiles_applications_memberships.sql). It implements the approved three-table model only:

- `public.profiles`, keyed directly to `auth.users(id)`.
- `public.forge_applications`, one owner-owned application per user.
- `public.forge_memberships`, administrator-controlled membership state.

Its order is intentional: tables and their constraints/index first; then RLS, revokes, column grants, and policies; then the non-`SECURITY DEFINER` timestamp function and its triggers; finally direct `EXECUTE` revokes. The migration role creates and owns the new objects. `public.set_forge_updated_at()` has `search_path = pg_catalog`, avoiding search-path object shadowing; it does not need to resolve application objects. The role must retain function `EXECUTE` through `CREATE TRIGGER`, then the candidate revokes direct calls from `PUBLIC`, `anon`, and `authenticated`.

## Local test execution

The pgTAP suite is [forge_rls.test.sql](tests/database/forge_rls.test.sql). It is designed for the conventional Supabase CLI database-test path.

1. Use only a disposable local Supabase database. Do not provide a project ref or link a remote project.
2. Confirm the local stack uses a Supabase/PostgreSQL version with `auth.uid()`, the `anon` and `authenticated` roles, `gen_random_uuid()`, and the `pgtap` extension available in the `extensions` schema.
3. Apply this candidate to that local database only, using the reviewed local workflow.
4. From `sveltekit-app/`, run `supabase test db` (or the equivalent local-only command for the installed CLI version).

The test begins a transaction, seeds three synthetic `auth.users` rows as local FK fixtures, switches between `anon` and `authenticated`, sets the local JWT claims used by `auth.uid()`, and rolls everything back. The runner must be able to create synthetic local `auth.users` fixtures and `SET ROLE` to `anon`, `authenticated`, and its local administrative role. The suite must never be run with a remote database connection.

Security coverage includes anonymous access denial; owner reads; cross-user read/write denial; profile creation only when `id = auth.uid()`; profile ID/timestamp protection; draft application creation and editing; submitted application immutability; membership owner reads; all client membership writes denied; and column-grant protection for IDs, ownership fields, timestamps, and `submitted_at`.

## Exact assumptions and unresolved product decisions

The candidate assumes the approved Phase 2A data model, PostgreSQL/Supabase support for `gen_random_uuid()`, and a migration role that can reference `auth.users` and owns all newly created `public` objects. It assumes standard Supabase JWT claim compatibility for `auth.uid()`. The test fixture assumes the current local `auth.users` columns `id`, `instance_id`, `aud`, `role`, `email`, `encrypted_password`, `email_confirmed_at`, `raw_app_meta_data`, and `raw_user_meta_data`; validate that contract against the local CLI image before relying on the suite.

These product decisions remain deliberately unresolved and are not implemented: username rename/optional lifecycle; editable profile fields and avatar validation; required application fields, JSON schema/version validation, 2,000-character intent and 64 KiB JSON limits; sensitive-data/consent/privacy copy; retention, withdrawal, account deletion, and audit logging; membership roles, paths, status transitions, `joined_at`, and moderation; and support/data-subject workflows.

## Existing AXZIO baseline reconciliation

Before any Phase 2C application, perform and approve a reconciliation that inventories the existing `public.axzio_v1_results`, `public.axzio_v1_feedback`, `public.axzio_email_submissions`, and `public.axzio_pillars_feedback` tables along with their exact columns, constraints, indexes, grants, policies, GraphQL exposure, functions, triggers, views, jobs, and dependencies. The 2026-07-25 audit observed RLS enabled without policies and GraphQL visibility to `anon`/`authenticated`, but did not establish exact grants or policy definitions. This candidate does not change those objects or cure their advisory findings. Reconciliation must establish project ownership/environment, migration provenance, compatibility with `auth.users`, and a separately approved remediation plan before any remote change.

## Rollback and compensation

Before application, review the exact SQL and use a forward compensating migration rather than destructive rollback if any data exists. A pre-data compensation can remove the three tables (which also removes their dependent policies, triggers, indexes, and function dependency only after confirming no other caller uses it). Once data exists, preserve users and submitted applications: disable affected entry points, revoke client grants/policies as necessary, back up/export under approved governance, and use additive corrective migrations. Never delete `auth.users` or alter existing AXZIO tables as a Forge rollback shortcut.

## Future privileged operations

Application submission is intentionally absent from client table privileges. A future approved server operation or narrow RPC must authenticate the caller, require ownership and a draft state, validate the versioned payload and required fields, set `submitted_at` atomically, return safe errors, and write only the minimum audit metadata. It must not expose a service-role credential or grant broad `UPDATE` access to clients.

Membership administration is intentionally absent too. A future authorization design must define the approved administrator identity source, server/runtime boundary, role assignment, status-transition rules, least-privilege write surface, audit log, review workflow, and revocation/support process. It must not use a client-writable membership policy or rely on hidden browser UI as authorization.

## Validation record

This candidate is suitable for static SQL review now. Dynamic migration and pgTAP execution remain required before Phase 2C because no Supabase CLI or local database runtime was available during Phase 2B creation. Validate target-version trigger `EXECUTE` semantics in that run: the direct function `EXECUTE` revokes must not stop its intended trigger operation, and the migration role/function owner relationship must be recorded.
