# NE3ULA Philosophy — Implementation Planning

## Status

This is a planning and architecture document. **Code implementation is deferred pending explicit architecture decisions.**

This document captures audit findings, architectural constraints, and candidate implementation paths for future philosophy site work.

---

## Architecture Foundations

### Philosophy vs Myth: A Critical Distinction

**Philosophy** = The core mission, values, principles, and objectives of NE3ULA
- "Why does this system exist?"
- "What do we believe to be true?"
- "What is the purpose?"

**Myth** = The symbolic narrative embodiment of philosophical truth
- Story. Symbol. Meaning-making through narrative.
- Not the same as philosophy, though deeply related.

**Current site state**: The `/myth` route is designated in the site architecture as the "philosophy layer." However, this docs pass preserves the explicit distinction for future implementation planning.

**Future implementation goal**: Philosophy and myth should be linked but not collapsed into one another. Each has distinct roles in guiding human understanding.

---

## Audit Conclusions

From the Phase 1 audit of the ne3ula-site repository:

1. **Docs are safe to create now** — No architectural conflicts with the /docs/ directory
2. **Code implementation is not yet approved** — This phase is docs-only
3. **Myth is currently designated as the philosophy layer** — From SOURCE_OF_TRUTH.md and site architecture
4. **Dynamic [slug] routing is not currently part of the repo pattern** — All routes are currently static single-page routes
5. **Philosophy vs myth remains an unresolved architecture decision** — Must be explicit before code work begins

### Current site architecture reference
- `/` — Entry threshold
- `/home` — Primary hub
- `/myth` — Philosophy layer (current designation)
- `/music` — Creative signal
- `/axzio` — Interface entry
- `/e3` — Future engine layer
- `/engine` — Future infrastructure layer
- `/lore` — Future narrative archive

---

## Candidate Implementation Paths

**Three possible futures for philosophy implementation** (these are options for future consideration, not approved implementation):

### Path 1: Extend myth as the existing philosophy layer
- Expand the current `/myth` route with the philosophy pages
- Integrate philosophy content into `src/lib/content/myth.ts`
- Use the existing content module pattern
- **Pros**: Minimal architectural change; uses existing patterns
- **Cons**: Blurs the philosophy/myth distinction; doesn't separate concerns
- **Status**: Possible but not recommended long-term

### Path 2: Create separate static philosophy routes (PREFERRED FUTURE PATH)
- Create separate `/philosophy-doctrine/`, `/philosophy-laws/`, etc. routes
- Implement `src/lib/content/philosophy-doctrine.ts`, `philosophy-laws.ts`, etc. modules
- Use static routing following the current site pattern
- Extend `src/lib/content/types.ts` with philosophy ContentKey entries
- Update registry in `src/lib/content/get-content.ts`
- **Pros**: Clear separation of concerns; follows existing patterns; preserves philosophy/myth distinction
- **Cons**: Requires 7 new routes; more files
- **Status**: Recommended as first path if philosophy becomes separate implementation

### Path 3: Implement dynamic [slug] routing
- Create `/philosophy/[slug]/+page.svelte` with dynamic routing
- Implement `src/params/philosophy.ts` param matcher
- Store philosophy pages in a registry
- **Pros**: Scalable; concise file structure
- **Cons**: Introduces new routing pattern not currently used in the site; architectural change; requires deliberate decision
- **Status**: Consider only if architecture is deliberately evolved to support dynamic routing

---

## Constraint: AGENTS.md Architecture Rules

From [docs/AGENTS.md](AGENTS.md):

> "Do not restructure page hierarchy, routes, or folder organization unless explicitly instructed."

> "Unless explicitly requested: do not expand philosophy sections"

**Implication for this work**: Future philosophy implementation must be an explicit architectural decision, not speculative expansion. Any code phase must begin with clear approval to proceed.

---

## Architecture Decision Required Before Code Phase

Before writing any code implementation, the following must be explicit:

1. **Should philosophy be separate from myth?**
   - Yes → Path 2 (static separate routes) is recommended
   - No → Path 1 (extend myth) or integrate into existing philosophy layer

2. **If separate, which routing pattern?**
   - Static routes (Path 2, recommended)
   - Dynamic [slug] routing (Path 3, requires explicit architectural evolution)

3. **Does philosophy require its own components/layout?**
   - Shared PageNav + Footer like other pages? (recommended)
   - Or custom layout?

4. **Should philosophy appear in the knowledge/ layer?**
   - Knowledge layer = source-aligned domain models
   - Content layer = curated public-facing pages
   - Or philosophy-only in content layer?

---

## Previously Explored Implementation Concepts

These were explored during planning but are **not approved for this phase**. Include only if architecture decisions warrant:

- Per-page content modules (philosophy-doctrine.ts, philosophy-laws.ts, etc.)
- Shared philosophy page layout component
- Visual system pass for philosophy pages
- Svelte-ready content structure patterns
- Registry-driven content model updates
- Future validation and QA tooling

---

## Future Implementation Checklist

**Before proceeding to code implementation**:

- [ ] Architecture decision: Is philosophy separate from myth? (explicit approval)
- [ ] Architecture decision: Which routing strategy? (static vs dynamic)
- [ ] Confirm: Should philosophy integrate with knowledge/ layer or content/ only?
- [ ] Confirm: Shared component pattern vs custom layout?
- [ ] Update SOURCE_OF_TRUTH.md with approved architecture if philosophy becomes separate
- [ ] Update AGENTS.md with any new working guidelines for philosophy pages
- [ ] Align future implementation with existing site constraints and patterns
- [ ] Implement only after explicit architecture choice is confirmed in writing

---

## Current Unresolved Questions

These must be answered before Phase 3 (code implementation):

1. **Philosophy vs Myth distinction**: Are they permanently linked within /myth, or should they be separate?
2. **Route count**: Will there be 1 philosophy hub page, 7 separate pages, or a hub + 7 sub-pages?
3. **Dynamic routing**: Is the site ready to introduce [slug]-based routing, or should this wait?
4. **Navigation complexity**: Should philosophy pages link sequentially? Include a pager? Or free navigation?
5. **Visual system**: Should philosophy pages share the /myth aesthetic, or have distinct visual treatment?
6. **Documentation**: Should philosophy be documented in the knowledge/ layer (src/lib/knowledge/), or content-only?

---

## Next Steps

1. **This phase (docs-only)**: Complete and approve the 4 planning docs
2. **Decision phase**: Answer the unresolved questions above in writing
3. **Architecture phase**: Update SOURCE_OF_TRUTH.md and AGENTS.md if new routes are approved
4. **Code phase**: Implement according to approved architecture

**Do not skip the decision phase.**
