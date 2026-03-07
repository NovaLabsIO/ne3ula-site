# NE3ULA Core — Agent Instructions

This file defines how AI coding agents should behave when working in the NE3ULA core repository.

Agents must follow these instructions unless the user explicitly overrides them.

---

# 1. Project Context

This repository contains the core NE3ULA website.

The project is a static site deployed through:

GitHub → Cloudflare Pages

The canonical project documentation lives in:

- docs/SOURCE_OF_TRUTH.md
- docs/BUILD_WORKFLOW.md
- docs/DEV_MAP.md
- docs/NAV_SYSTEM_DIAGRAM.md

Before making changes, review those files for architectural and workflow context.

---

# 2. Canonical Architecture

The conceptual stack is:

NE3ULA = space  
Myth = meaning  
AXZIO = interface  
E3 = engine  

The current site architecture is centered around:

- `/` → entry threshold
- `/home` → primary hub
- `/myth` → philosophy layer
- `/music` → creative signal
- `/axzio` → interface entry
- `/e3` → future engine layer
- `/engine` → future infrastructure layer
- `/lore` → future narrative layer

Do not restructure page hierarchy, routes, or folder organization unless explicitly instructed.

Do not merge or remove conceptually distinct routes unless explicitly instructed.

---

# 3. Safe Working Method

Agents should assume the preferred workflow is:

1. Work on a feature branch, not `main`
2. Keep tasks tightly scoped
3. Keep diffs minimal and reviewable
4. Preserve architecture unless explicitly instructed otherwise
5. Prefer reversible changes

If the user requests a major refactor, break the work into smaller bounded steps where possible.

Preferred task style:

- one category of change per run
- styling only
- navigation only
- responsiveness only
- page creation only

Avoid bundling multiple large refactors into one task unless explicitly requested.

---

# 4. Editing Priorities

When making changes, prioritize the following:

1. Preserve site architecture
2. Preserve page routing
3. Preserve existing content and copy unless explicitly instructed to rewrite
4. Prefer shared styles and reusable systems
5. Maintain or improve mobile responsiveness
6. Keep the site visually cohesive with the established NE3ULA aesthetic

Do not introduce unnecessary frameworks, tooling, or dependencies unless explicitly requested.

Do not perform speculative redesigns.

Do not rename files, folders, or routes without clear instruction.

---

# 5. Visual Design Rules

The established visual language is:

- dark black / white palette
- restrained, cinematic tone
- subtle glassmorphism where already used
- minimal typography
- atmospheric, subtle motion
- high contrast, premium restraint

Avoid:

- introducing new color systems without instruction
- overusing gradients
- bright or saturated UI treatments that drift from the core black/white look
- flashy animation
- cluttered layouts

The site should feel:

- calm
- intentional
- spacious
- symbolic
- premium

When aligning inconsistent pages, match them to the core aesthetic already used by pages like `/myth` and `/axzio`.

---

# 6. Styling Rules

Shared styling lives in:

- `/shared/styles.css`

When possible:

- prefer updating `/shared/styles.css`
- reduce page-specific style duplication
- avoid one-off visual overrides unless necessary

If page-specific styling is required, keep it minimal and aligned with the shared system.

Do not introduce visual drift between pages.

---

# 7. Content Rules

Unless explicitly requested:

- do not add new conceptual copy
- do not rewrite page messaging
- do not expand philosophy sections
- do not invent new site sections

Default assumption:
The task is implementation, polish, refactor, or consistency — not new conceptual development.

If minor wording changes are necessary for layout or consistency, keep them minimal.

---

# 8. Navigation Rules

Maintain consistent navigation order where applicable:

Music  
Myth  
AXZIO  
E3  

Avoid self-links where they are intentionally removed.

Do not introduce inconsistent navigation patterns across top-level pages.

Subpages should remain consistent with the parent site system.

---

# 9. Documentation Rules

When a task materially changes architecture, workflow, or developer behavior, update the relevant docs if appropriate:

- docs/SOURCE_OF_TRUTH.md
- docs/BUILD_WORKFLOW.md
- docs/DEV_MAP.md
- docs/NAV_SYSTEM_DIAGRAM.md

Do not update docs unnecessarily for small styling changes.

If a change affects agent behavior or preferred repo workflow, update this file.

---

# 10. Diff Discipline

Preferred output from an agent task:

- small, focused changes
- minimal unrelated edits
- no unnecessary formatting churn
- concise summary of modified files
- concise explanation of why each changed file was modified

Avoid touching unrelated files.

Avoid broad repo-wide edits unless explicitly requested.

---

# 11. Task Execution Pattern

For most tasks, follow this pattern:

1. Read relevant docs in `/docs`
2. Inspect only the files relevant to the task
3. Make the smallest effective set of changes
4. Preserve structure and behavior
5. Summarize the changed files clearly

When working on styling tasks, likely relevant files include:

- `/shared/styles.css`
- page-specific `index.html` files for the target routes

When working on architecture tasks, consult docs first before editing.

---

# 12. Branching and Safety Assumptions

Assume the preferred development model is:

- `main` = stable / production-oriented branch
- feature branches = safe working branches for experiments and refactors

Agents should avoid assuming work should be done directly on `main`.

If asked to make a risky change, prefer doing it in a way that is easy to review and revert.

---

# 13. Deployment Awareness

This repo deploys through GitHub to Cloudflare Pages.

Agents do not need to redesign deployment workflow unless explicitly instructed.

Do not make deployment-related changes unless the task specifically concerns deployment.

---

# 14. Default Prompt Interpretation

If a prompt is ambiguous, prefer the narrowest reasonable interpretation.

Example:
If the user says “unify styling,” interpret that as:
- visual consistency
- no architecture rewrite
- no major copy rewrite
- shared style cleanup where appropriate

If the user says “improve page,” prefer polish and usability improvements over conceptual invention.

---

# 15. NE3ULA-Specific Principle

This repository is not a generic marketing site.

It is a symbolic, layered gateway into the NE3ULA system.

Agents should preserve that tone and not flatten it into a conventional startup or SaaS aesthetic.

The site should feel like:
- an entry point
- a path system
- a mythic interface
- a restrained premium experience

---

End of document.