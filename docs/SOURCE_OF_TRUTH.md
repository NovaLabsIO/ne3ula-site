# NE3ULA — Source of Truth

This document records the repository's intended conceptual and technical boundaries. It does not replace the canonical NE3ULA philosophy or ontology maintained in `ne3ula-knowledge`.

## Architecture status

| Layer | Status | Role |
| --- | --- | --- |
| Framer | Current public production | Public presentation and marketing website |
| Cloudflare redirect | Current public production | Routes `ne3ula.com` to Framer; preserve unchanged without approval |
| Legacy static site at repository root | Current repository / legacy implementation | Preserved implementation and route reference |
| `sveltekit-app/` | Current repository / canonical coded application | Current coded routes, assets, systems, and future application candidate |
| Forge at `forge.ne3ula.com` | Proposed | Authenticated community application boundary, pending approval |
| AXZIO Supabase project | Intended shared backend | Future shared identity and data backend, not connected in Phase 1 |

Do not describe the root static site or `sveltekit-app/` as the current public website. See `CURRENT_DEPLOYMENT.md` for confirmed facts and `FORGE_ARCHITECTURE.md` for the proposal.

## Conceptual system

The existing conceptual stack remains:

```text
NE3ULA = space
Myth = meaning
AXZIO = interface
E3 = engine
```

NE3ULA is the philosophical and creative container for tools, identity layers, and creative outputs. The coded application preserves and renders approved content; `ne3ula-knowledge` remains canonical for philosophy and ontology.

## Repository route model

The legacy static implementation and current SvelteKit application contain this established model:

- `/` — entry threshold
- `/home` — navigation hub
- `/myth` — philosophy layer
- `/music` — creative signal
- `/axzio` — interface entry
- `/e3` — future engine layer
- `/engine` — future infrastructure layer
- `/lore` — future narrative layer

These routes are existing coded-system routes, not evidence of current public production routing. Preserve them unless explicitly instructed otherwise.

`CODED_SITE_REFERENCE.md` preserves the route purposes, coded user journey, visual language, navigation conventions, and future coded-system intentions that guide work on these routes. It is not a production architecture document.

## Content and system boundaries

- `sveltekit-app/src/lib/ne3ula/` is the lightweight system kernel.
- `sveltekit-app/src/lib/content/` contains curated renderable content.
- `sveltekit-app/src/lib/knowledge/` contains source-aligned intake/mapping material and is distinct from the curated content layer.
- Philosophy planning documents are planning material; preserve their status and do not treat planned pages as deployed.

## Development rules

1. Keep legacy, coded, public-production, and proposed systems clearly labeled.
2. Preserve the dark, cinematic, restrained visual language and existing navigation distinctions.
3. Work on feature branches with review gates; `main` is stable/production-oriented.
4. Do not change Cloudflare, Framer, DNS, redirects, Supabase, or deployment configuration without explicit approval.
5. Do not create a parallel identity system for Forge.
