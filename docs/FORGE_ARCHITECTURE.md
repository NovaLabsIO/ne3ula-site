# Proposed Forge Architecture

## Status

This is a proposed architecture, not an implementation or deployment decision.

## Role

The Forge is NE3ULA's community participation layer. It should provide an authenticated path for membership, onboarding, contribution, and future access into AXZIO and AI.d while preserving one shared identity.

## Proposed boundaries

| Boundary | Proposed responsibility |
| --- | --- |
| Framer | Public presentation, marketing, and calls to action |
| `forge.ne3ula.com` | Dedicated authenticated Forge application boundary |
| `sveltekit-app/` | Candidate codebase for the Forge application |
| Existing AXZIO Supabase project | Shared authentication and application-data backend |
| `ne3ula-knowledge` | Canonical philosophy and ontology |

Framer should link into the Forge rather than host authenticated data operations. The coded application should handle session-aware application behavior. Supabase should provide shared identity and data under security policies approved in a later phase.

## Recommended application boundary

Recommend option A: a dedicated `forge.ne3ula.com` application origin.

Its proposed route model is:

- `forge.ne3ula.com/` — Forge landing/application entry (documented internally as `/forge`)
- `forge.ne3ula.com/login`
- `forge.ne3ula.com/join`
- `forge.ne3ula.com/dashboard`
- `forge.ne3ula.com/auth/callback`
- `forge.ne3ula.com/auth/reset-password`

A dedicated origin separates the public Framer experience from authenticated application state, allows focused session/callback configuration, avoids disrupting preserved legacy routes, and creates a clear future integration point for AXZIO and AI.d. It does **not** authorize DNS, Cloudflare, deployment, or redirect configuration.

## Shared identity and data ownership

```text
auth.users
└── canonical authentication identity (UUID)
    ├── public.profiles — universal NE3ULA profile
    ├── public.forge_applications — user-submitted Forge interest, intent, and application data
    ├── public.forge_memberships — administrator-controlled membership state, contribution role, path, and joining data
    ├── future AXZIO tables — reference auth.users.id
    └── future AI.d tables — reference auth.users.id
```

The Forge must not create a separate user or authentication system. Application data, membership administration, and universal identity data are separate concerns. Canonical philosophy/ontology must remain outside application-owned records.
