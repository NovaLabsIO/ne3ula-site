# Authentication Security Requirements

## Security model

Authentication UI is not a security boundary. Every private operation must be enforced by backend authorization, Row Level Security (RLS), and carefully scoped server-side access.

## Required controls for a future implementation

- Enable RLS on all exposed application tables, including `public.profiles` and `public.forge_memberships`.
- Create user-owned policies that limit reads and writes to records whose user key matches the authenticated user UUID.
- Use foreign keys and constraints so membership and future AXZIO/AI.d records reference `auth.users.id`.
- Keep service-role access server-only, minimal, and limited to approved administrative/background operations. Never expose it to the browser, Framer, logs, or committed files.
- Verify sessions server-side where access decisions affect private data; do not rely solely on client-side redirects or hidden UI.
- Validate callback state, use approved redirect allowlists, and handle expired, invalid, or replayed authentication flows safely.
- Require verified email behavior and a secure password-reset flow with time-limited, approved callback URLs.
- Protect private membership/application data from public reads, cross-user access, and enumeration.
- Return safe user-facing errors while logging only necessary operational metadata. Never log passwords, tokens, full session data, service-role credentials, or sensitive application answers.

## Session and callback handling

Session storage, refresh behavior, cookie flags, callback routes, and logout behavior require a framework-specific design review before implementation. The planned `/auth/callback` and `/auth/reset-password` routes must handle only expected flows and must not expose tokens in URLs, analytics, client logs, or referrers.

## Framer and browser boundary

Framer remains the presentation layer. It must not contain service-role credentials or privileged Supabase operations. Browser-visible publishable configuration is not sufficient authorization; RLS and server-side policy checks remain required.

## Approval gate

Before Phase 3, approve the data model, RLS policies, session strategy, email templates/verification behavior, reset flow, redirect allowlists, server runtime, monitoring, and incident/rollback plan.
