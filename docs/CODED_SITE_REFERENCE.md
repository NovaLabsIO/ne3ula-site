# Preserved Coded-Site Reference

## Status and purpose

This document preserves still-valid guidance for the legacy static implementation and the SvelteKit coded experience in this repository. It is **not** a description of current Framer production, and it does not replace the canonical NE3ULA philosophy or ontology maintained in `ne3ula-knowledge`.

Use it when editing preserved coded routes, assets, styles, navigation, or future coded-system work. See `CURRENT_DEPLOYMENT.md` for production facts.

## Conceptual stack

```text
NE3ULA = space
Myth = meaning
AXZIO = interface
E3 = engine
```

Within the coded experience:

- **NE3ULA** represents the empty field, potential, awareness, and the space where creation becomes possible.
- **Myth** applies meaning to chaos through narrative structure and identity formation.
- **AXZIO** is the interactive reflection, creation, and becoming interface.
- **E3** is the future engine and long-term infrastructure layer.

These descriptions guide presentation and route intent only. Do not use this repository to redefine canonical philosophy or ontology.

## Preserved route purposes

| Route | Coded-experience purpose |
| --- | --- |
| `/` | Entry threshold: a minimalist, symbolic, cinematic pause before entering the system; not a conventional homepage. |
| `/home` | Primary navigation hub for the main coded paths. |
| `/myth` | Philosophy anchor and meaning layer, including The Space Between, From Chaos to Creation, and The Architecture of Becoming. |
| `/music` | Creative signal: releases, external channels, production services, and products. |
| `/axzio` | Interface entry centered on Reflect, Create, and Become. |
| `/e3` | Future engine layer. |
| `/engine` | Future infrastructure/system architecture layer. |
| `/lore` | Future narrative archive. |

Do not merge, remove, rename, or repurpose conceptually distinct routes without explicit approval.

## Coded user journey and navigation

```text
Visitor
→ / entry threshold
→ /home navigation hub
→ Music | Myth | AXZIO | E3
```

Navigation should preserve the existing path-based experience rather than turn it into a conventional, cluttered hierarchy. Where applicable, maintain the established primary ordering:

```text
Music → Myth → AXZIO → E3
```

Avoid self-links where intentionally removed. Keep top-level navigation patterns and subpage relationships consistent with their parent system.

## Visual and interaction language

The preserved coded experience uses:

- dark black/white or dark cosmic foundations
- restrained glassmorphism where already established
- subtle gradients and blurred overlays
- minimal typography and high contrast
- atmospheric, quiet motion
- cinematic spacing and premium restraint

It should feel calm, intentional, spacious, symbolic, and premium. Avoid new color systems, bright or saturated treatments, excessive gradients, flashy/aggressive animation, clutter, and conventional marketing aesthetics.

## Editing priorities

When working on the coded experience, prioritize:

1. Preserving route architecture and conceptual distinctions.
2. Preserving existing content and approved copy unless a rewrite is requested.
3. Reusing shared styles and components before adding one-off overrides.
4. Maintaining or improving mobile responsiveness.
5. Keeping pages visually cohesive with established `/myth` and `/axzio` patterns.
6. Keeping changes focused by category, such as styling, navigation, responsiveness, or page work.

For legacy static work, shared styles live in `shared/styles.css`; prefer shared-system changes over duplicated page CSS. For SvelteKit work, preserve existing components, `src/lib/content/`, `src/lib/ne3ula/`, and `src/lib/knowledge/` boundaries.

## Content and documentation discipline

Unless explicitly requested, do not invent new conceptual copy, expand philosophy sections, or create new conceptual site sections. Keep small wording changes minimal and purposeful.

When a change materially affects coded architecture, navigation, workflow, or developer behavior, update the relevant documentation. Keep diffs small, avoid unrelated formatting churn, and summarize changed files and reasons.

## Future coded-system intentions

The preserved coded roadmap remains useful as a design reference, not a deployment commitment:

- Stabilize and refine `/home`, `/myth`, and `/music`, including mobile and visual consistency.
- Expand AXZIO through future Reflect, Create, and Become paths when approved.
- Develop the E3, engine, and lore layers as intentional coded experiences when approved.

Future work must remain compatible with the current production boundary: Framer is public production, while this repository preserves coded-system work and may later host an approved Forge application.
