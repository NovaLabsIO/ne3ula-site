# Proposed Framer–Forge Integration

## Boundary

Framer remains the public NE3ULA presentation layer. The Forge is proposed as a separate authenticated application at `forge.ne3ula.com`, implemented by the coded application and backed by the existing AXZIO Supabase project after approval.

Framer calls to action should link to the Forge; Framer should not host privileged authentication logic, service-role credentials, private member data, or sensitive Supabase operations.

## Expected future user flow

```text
Framer public page
→ Forge registration or login
→ email verification (as required)
→ Forge onboarding/application
→ protected member dashboard
```

The planned application routes are `/`, `/login`, `/join`, `/dashboard`, `/auth/callback`, and `/auth/reset-password` on the proposed Forge origin. They are documented, not implemented.

## Continuity requirements

- Keep NE3ULA branding, tone, navigation expectations, accessibility, and trust signals consistent across Framer and Forge.
- Use a clearly recognized Forge URL and return paths that do not confuse the public site with the authenticated application.
- Preserve the existing `ne3ula.com` Cloudflare redirect to Framer.
- Configure authentication callback/reset URLs only after their exact domains, environments, and deployment runtime are approved.

## Decisions still requiring approval

- Whether `forge.ne3ula.com` is the final application origin.
- Cloudflare DNS, routing, deployment target, and certificate configuration.
- The Framer CTA copy, placements, and links.
- Supabase project access, environment separation, redirect allowlists, and email configuration.
- Application branding, navigation, onboarding data, and production release criteria.
