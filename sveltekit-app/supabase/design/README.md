# Forge Supabase Design Drafts

## Status and three-table model

These are local **design drafts only**. They are outside `sveltekit-app/supabase/migrations/`, are not executable migration history, and require the separate Phase 2B and Phase 2C approval gates before any remote application.

The design adds three new tables without altering observed AXZIO tables:

- `public.profiles` — private, owner-only universal NE3ULA identity information.
- `public.forge_applications` — owner-submitted interest, intent, and application information.
- `public.forge_memberships` — administrator-controlled membership state, role, path, and joining information.

All three use the canonical `auth.users` UUID. Initial profile creation occurs through an authenticated application/server onboarding flow. No automatic `auth.users` trigger is proposed.

## Draft files and proposed access model

`001_profiles_forge_applications_memberships.sql` defines tables, ownership foreign keys, username rules, status/data constraints, and proposed length/size limits. `002_profiles_forge_applications_memberships_rls.sql` makes profiles private to their owner, allows client-owned draft application creation/editing, and allows membership read-only access to its owner. It grants no anonymous access and no client deletion.

RLS provides row protection; explicit column grants protect system-managed fields. A client may supply `profiles.id` only during profile creation, and RLS requires that value to equal `auth.uid()`. Clients cannot update `profiles.id`. `forge_applications.id` and all membership IDs remain system-generated/system-controlled. Ownership keys, timestamps, `submitted_at`, and membership administration remain protected as designed.

`003_updated_at_triggers.sql` is a separate trigger design. Its non-security-definer function sets `updated_at` before updates, with a fixed `search_path`. The design revokes default `EXECUTE` from `PUBLIC`, `anon`, and `authenticated` after trigger creation; the migration role needs `EXECUTE` when creating the triggers, and Phase 2C must validate target-version trigger behavior.

## Application submission: recommended mechanism

Direct client `UPDATE` is deliberately restricted to drafts where `submitted_at is null`. Both RLS predicates prevent a client from setting `submitted_at` or changing a submitted row through ordinary table updates.

Use an approved server-side submission operation or narrowly designed RPC to validate the versioned application payload and atomically set `submitted_at`. It must authenticate the caller, verify ownership and draft state, validate required fields, and avoid granting broad client update access. This repository does not implement that operation.

## Privacy and retention

- Profiles are private initially; no public profile discovery is drafted.
- Applications may contain sensitive personal information. Collect only what is necessary.
- `application_data` requires versioned validation keyed to `schema_version`.
- The retention period remains an approval decision.
- Account deletion and application withdrawal require a later governed workflow.
- Do not store highly sensitive information in JSONB.
- Consent and privacy copy are required before collection.

## Security review findings

- Owner RLS predicates use `auth.uid()` in both `USING` and `WITH CHECK` wherever a client write is permitted, preventing cross-user reads and ownership reassignment.
- The applications draft blocks browser-controlled submission and post-submission edits. A server/RPC submission path is required; an ordinary broad update policy would permit privilege escalation through `submitted_at`.
- Memberships expose only owner reads to authenticated clients. They deliberately have no client insert, update, or delete grant/policy; administrative creation and moderation need a separate server-side authorization design.
- Lowercase-only username validation and a partial unique index prevent case collisions, blank strings, and invalid lengths. Product approval is still needed for username lifecycle and rename behavior.
- JSONB is restricted to an object and has proposed size/version constraints, but its field schema, sensitive-data rules, and validation are unresolved.
- The `updated_at` trigger updates every accepted row update and does not bypass RLS. Its ownership, privilege, and search-path assumptions must be reviewed before use.
- RLS does not remove pre-existing public-schema grants or GraphQL exposure by itself. The existing AXZIO GraphQL/grant advisor findings require a separate baseline reconciliation and grant review.
- No administrative model, audit logging design, or compatibility change to existing AXZIO tables is included.

## Remaining approval decisions

- Username rename rules and whether a username remains optional after onboarding.
- Editable profile fields, avatar URL validation, and private-field handling.
- Required application fields, intent limit, JSONB size limit, and versioned validation contract.
- Submission RPC/server runtime, error handling, and audit trail.
- Membership moderation, role/path assignment, status transitions, and `joined_at` assignment.
- Retention, account deletion, application withdrawal, and audit logging policy.
- Consent/privacy copy and data-subject support workflow.
