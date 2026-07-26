# AXZIO Supabase Audit — 2026-07-25

## Purpose and classification

This record captures a read-only metadata audit performed to prepare the proposed Forge integration. The connected AXZIO Supabase project is **provisionally classified as the AXZIO/Forge development project**. This is a planning classification, not confirmation of ownership, deployment status, or production suitability.

## Evidence supporting the provisional development classification

- `auth.users` reported zero rows.
- The four observed public AXZIO application tables each reported zero rows.
- Storage reported no buckets or user objects.
- The local NE3ULA repository contained no active Supabase integration or populated environment configuration.
- The available API, Auth, and Postgres log samples showed no pre-audit application traffic.
- No deployed integration could be proven from repository or available project metadata.
- The project-level application migration history was empty.

## Important limitation

The log interface available to the audit returned only a short, approximately 24-hour window rather than the requested 30 days. The development classification must be reassessed if historical usage, ownership, deployment, or environment evidence appears.

## Observed metadata

Observed schemas with tables were `auth`, `public`, `storage`, `realtime`, and `vault`.

The observed public application tables were:

- `public.axzio_v1_results`
- `public.axzio_v1_feedback`
- `public.axzio_email_submissions`
- `public.axzio_pillars_feedback`

All four reported zero rows and RLS enabled. No `public.profiles`, `public.forge_applications`, or `public.forge_memberships` table was observed. No foreign key from an observed public application table to `auth.users` was observed.

The security advisor reported that each public AXZIO table had RLS enabled without an RLS policy, and that each was visible through GraphQL to anonymous and authenticated roles. The advisor also reported unused indexes on the existing AXZIO results, feedback, and email-submission paths.

## Dashboard settings that require later review

The audit did not establish project ownership; environment designation; Auth providers; email verification, reset, redirect, and session settings; exact grants; exact RLS policies; functions; triggers; scheduled jobs; Edge Functions; or historical logs beyond the returned window.

## Boundary confirmation and approval gate

Supabase remained unchanged during this audit: no migration, SQL write, authentication change, deployment, key retrieval, or configuration change occurred.

Before any remote migration, approve project ownership and environment mapping, the reviewed migration baseline, data model, RLS/grant design, rollback plan, and the separate preview and production environment plan.
