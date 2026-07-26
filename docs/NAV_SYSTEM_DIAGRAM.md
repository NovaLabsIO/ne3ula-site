# NE3ULA — Navigation and System Diagram

## Current public production

```mermaid
flowchart LR
    A[ne3ula.com] --> B[Cloudflare redirect]
    B --> C[Framer public website]
```

This production redirect is confirmed context and must not be changed without explicit approval.

## Current repository route model

```mermaid
flowchart TD
    A["/ Entry Threshold"] --> B["/home Primary Hub"]
    B --> C["/music Creative Signal"]
    B --> D["/myth Philosophy Layer"]
    B --> E["/axzio Interface Entry"]
    B --> F["/e3 Engine Layer"]
    F --> G["/engine Infrastructure Layer"]
    F --> H["/lore Narrative Layer"]
```

This diagram represents preserved legacy/static and SvelteKit coded routes. It is not the public-production navigation map.

See `CODED_SITE_REFERENCE.md` for the coded route purposes, existing user journey, and navigation conventions.

## Proposed Forge navigation (not implemented)

```mermaid
flowchart LR
    F[Framer CTA] -. proposed link .-> G[forge.ne3ula.com/]
    G --> L[/login]
    G --> J[/join]
    L --> C[/auth/callback]
    J --> C
    C --> D[/dashboard]
    L --> R[/auth/reset-password]
```

The Forge diagram is a recommendation pending approval. No routes, DNS, redirects, or deployments are configured by this document.
