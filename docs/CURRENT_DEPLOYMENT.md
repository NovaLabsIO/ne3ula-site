# Current Deployment Status

## Confirmed facts

- Framer is the current public-facing NE3ULA website and marketing/presentation layer.
- `ne3ula.com` redirects through Cloudflare to the Framer website.
- That redirect is existing production infrastructure and must remain operational and unchanged without explicit approval.
- The SvelteKit application in `sveltekit-app/` is the canonical coded application within this repository, but is not the canonical public website.
- The legacy static HTML implementation at the repository root remains present and must not be assumed obsolete.
- The SvelteKit project includes `@sveltejs/adapter-cloudflare`; this indicates Cloudflare-targeted build capability, not an active deployment.

## Known repository components

| Component | Status from this audit | Notes |
| --- | --- | --- |
| Framer | Current public production | Outside this repository; not modified in Phase 1 |
| Cloudflare redirect | Current public production | Preserve unchanged |
| Root static implementation | Present / legacy | Existing HTML routes, assets, and shared styling remain tracked |
| `sveltekit-app/` | Present / coded application | Existing SvelteKit routes, content, kernel, knowledge, and philosophy foundations |
| Cloudflare application config | Unknown | No tracked `wrangler` configuration was found |
| SvelteKit live deployment | Unknown | No tracked evidence confirms a live binding, domain, or deployment |
| Supabase connection | Not configured | No Supabase package, project identifier, or credentials were found |

## Assumptions to validate before a later phase

- Whether either coded implementation has an active deployment independent of Framer.
- Which Cloudflare account/project owns current redirect and future application configuration.
- Whether `forge.ne3ula.com` is available and suitable for the proposed Forge boundary.
- The existing AXZIO Supabase project's ownership, environments, auth settings, and migration history.

## Approval-protected production components

Do not change the following without explicit approval:

- Cloudflare DNS, redirect rules, Pages/Workers configuration, or domains
- Framer content, links, embeds, code, or publish settings
- `ne3ula.com` redirect behavior
- production deployment settings or environment variables
- Supabase projects, redirect URLs, migrations, schemas, data, or credentials
