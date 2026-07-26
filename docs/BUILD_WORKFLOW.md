# NE3ULA — Build Workflow

## Scope and production boundary

This repository supports coded NE3ULA applications and system foundations. Framer is the current public website. `ne3ula.com` redirects through Cloudflare to Framer and must remain unchanged unless explicit approval authorizes a production change.

Neither a commit nor a successful SvelteKit build implies a public deployment. Current deployment wiring for the legacy and SvelteKit implementations is unknown from the tracked repository files; do not infer or modify it.

## Working model

1. Confirm the current branch with `git status --short --branch`.
2. Work on an approved feature branch; do not switch branches, merge, push, or change `main` without explicit instruction.
3. Read `docs/AGENTS.md`, `docs/CURRENT_DEPLOYMENT.md`, and the architecture documents relevant to the task.
4. Make focused, reversible changes and preserve existing visual, content, kernel, knowledge, and philosophy work.
5. Run validation from `sveltekit-app/` when that application is affected.
6. Present a reviewable diff and wait for approval before any deployment, production configuration, database migration, or external-service change.

For preserved coded-site route, style, content, navigation, and responsiveness guidance, read `docs/CODED_SITE_REFERENCE.md` before editing. It applies to repository code, not the Framer production website.

## Local SvelteKit workflow

From `sveltekit-app/`:

```sh
pnpm install --frozen-lockfile # only when dependencies are absent
pnpm check
pnpm lint
pnpm build
pnpm test:unit -- --run
pnpm test:e2e
```

Use the existing `pnpm-lock.yaml`; do not add packages or change deployment adapters unless approved. If a command fails, distinguish inherited failures from failures introduced by the current change.

## Environment handling

- Put local application configuration in untracked `.env*` files inside `sveltekit-app/`.
- Commit only `sveltekit-app/.env.example` with placeholder names.
- Variables prefixed `PUBLIC_` are browser-visible. Server-only credentials must never use that prefix and must never be committed, logged, or placed in Framer/browser code.
- Local Supabase CLI state is ignored. Do not connect to Supabase, create migrations, or add project identifiers during preparatory work.

## Deployment and database approvals

The Cloudflare adapter in `sveltekit-app/` is a build capability, not confirmation of a live deployment. Any decision to deploy Forge, configure `forge.ne3ula.com`, alter redirect URLs, configure Cloudflare, connect Supabase, or run a migration requires explicit approval after review.
