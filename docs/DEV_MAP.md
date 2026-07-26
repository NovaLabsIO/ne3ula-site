# NE3ULA — Developer Map

## System map

```text
Current public production
ne3ula.com → Cloudflare redirect → Framer

Current repository
legacy static site at repository root
└── sveltekit-app/ (canonical coded application in this repository)
    ├── routes and visual system
    ├── content engine
    ├── NE3ULA kernel
    ├── knowledge intake/mapping layer
    └── philosophy planning materials

Proposed, pending approval
Framer CTA → forge.ne3ula.com → SvelteKit Forge application → AXZIO Supabase identity backend
```

## Existing coded route map

| Route | Current coded role |
| --- | --- |
| `/` | Entry threshold |
| `/home` | Primary hub |
| `/myth` | Philosophy layer |
| `/music` | Creative signal |
| `/axzio` | Interface entry |
| `/e3` | Future engine layer |
| `/engine` | Future infrastructure layer |
| `/lore` | Future narrative layer |

The table describes repository code, not public production routing.

`CODED_SITE_REFERENCE.md` documents the preserved route purposes, visitor journey, visual system, navigation conventions, and future coded-system intentions behind this route map.

## Code map

- Root HTML folders and `shared/` preserve the legacy static implementation.
- `sveltekit-app/src/routes/` contains the coded application routes.
- `sveltekit-app/src/lib/ne3ula/` is the system kernel.
- `sveltekit-app/src/lib/content/` is curated public-facing renderable content.
- `sveltekit-app/src/lib/knowledge/` is a source-aligned mapping layer; it does not supersede `ne3ula-knowledge`.
- `sveltekit-app/static/` holds app assets.

## Forge direction

The recommended application boundary is a dedicated `forge.ne3ula.com` origin, with routes `/`, `/login`, `/join`, `/dashboard`, `/auth/callback`, and `/auth/reset-password`. This keeps Framer presentation distinct from authenticated data and avoids coupling Forge to legacy public-route semantics. It remains a proposal until deployment, URL, and identity decisions are approved.

See `FORGE_ARCHITECTURE.md` and `FORGE_IMPLEMENTATION_PLAN.md` for the staged plan.
