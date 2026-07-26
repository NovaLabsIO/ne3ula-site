# Future Supabase Setup

## Status and scope

This document plans a future connection only. Phase 1 does not connect to Supabase, install Supabase packages, create migrations, or use project identifiers, secrets, or URLs.

The current AXZIO project is provisionally designated the AXZIO/Forge **development** project based on the 2026-07-25 read-only audit. This is not a production designation, ownership confirmation, or authorization to connect an application. Reassess the classification if historical usage or deployment evidence appears. The current project must not silently become production.

Reuse the existing AXZIO development project as the proposed shared development backend, subject to ownership and environment review. Preserve the existing AXZIO tables; any change affecting them requires a separately reviewed decision. Do not create a separate Forge identity system without an explicit architecture decision.

## Intended ownership model

- `auth.users` — canonical authentication identity.
- `public.profiles` — universal NE3ULA profile data, keyed by the same user UUID.
- `public.forge_applications` — user-submitted Forge interest, intent, and application information, keyed by the same user UUID.
- `public.forge_memberships` — administrator-controlled Forge membership state, contribution role, path, and joining information, keyed by the same user UUID.
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
- **Preview:** a separate future preview environment with isolated credentials and redirect URLs, configured in the approved deployment platform.
- **Production:** a separate future production environment with isolated credentials and redirect URLs, configured only in the approved production secret manager/platform.

Use separate values and allowlists for each environment. Do not use production credentials locally or in preview.

## Migration workflow (future)

1. Obtain approval for project ownership, development/preview/production environment mapping, schema, RLS policies, and rollback plan.
2. Establish and approve a reviewed migration baseline that reconciles the observed AXZIO schema before applying Forge migrations.
3. Create a reviewed, timestamped migration under `sveltekit-app/supabase/migrations/` only after the baseline is approved.
4. Test it against an approved local or non-production environment.
5. Review SQL, policies, data impact, and rollback strategy.
6. Obtain explicit production approval before applying it.
7. Record the applied migration and validate least-privilege access.

No migration is created or applied in Phase 1 or Phase 2A. Phase 2A design drafts are not migrations.

## Redirect URL planning

Before authentication is enabled, approve exact allowlisted URLs for local development, preview, and production. The proposed production application origin is `https://forge.ne3ula.com`; callback and reset routes should be derived from that origin only after domain/deployment approval. Do not assume Framer URLs can safely process authenticated callbacks.
