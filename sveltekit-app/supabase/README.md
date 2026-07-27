# Reserved Supabase Directory

This directory contains a Phase 2B local migration candidate and local-only security-test design for the future Forge application.

Do not run `supabase init`, add a project reference, add credentials, or apply a migration without the stated approval gates. The existing AXZIO Supabase project is the intended shared backend, subject to access, environment, schema, security, and migration review.

The timestamped candidate in `migrations/` is local only and is not remote migration history. Review [PHASE_2B.md](PHASE_2B.md) for its approval status, local pgTAP test instructions, unresolved decisions, existing-AXZIO reconciliation requirements, compensation strategy, and future privileged-operation designs. It must be tested outside production and explicitly approved before application.
