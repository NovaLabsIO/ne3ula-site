# NE3ULA Coded Application and System Support

This repository preserves NE3ULA's coded implementations and supporting system foundations. It is **not** the canonical public website at this time.

## Current status

- **Public presentation:** Framer is the current public website.
- **Public domain path:** `ne3ula.com` redirects through Cloudflare to Framer. That redirect is production infrastructure and must not be changed without explicit approval.
- **Repository root:** legacy static NE3ULA implementation, retained as an active historical and system reference.
- **`sveltekit-app/`:** the canonical coded application within this repository. It contains the current SvelteKit routes, visual work, content engine, system kernel, knowledge intake layer, and philosophy planning work.
- **The Forge:** a proposed authenticated community application; it is not deployed or implemented in this phase.

Read [docs/CURRENT_DEPLOYMENT.md](docs/CURRENT_DEPLOYMENT.md) before making deployment assumptions, and [docs/AGENTS.md](docs/AGENTS.md) before editing.

## Repository layout

- `index.html`, `home/`, `myth/`, `music/`, `axzio/`, `e3/`, `engine/`, `lore/`, `shared/` — legacy static implementation.
- `sveltekit-app/` — canonical coded application in this repository.
- `docs/` — architecture, workflow, security, and planning documentation.

## Development

The SvelteKit application is developed from `sveltekit-app/` using the commands documented in [its README](sveltekit-app/README.md). Do not infer a production deployment from a successful local build.

## Canonical knowledge

`ne3ula-knowledge` remains the canonical source for NE3ULA philosophy and ontology. This repository may render curated content or maintain source-aligned mappings, but it must not duplicate or redefine that canonical knowledge.
