# Forge Implementation Plan

This staged plan is proposed. Completion of one phase does not authorize the next; every phase requires its stated approval gate.

## Phase 1 — Audit and documentation

- **Scope:** Reconcile repository and production architecture, document the proposed Forge boundary, and add inert local scaffolding.
- **Deliverables:** Architecture, deployment, Supabase, security, Framer integration, and implementation-plan documents; placeholder environment/config/migration paths.
- **Prerequisites:** Access to the repository and confirmed current production context.
- **Validation:** Documentation review, git diff review, ignore/secrets audit, and existing app checks where practical.
- **Approval gate:** Approve the audit findings and proposed direction before connecting any service.
- **Rollback:** Revert documentation/scaffolding commit; no external state exists.

## Phase 2A — Audit and baseline design

- **Scope:** Confirm the provisional development classification, document the observed AXZIO schema, and prepare non-executable Forge schema/RLS design drafts.
- **Deliverables:** Read-only audit record, observational schema baseline, unresolved-decision register, and design-only SQL for profiles, applications, memberships, RLS, and timestamp handling outside the migration directory.
- **Prerequisites:** Explicit approval for local design work; no remote mutation authority.
- **Validation:** Documentation review, design security review, diff/secret review, and confirmation that remote state remains unchanged.
- **Approval gate:** Approve the project classification, baseline, and proposed data/RLS direction before creating local migrations or connecting application code.
- **Rollback:** Revert local design files only; no remote state exists.

## Phase 2B — Local migration and RLS design

- **Scope:** Turn approved design drafts into reviewed local migration candidates and test plans without applying them remotely.
- **Deliverables:** Timestamped local migration candidates, policy/grant test cases, application-submission operation design, membership-administration design, baseline reconciliation plan, and rollback/compensation plan.
- **Prerequisites:** Phase 2A approval; approved product decisions, data model, and security direction.
- **Validation:** SQL review, least-privilege review, cross-user policy test design, and secret-handling review.
- **Approval gate:** Approve the exact local migration candidates and development-project application plan.
- **Rollback:** Revise or remove unapproved local candidates; no remote state exists.

## Phase 2C — Development-project application

- **Scope:** Apply explicitly approved migrations only to the confirmed development project and validate the resulting metadata and policies.
- **Deliverables:** Applied development migration record, validation evidence, and any approved development-only configuration.
- **Prerequisites:** Phase 2B approval, confirmed project ownership, development-environment confirmation, backup/rollback plan, and explicit remote-change authorization.
- **Validation:** Migration execution review, policy tests, schema comparison, and no-anonymous/cross-user access checks.
- **Approval gate:** Approve completion of development validation before preview/production planning.
- **Rollback:** Use the approved compensating or rollback procedure; do not delete user data.

## Phase 2D — Validation and production-environment planning

- **Scope:** Plan isolated preview and production environments, deployment configuration, migration promotion, monitoring, and rollback.
- **Deliverables:** Environment map, promotion checklist, production migration plan, observability plan, and operational runbook.
- **Prerequisites:** Phase 2C validation, approved environment ownership, and the approved data/security direction from Phase 2A–2C.
- **Validation:** Environment separation review, redirect allowlist review, rollback rehearsal plan, and production-readiness review.
- **Approval gate:** Explicit approval of preview/production environment creation, configuration, and any production migration.
- **Rollback:** Preserve the development baseline and use the approved environment-specific rollback plan.

## Phase 3 — Authentication foundation

- **Scope:** Implement approved sign-up, sign-in, sign-out, session, callback, verification, and reset foundations.
- **Deliverables:** Auth routes, server/session handling, guarded route foundation, error states, and tests.
- **Prerequisites:** Phase 2C development validation and Phase 2D environment plan; approved redirect allowlists, email behavior, RLS, and server runtime strategy.
- **Validation:** Local/non-production auth scenarios, unauthorized-access tests, callback/reset tests, and security review.
- **Approval gate:** Approve identity UX, session policy, and production auth configuration.
- **Rollback:** Disable application auth entry/deployment while preserving identity data; do not delete `auth.users` without separate approval.

## Phase 4 — Forge onboarding/application

- **Scope:** Build approved registration, onboarding, application, and membership-submission flows.
- **Deliverables:** Forge join flow, profile and application-draft writes, approved server-side submission flow, validation, consent/copy, and tests.
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
