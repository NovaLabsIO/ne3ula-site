# Forge Implementation Plan

This staged plan is proposed. Completion of one phase does not authorize the next; every phase requires its stated approval gate.

## Phase 1 — Audit and documentation

- **Scope:** Reconcile repository and production architecture, document the proposed Forge boundary, and add inert local scaffolding.
- **Deliverables:** Architecture, deployment, Supabase, security, Framer integration, and implementation-plan documents; placeholder environment/config/migration paths.
- **Prerequisites:** Access to the repository and confirmed current production context.
- **Validation:** Documentation review, git diff review, ignore/secrets audit, and existing app checks where practical.
- **Approval gate:** Approve the audit findings and proposed direction before connecting any service.
- **Rollback:** Revert documentation/scaffolding commit; no external state exists.

## Phase 2 — Supabase connection and migrations

- **Scope:** Confirm AXZIO Supabase ownership/environments; add approved client/server integration and reviewed schema migrations.
- **Deliverables:** Environment configuration, migrations for profiles and Forge memberships, RLS policies, and migration records.
- **Prerequisites:** Explicit approval, project access, environment mapping, data model, RLS review, and rollback plan.
- **Validation:** Non-production migration tests, policy tests, schema review, and secret-handling review.
- **Approval gate:** Explicit approval before project connection and each production migration.
- **Rollback:** Tested down/compensating migration where safe; restore configuration without deleting user data.

## Phase 3 — Authentication foundation

- **Scope:** Implement approved sign-up, sign-in, sign-out, session, callback, verification, and reset foundations.
- **Deliverables:** Auth routes, server/session handling, guarded route foundation, error states, and tests.
- **Prerequisites:** Phase 2 complete; approved redirect allowlists, email behavior, RLS, and server runtime strategy.
- **Validation:** Local/non-production auth scenarios, unauthorized-access tests, callback/reset tests, and security review.
- **Approval gate:** Approve identity UX, session policy, and production auth configuration.
- **Rollback:** Disable application auth entry/deployment while preserving identity data; do not delete `auth.users` without separate approval.

## Phase 4 — Forge onboarding/application

- **Scope:** Build approved registration, onboarding, application, and membership-submission flows.
- **Deliverables:** Forge join flow, profile/membership writes, validation, consent/copy, and tests.
- **Prerequisites:** Phase 3 complete and approved data fields, retention, review workflow, and RLS policies.
- **Validation:** Field validation, user-owned write/read checks, privacy review, and accessibility review.
- **Approval gate:** Approve user data collection, membership statuses, and operational review process.
- **Rollback:** Disable intake writes and preserve submitted data according to approved retention policy.

## Phase 5 — Protected member dashboard

- **Scope:** Implement authenticated dashboard and approved member experiences.
- **Deliverables:** Protected dashboard, membership state views, profile controls, empty/error states, and tests.
- **Prerequisites:** Phase 4 complete and defined authorization/status behavior.
- **Validation:** Cross-user denial tests, session-expiry behavior, accessibility, and end-to-end checks.
- **Approval gate:** Approve dashboard content, access rules, and support/operations model.
- **Rollback:** Remove public entry to the dashboard or disable deployment while retaining governed data.

## Phase 6 — Framer linking, subdomain, and Cloudflare deployment

- **Scope:** Link Framer calls to action, provision/route the approved Forge origin, and deploy the approved application.
- **Deliverables:** Approved Framer links, `forge.ne3ula.com` configuration, production runtime configuration, monitoring, and runbook.
- **Prerequisites:** Phases 2–5 validated; explicit Cloudflare, Framer, DNS, redirect, and deployment approval.
- **Validation:** Domain/certificate checks, callback allowlist verification, production smoke tests, redirect preservation, and rollback rehearsal.
- **Approval gate:** Explicit production cutover approval.
- **Rollback:** Revert Framer CTA/link and Forge routing to the prior approved state without changing `ne3ula.com` redirect behavior.

## Phase 7 — AXZIO and AI.d integration

- **Scope:** Add approved cross-application experiences using the shared user UUID.
- **Deliverables:** Referenced data models, authorization contracts, integration UX, and observability.
- **Prerequisites:** Stable Forge identity model, approved AXZIO/AI.d scopes, and cross-system privacy/security review.
- **Validation:** UUID continuity, least-privilege access, cross-user isolation, and integration end-to-end tests.
- **Approval gate:** Approve each product/data-sharing boundary separately.
- **Rollback:** Disable integration features while retaining the shared canonical identity; avoid duplicate accounts or destructive identity migration.
