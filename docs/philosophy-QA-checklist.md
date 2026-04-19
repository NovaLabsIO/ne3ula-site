# NE3ULA Philosophy — QA Checklist

## Overview

This QA checklist applies to the philosophy implementation when it is ready to move from planning to code phase.

**Status**: Planning document. To be used when philosophy pages are implemented.

---

## Pre-Implementation Validation

Before beginning code implementation, confirm:

- [ ] Architecture decision document is finalized (which routing path? philosophy separate or part of myth?)
- [ ] Philosophy vs myth distinction is explicit in SOURCE_OF_TRUTH.md or a related doc
- [ ] Route strategy is approved (static routes, dynamic routing, or myth-integrated)
- [ ] Page order and purposes are final
- [ ] Site copy is approved for public use
- [ ] Nav structure is approved
- [ ] Philosophy pages will not conflict with /myth or other existing routes

---

## Content Validation

Confirm the intended content structure:

- [ ] All 6 main philosophy pages planned (Doctrine, Laws, Becoming, Functions, Sovereignty, Path)
- [ ] Principles page exists as reference layer
- [ ] Hero text is strong and clear for each page
- [ ] CTA flow follows the planned sequence
- [ ] Page purposes are distinct and coherent
- [ ] Copy preserves the intended tone and language

---

## Route Integrity

For each philosophy page, confirm it loads and renders correctly:

- [ ] Doctrine page loads at intended route
- [ ] Laws page loads at intended route
- [ ] Becoming page loads at intended route
- [ ] Functions page loads at intended route
- [ ] Sovereignty page loads at intended route
- [ ] Path page loads at intended route
- [ ] Principles page loads at intended route
- [ ] No 404 errors on any intended routes
- [ ] Routes match the approved routing strategy (static or dynamic)

---

## Navigation

Confirm navigation behavior:

- [ ] Primary navigation order is correct (Doctrine → Laws → Becoming → Functions → Sovereignty → Path)
- [ ] Forward navigation (next page buttons) works correctly
- [ ] Active state is correctly indicated for current page
- [ ] Philosophy pages do not incorrectly link to/from myth pages unless intentionally designed
- [ ] Philosophy pages do not appear in myth navigation unless explicitly planned
- [ ] Return/previous navigation is consistent
- [ ] Secondary CTAs link to appropriate related pages

---

## Philosophy vs Myth Distinction

Critical architecture validation:

- [ ] Philosophy pages are visually or navigationally distinct from myth pages
- [ ] Navigation clearly shows philosophy vs myth as separate sections
- [ ] If philosophy and myth are related, links between them are intentional (not accidental)
- [ ] No confusion between philosophy content and myth/narrative content
- [ ] Architecture documentation reflects the final philosophy/myth relationship
- [ ] No unintentional merging of philosophical and mythological content

---

## Call-to-Action Flow

Confirm the CTA sequence:

- [ ] Doctrine page CTAs point to Laws
- [ ] Laws page CTAs point to Becoming or Principles
- [ ] Becoming page CTAs point to Functions
- [ ] Functions page CTAs point to Sovereignty
- [ ] Sovereignty page CTAs point to Path
- [ ] Path page CTAs return to Doctrine
- [ ] Principles page CTAs point back to Laws or Doctrine
- [ ] Secondary CTAs link to relevant related pages
- [ ] Button labels are clear and consistent
- [ ] CTA copy matches approved site copy

---

## Page Hierarchy

Confirm structure and flow:

- [ ] Page hierarchy is coherent (entry → core principles → application → ethics → practice)
- [ ] No orphaned pages (all have navigation context)
- [ ] Sequence makes pedagogical sense
- [ ] Philosophy pages do not conflict with site hierarchy as defined in SOURCE_OF_TRUTH.md
- [ ] Deep-linking is possible for all pages
- [ ] Page titles are consistent and clear

---

## Layout & Visual Design

Confirm visual presentation:

- [ ] Hero section spacing is clean and intentional
- [ ] Hero copy is prominent and readable
- [ ] Section headings are clear and hierarchical
- [ ] Copy blocks are readable (line length, line spacing, typography)
- [ ] CTA buttons are clear and prominent
- [ ] Responsive design maintains structure on mobile
- [ ] Visual treatment is consistent across all philosophy pages
- [ ] Color/styling aligns with site aesthetic or is intentionally distinct
- [ ] No visual conflicts with existing pages

---

## Component & Module Integration

Confirm code structure (if applicable):

- [ ] Content modules follow the existing pattern (content/philosophy-*.ts or equivalent)
- [ ] Content types match the ContentPage/ContentSection contract
- [ ] Registry is updated with new philosophy content keys
- [ ] Components use existing PageNav and Footer patterns (or justified alternatives)
- [ ] No duplicate component code
- [ ] Imports and exports are correct
- [ ] TypeScript types are correctly applied
- [ ] No console errors or warnings

---

## Accessibility & Semantics

Confirm best practices:

- [ ] Page titles are unique and descriptive
- [ ] Meta descriptions are accurate
- [ ] Headings use semantic hierarchy (h1, h2, h3, etc.)
- [ ] Links have descriptive text (not "click here")
- [ ] Images (if any) have alt text
- [ ] Color contrast meets WCAG standards
- [ ] Navigation is keyboard accessible
- [ ] Page structure is clear to screen readers

---

## Browser & Device Testing

Confirm cross-platform functionality:

- [ ] Pages render correctly on desktop (Chrome, Firefox, Safari)
- [ ] Pages render correctly on mobile (iOS Safari, Android Chrome)
- [ ] Responsive breakpoints work as intended
- [ ] No horizontal scrolling on mobile
- [ ] Touch targets are appropriately sized
- [ ] Performance is acceptable (no major lag)

---

## Architecture Compliance

Confirm alignment with repository standards:

- [ ] Implementation follows the pattern established by /myth, /music, /axzio pages
- [ ] No new undocumented patterns introduced
- [ ] Changes comply with AGENTS.md working guidelines
- [ ] Philosophy/myth relationship is explicit (not ambiguous)
- [ ] No speculative code or over-engineering
- [ ] Diffs are focused and reviewable
- [ ] No unnecessary changes to unrelated files

---

## Post-Implementation

After all pages are live:

- [ ] Philosophy pages appear in site navigation where intended
- [ ] Philosophy pages are discoverable from /home
- [ ] Philosophy pages are indexed by search if applicable
- [ ] No regressions in existing functionality
- [ ] Documentation (SOURCE_OF_TRUTH.md, AGENTS.md, etc.) has been updated
- [ ] Site feels coherent with philosophy pages integrated
