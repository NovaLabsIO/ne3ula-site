# AXZIO Existing Schema Baseline

## Status

This is an **observational metadata baseline**, captured during the 2026-07-25 read-only audit. It is not an executable migration, source of truth for unobserved database objects, or authorization to alter the connected project.

## Observed public tables

| Table | Row status | RLS status | Observed relationship |
| --- | --- | --- | --- |
| `public.axzio_v1_results` | Zero rows reported | Enabled | Referenced by feedback and email submissions |
| `public.axzio_v1_feedback` | Zero rows reported | Enabled | `result_id` references `public.axzio_v1_results.id` |
| `public.axzio_email_submissions` | Zero rows reported | Enabled | `result_id` references `public.axzio_v1_results.id` |
| `public.axzio_pillars_feedback` | Zero rows reported | Enabled | No public-table foreign key observed |

No foreign key from these observed public tables to `auth.users` was observed. No `public.profiles`, `public.forge_applications`, or `public.forge_memberships` table was observed.

## Policy and exposure findings

The Supabase security advisor reported RLS enabled without policies on all four observed public AXZIO tables. It also reported GraphQL visibility to anonymous and authenticated roles for each table. This baseline does not infer the full grants or exact policy definitions.

## Migration-history status

The project-level application migration history returned no entries. Supabase-managed schema/migration tables exist separately and do not supply application migration provenance.

## Unknown or unverified metadata

The audit did not verify functions, triggers, grants, exact policy definitions, views, materialized views, scheduled jobs, Edge Functions, or dashboard-managed settings. These must be reviewed before any schema reconciliation or remote change.
