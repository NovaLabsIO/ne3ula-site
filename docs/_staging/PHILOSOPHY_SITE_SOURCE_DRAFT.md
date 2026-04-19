# Philosophy Site Source Draft
## Status
Staging source for philosophy-site planning docs.
Not a final canonical implementation file.
Use as source material for docs creation only.

---

# 1. SITE HIERARCHY

## Recommended page order
1. Doctrine
2. Laws
3. Becoming
4. Functions
5. Sovereignty
6. Path
7. Principles as supporting/deep reference

## Suggested navigation
- Doctrine
- Laws
- Becoming
- Functions
- Sovereignty
- Path

## Suggested route flow
Doctrine → Laws → Becoming → Functions → Sovereignty → Path

## Page purposes
- Doctrine = what NE3ULA is
- Laws = the condensed philosophical core
- Becoming = why it matters to the human being
- Functions = how the system works
- Sovereignty = why the individual remains above the system
- Path = where doctrine becomes practice

---

# 2. SITE COPY BLOCKS

## Doctrine
### Hero
NE3ULA  
A living framework for conscious becoming

NE3ULA exists to help human beings reveal pattern, reduce distortion, align with truth, act with precision, and integrate experience into identity.

Primary CTA: Read the Doctrine  
Secondary CTA: Explore the Laws

### Intro
NE3ULA is not a belief system. It does not ask for blind faith, obedience, or dependency. It is a symbolic and practical interface for understanding the self, interpreting reality, and participating more consciously in one's own becoming.

### Key sections
- What NE3ULA Is
- What We Hold To Be True
- Purpose
- Final Law

### Bottom CTA
Next: The Seven Laws  
Button: Enter the Laws

---

## Laws
### Hero
The Seven Laws of NE3ULA  
The core principles beneath the system

These laws are not rigid dogma. They are orienting principles for clearer perception, stronger authorship, and conscious becoming.

Primary CTA: Read the Seven Laws  
Secondary CTA: View Full Principles

### Intro
The Seven Laws distill the philosophical core of NE3ULA into a form that is memorable, practical, and public-facing.

### Law list
1. Truth Is Real, But Access Is Partial
2. Perception Shapes Experience
3. Repetition Becomes Identity
4. Action Reveals Alignment
5. Polarity Must Be Integrated
6. The Individual Remains Sovereign
7. Everything Must Serve Conscious Becoming

### Bottom CTA
Next: Becoming  
Button: Continue to Becoming

---

## Becoming
### Hero
Becoming  
The life you are forming

A human being is not a fixed thing. A human being is a living process shaped by perception, meaning, repetition, action, and response.

Primary CTA: Read Becoming  
Secondary CTA: Explore the Functions

### Intro
We are always becoming something. The question is whether that becoming is conscious. NE3ULA exists to help bring that process into awareness so identity becomes less accidental and more authored.

### Key sections
- Identity Is Formed
- Repetition Is Not Destiny
- Alignment Over Performance
- Authorship

### Bottom CTA
Next: The Five Functions  
Button: See How It Works

---

## Functions
### Hero
The Five Functions  
How NE3ULA moves insight into becoming

Reveal. Interpret. Align. Act. Integrate.

Primary CTA: Explore the Functions  
Secondary CTA: Enter the Path

### Intro
NE3ULA is not built only to describe reality. It is built to help a person move through reality more consciously. The Five Functions are the operational engine of that process.

### Function blocks
- Reveal — Make the pattern visible
- Interpret — Give structure to experience
- Align — Clarify what is true, necessary, or timely
- Act — Translate insight into embodied choice
- Integrate — Stabilize transformation through reflection and repetition

### Bottom CTA
Next: Human Sovereignty  
Button: Read the Ethics

---

## Sovereignty
### Hero
Human Sovereignty  
Why the individual must remain above the system

Any system designed to guide human beings must answer a dangerous question: who remains in control?

Primary CTA: Read Human Sovereignty  
Secondary CTA: Return to Doctrine

### Intro
NE3ULA's answer is clear: the individual remains sovereign. The system exists to support perception, discernment, and self-authorship, not to replace conscience or absorb responsibility.

