# Future Supabase Setup

## Status and scope

This document plans a future connection only. Phase 1 does not connect to Supabase, install Supabase packages, create migrations, or use project identifiers, secrets, or URLs.

Reuse the existing AXZIO Supabase project as the shared backend, subject to ownership and environment review. Do not create a separate Forge project or identity system without an explicit architecture decision.

## Intended ownership model

- `auth.users` — canonical authentication identity.
- `public.profiles` — universal NE3ULA profile data, keyed by the same user UUID.
- `public.forge_memberships` — Forge application, participation, membership status, and contribution information, keyed by the same user UUID.
- Future AXZIO tables — reference `auth.users.id`.
- Future AI.d tables — reference `auth.users.id`.

## Environment variables

Use SvelteKit-compatible variables. The committed template contains placeholders only:

```text
PUBLIC_SUPABASE_URL
PUBLIC_SUPABASE_PUBLISHABLE_KEY
# Server-only: SUPABASE_SERVICE_ROLE_KEY (never PUBLIC_, never committed, never browser-visible)
```

`PUBLIC_` variables are intentionally exposed to the browser. A service-role credential is server-only and must be held only by approved server/runtime configuration; it must never be included in Framer, client code, logs, or `.env.example` values.

## Environment separation

- **Local:** developer-specific untracked `.env.local` or equivalent local secret store.
- **Preview:** isolated preview credentials and redirect URLs, configured in the approved deployment platform.
- **Production:** production credentials and redirect URLs, configured only in the approved production secret manager/platform.

Use separate values and allowlists for each environment. Do not use production credentials locally or in preview.

## Migration workflow (future)

1. Obtain approval for project ownership, environment mapping, schema, RLS policies, and rollback plan.
2. Create a reviewed, timestamped migration under `sveltekit-app/supabase/migrations/`.
3. Test it against an approved local or non-production environment.
4. Review SQL, policies, data impact, and rollback strategy.
5. Obtain explicit production approval before applying it.
6. Record the applied migration and validate least-privilege access.

No migration is created or applied in Phase 1.

## Redirect URL planning

Before authentication is enabled, approve exact allowlisted URLs for local development, preview, and production. The proposed production application origin is `https://forge.ne3ula.com`; callback and reset routes should be derived from that origin only after domain/deployment approval. Do not assume Framer URLs can safely process authenticated callbacks.
