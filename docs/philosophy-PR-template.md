# NE3ULA Philosophy — PR Template

## Overview

This PR template is designed for pull requests related to NE3ULA philosophy site implementation.

Use this template when philosophy pages are implemented (code phase).

**Note**: The current phase is docs-only planning. This template will be used in future code implementation PRs.

---

## PR Title Format

```
feat: Add NE3ULA philosophy pages [Doctrine/Laws/Becoming/Functions/Sovereignty/Path]
```

or

```
docs: Add philosophy site planning documentation
```

---

## PR Description Template

### Summary

Briefly describe what this PR adds or changes. Example:

```
This PR implements the [Philosophy Page Name] page for the NE3ULA philosophy site, 
including content, routing, navigation integration, and styling.
```

or for docs PRs:

```
This PR creates planning documentation for the NE3ULA philosophy site, including 
site copy, implementation planning, QA checklist, and PR template.
```

---

### Changes Included

List what is new or modified:

**For code implementation:**
- [ ] New route: `/philosophy-[page-name]/`
- [ ] New content module: `src/lib/content/philosophy-[page-name].ts`
- [ ] Updated `src/lib/content/types.ts` (new ContentKey entries if needed)
- [ ] Updated `src/lib/content/get-content.ts` (registry updates)
- [ ] New page component: `src/routes/philosophy-[page-name]/+page.svelte`
- [ ] Navigation integration (added to /home or philosophy hub)
- [ ] Styling (new or updated CSS)
- [ ] Tests (unit, integration, or e2e as applicable)

**For docs-only PRs:**
- [ ] `docs/philosophy-site-copy.md` (planned public-facing copy)
- [ ] `docs/philosophy-implementation-plan.md` (architecture and planning)
- [ ] `docs/philosophy-QA-checklist.md` (QA validation checklist)
- [ ] `docs/philosophy-PR-template.md` (this template for future use)

---

### Architecture Decisions

Confirm the implementation matches approved decisions:

- [ ] Philosophy pages are [separate from / integrated with] myth
- [ ] Routing strategy used: [static routes / dynamic [slug] / myth-integrated]
- [ ] Philosophy vs myth distinction is [preserved / explicitly documented]
- [ ] Navigation structure: [sequential / hub-based / free nav]
- [ ] No accidental dynamic-routing infrastructure added unless approved

---

### Validation Checklist

**For code PRs**, confirm:

- [ ] All route integrity checks pass (all pages load, no 404s)
- [ ] Navigation flow works as designed
- [ ] Philosophy vs myth distinction is clear
- [ ] CTA flow follows planned sequence
- [ ] Responsive design is functional
- [ ] Page copy matches approved site copy from `philosophy-site-copy.md`
- [ ] No breaking changes to existing routes
- [ ] TypeScript compilation succeeds
- [ ] No console errors

**For docs PRs**, confirm:

- [ ] Docs reviewed for alignment with current site architecture
- [ ] No app code modified in this phase
- [ ] All 4 doc files are present (if doing full docs pass)
- [ ] Architecture uncertainty is explicit (not hidden)
- [ ] Docs preserve philosophy vs myth distinction

---

### Related Issues / Discussions

Link to relevant issues or discussions:

```
Related to: #[issue-number]
Closes: #[issue-number] (if applicable)
```

or

```
Discussed in: feature/philosophy-site-foundation branch
Based on: docs/_staging/PHILOSOPHY_SITE_SOURCE_DRAFT.md
```

---

### Notes for Reviewers

Add context that will help reviewers understand the work:

**For code implementation:**
```
This implements [Page Name] following the established patterns from /myth and /music pages.
The page structure adheres to the sequence and copy defined in philosophy-site-copy.md.
Philosophy/myth distinction is maintained through [specific mechanism].
```

**For docs:**
```
This phase is docs-only planning. No app code has been modified.
These docs capture the planned philosophy site structure and will serve as source material 
for future code implementation.
Architecture decisions about philosophy vs myth, routing strategy, etc. are documented in 
philosophy-implementation-plan.md for visibility and future reference.
```

---

### Testing

Describe testing performed:

**For code PRs:**
```
Manual testing:
- [x] Verified all routes render without errors
- [x] Tested navigation flow on desktop and mobile
- [x] Confirmed responsive behavior
- [x] Validated CTA flow and button behavior

Automated testing:
- [x] No TypeScript errors
- [x] No ESLint violations
- [x] [Any unit/integration tests added]
```

**For docs PRs:**
```
Validation:
- [x] Docs aligned with current site architecture (SOURCE_OF_TRUTH.md, AGENTS.md)
- [x] Philosophy vs myth distinction clearly preserved
- [x] Implementation planning includes deferred status and architecture decisions
- [x] QA checklist is comprehensive and realistic
- [x] PR template is ready for future code-phase PRs
```

---

### Breaking Changes

Confirm there are no breaking changes:

```
- [x] No changes to existing routes
- [x] No changes to existing content modules
- [x] No changes to existing navigation structure (unless intentional)
- [x] No changes to TypeScript contracts
- [x] No changes to styling system (unless intentional)
```

---

### Screenshots / Visual Reference

If applicable, include screenshots or visual references:

**For visual changes:**
```
![Philosophy page hero]()
![Mobile responsive view]()
```

**For documentation work:**
Not required.

---

### Deployment Considerations

Notes for deployment:

```
- This PR does not require special deployment steps.
- No environment variables or configuration changes needed.
- Philosophy pages become available immediately upon merge.
- [Any other deployment notes specific to this PR]
```

---

### Sign-off

Before merging:

**For code PRs:**
- [ ] Code follows AGENTS.md and repo conventions
- [ ] Site architecture is preserved
- [ ] No regressions introduced
- [ ] Documentation (SOURCE_OF_TRUTH.md, AGENTS.md, etc.) updated if necessary
- [ ] Review and approval received

**For docs PRs:**
- [ ] Docs are accurate and aligned with current repo state
- [ ] Architecture uncertainty is clearly marked
- [ ] No app code was modified
- [ ] All 4 planned docs are included (if full docs pass)
- [ ] Review and approval received

---

## Quick Reference

**Current philosophy site planning docs:**
- [docs/philosophy-site-copy.md](philosophy-site-copy.md) — Public-facing copy and messaging
- [docs/philosophy-implementation-plan.md](philosophy-implementation-plan.md) — Architecture and planning decisions
- [docs/philosophy-QA-checklist.md](philosophy-QA-checklist.md) — QA validation checklist
- [docs/philosophy-PR-template.md](philosophy-PR-template.md) — This PR template

**Site architecture reference:**
- [docs/SOURCE_OF_TRUTH.md](SOURCE_OF_TRUTH.md) — Canonical architecture and philosophy
- [docs/AGENTS.md](AGENTS.md) — Agent working guidelines
- [docs/BUILD_WORKFLOW.md](BUILD_WORKFLOW.md) — Development workflow

**Staging material:**
- [docs/_staging/PHILOSOPHY_SITE_SOURCE_DRAFT.md](/_staging/PHILOSOPHY_SITE_SOURCE_DRAFT.md) — Source material for philosophy planning
