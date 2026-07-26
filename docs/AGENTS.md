# NE3ULA — Agent Instructions

These instructions apply to work in this repository unless the user explicitly overrides them.

## Repository and production context

- Framer is the current public NE3ULA website and public presentation layer.
- `ne3ula.com` redirects through Cloudflare to Framer. Existing redirects, DNS, Cloudflare settings, Framer configuration, and production deployments must not be changed without explicit approval.
- This repository is the coded-application and system-support layer; it is not the canonical public website.
- The legacy static implementation remains at the repository root and must be preserved unless a task explicitly changes it.
- `sveltekit-app/` is the canonical coded application within this repository. It is not the canonical public website.
- The Forge authentication application is proposed architecture only. Do not represent it as deployed or configure it without approval.
- `ne3ula-knowledge` is canonical for philosophy and ontology. Preserve the existing kernel, content, knowledge, and philosophy work here without duplicating or redefining canonical doctrine.

Read these documents before architecture, workflow, deployment, identity, or content-system changes:

- `docs/CURRENT_DEPLOYMENT.md`
- `docs/SOURCE_OF_TRUTH.md`
- `docs/BUILD_WORKFLOW.md`
- `docs/DEV_MAP.md`
- `docs/NAV_SYSTEM_DIAGRAM.md`
- `docs/CODED_SITE_REFERENCE.md` when editing preserved routes, visual work, navigation, or content
- Forge-specific documents when relevant

## Preserve existing work

Keep existing routes, assets, visual language, content systems, NE3ULA kernel, knowledge intake layer, philosophy planning, and approved documentation intact unless a factual correction or explicitly approved change requires otherwise. Do not delete legacy code, move `sveltekit-app/`, rewrite routes, or introduce speculative redesigns.

The legacy route model includes `/`, `/home`, `/myth`, `/music`, `/axzio`, `/e3`, `/engine`, and `/lore`. The coded SvelteKit app currently implements corresponding routes. Preserve their conceptual distinctions and the established restrained, dark, cinematic visual language.

Follow `CODED_SITE_REFERENCE.md` for preserved route purposes, user journey, navigation conventions, visual language, editing priorities, and mobile/responsiveness expectations. That guidance describes the coded experience only; it is not Framer production guidance or canonical philosophy.

## Safe working method

1. Work on a feature branch; never work directly on `main` unless explicitly instructed.
2. Keep diffs focused, minimal, and reviewable.
3. Use feature branches and review gates before integration.
4. Prefer reversible changes and report architecture conflicts before difficult-to-reverse work.
5. Do not change production settings, redirects, DNS, Framer, Cloudflare, or external services without explicit approval.

## Forge and identity boundaries

- A dedicated Forge application at `forge.ne3ula.com` is a recommendation pending approval, not current infrastructure.
- The existing AXZIO Supabase project is the intended shared identity backend, but agents must not connect to it, add credentials, create migrations, or modify it without explicit approval.
- Do not create a second Forge identity system. Future Forge, AXZIO, and AI.d records should use the shared Supabase user UUID.
- Never commit credentials or expose server-only secrets in browser code, Framer, documentation examples, logs, or tests.
- Database migrations, project configuration, redirect URLs, and production deployment configuration all require explicit approval.

## Documentation and content discipline

Clearly distinguish legacy, current repository, current public production, and proposed systems. Mark unknown deployment facts as unknown; do not invent them. Update architecture documentation when a factual architecture claim changes, while preserving still-valid conceptual material.

Do not add or rewrite philosophy, ontology, or conceptual copy unless explicitly requested. Preserve navigation consistency, mobile behavior, shared styles, and approved visual/content work.

## Validation and handoff

Run the relevant existing checks from `sveltekit-app/` for changes that affect it. Separate pre-existing failures from new failures. Summaries must name changed files, validation results, remaining risks, and any approval gate needed for the next phase.