### Key sections
- Tools, Not Idols
- Responsibility Cannot Be Outsourced
- Technology in Right Relationship
- Revision as a Safeguard

### Bottom CTA
Next: The Alchemist Path  
Button: Enter the Path

---

## Path
### Hero
The Alchemist Path  
Where doctrine becomes practice

A philosophy is only as true as the life it can help shape.

Primary CTA: Enter the Path  
Secondary CTA: Review the Functions

### Intro
The Alchemist Path is the lived practice of conscious becoming. It is the process of working with life as material: revealing patterns, interpreting experience, aligning with truth, acting on what is coherent, and integrating what is learned until transformation becomes embodied.

### Key sections
- What Alchemy Means Here
- The Shift
- The Cycle in Practice
- Path Markers

### Bottom CTA
Return: Doctrine  
Button: Return to the Source

---

## Principles
### Hero
Foundational Principles  
The expanded philosophical core of NE3ULA

These principles define the deeper architecture beneath the system and remain open to refinement in service of truth.

Primary CTA: Read the Principles  
Secondary CTA: Back to the Laws

### Intro
This page houses the full expanded set of principles for readers who want the deeper logic beneath the doctrine. It is a reference layer rather than an entry layer.

---

# 3. IMPLEMENTATION PLAN FRAGMENTS

## Audit conclusions
- docs are safe to create now
- code implementation is not yet approved
- myth is currently the philosophy layer in site architecture
- dynamic [slug] routing is not currently part of the repo pattern
- philosophy vs myth remains an unresolved architecture decision

## Candidate implementation paths
1. Extend myth as the philosophy layer
2. Create separate static philosophy routes later
3. Consider dynamic routing only if the architecture evolves deliberately

## Previously explored implementation concepts
These are planning ideas only, not approved implementation for this phase:
- per-page content modules
- shared layout / nav / pager concepts
- visual system pass for philosophy pages
- Svelte-ready content structure
- registry-driven content model
- future QA and validator concepts

## Future implementation checklist
- decide whether philosophy remains inside myth or becomes separate
- decide route strategy
- decide whether a shared philosophy page layout is needed
- align future implementation with AGENTS.md and SOURCE_OF_TRUTH.md
- implement only after architecture choice is explicit

---

# 4. QA CHECKLIST

## Validation
- confirm the intended routes exist
- confirm nav order
- confirm CTA flow
- confirm page hierarchy is coherent
- confirm philosophy content aligns with current site architecture

## Route integrity
- Doctrine loads where implemented
- Laws loads where implemented
- Becoming loads where implemented
- Functions loads where implemented
- Sovereignty loads where implemented
- Path loads where implemented
- Principles loads where implemented

## Navigation
- primary nav order is correct
- active state is correct
- philosophy pages do not conflict with myth unless intentionally merged

## Layout / visual
- hero spacing is clean
- sections read clearly
- CTA flow is understandable
- responsive behavior is stable

## Architecture
- implementation matches the approved route strategy
- philosophy vs myth relationship is explicit
- no accidental dynamic-routing infrastructure was added unless explicitly approved

---

# 5. PR TEMPLATE FRAGMENTS

## Summary
Adds philosophy-site planning documentation for NE3ULA, including:
- site copy planning
- implementation planning
- QA checklist
- PR template

## Included
- page order and flow
- hero and CTA planning
- architecture decision framing
- future implementation considerations

## Validation
- docs reviewed for alignment with current site architecture
- no app code modified in this phase

## Notes
- this phase is docs-only
- myth remains the current philosophy layer unless explicitly changed later
- code implementation is deferred pending architecture decisions

---

# 6. PRIORITY NOTES

## Preserve strongly
- page order and route flow
- the page-purpose distinctions
- strong hero/subhead language
- Doctrine / Laws / Becoming / Functions / Sovereignty / Path sequence
- docs-only status for this phase
- architecture uncertainty should be explicit, not hidden

## Integration intent
This file is source material for docs creation.
It should be used to generate the 4 docs in /docs.
It should not be treated as final implementation canon.