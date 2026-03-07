# NE3ULA Core — Developer Map

This document maps the current and future architecture of the NE3ULA website.

It is intended for developers and collaborators to quickly understand:

- the site structure
- conceptual layers
- development priorities
- expansion roadmap

This file complements:

SOURCE_OF_TRUTH.md → philosophy + architecture  
BUILD_WORKFLOW.md → development workflow  

---

# 1. Conceptual System

The NE3ULA system is built on a layered framework:

```
NE3ULA = space
Myth = meaning
AXZIO = interface
E3 = engine
```

These layers correspond to the website structure.

---

# 2. Current Site Map

```
/
Entry Threshold

/home
Primary Hub

/myth
Philosophy Layer

/music
Creative Signal

/axzio
Interface Entry

/e3
Future Engine Layer

/lore
Future Narrative Layer

/engine
Future Infrastructure Layer
```

---

# 3. User Journey

The site intentionally follows a path structure rather than a traditional website hierarchy.

```
Visitor
↓
Entry Page (/)
↓
Choose Your Path (/home)
↓
Music | Myth | AXZIO | E3
```

Each route introduces a different dimension of the system.

---

# 4. Page Purpose

## /

Symbolic entry point.

Purpose:
Create a moment of pause before entering the system.

Content:

LIVE YOUR LEGEND  
ENTER

---

## /home

Navigation hub.

Purpose:
Allow visitors to choose a path.

Routes:

Music  
Myth  
AXZIO  
E3  

---

## /myth

Philosophical foundation.

Sections include:

The Space Between  
From Chaos to Creation  
The Architecture of Becoming  

This page defines the meaning layer of NE3ULA.

---

## /music

Creative signal and public-facing work.

Content includes:

Music releases  
SoundCloud  
Live streams  
Production services  
Products  

---

## /axzio

Transformation interface.

Core concept:

```
Reflect
Create
Become
```

Meaning:

Reflect → awareness  
Create → agency  
Become → evolution  

---

# 5. AXZIO Expansion

Future paths:

```
/axzio/reflect
/axzio/create
/axzio/become
```

These should eventually become deeper interactive experiences.

Possible structure:

```
/axzio
    /reflect
    /create
    /become
```

---

# 6. Future System Layers

## /e3

Represents the engine behind the system.

Possible topics:

technology infrastructure  
identity systems  
AI integration  
platform architecture  

---

## /engine

Lower-level system architecture.

Possible topics:

software stack  
platform mechanics  
data flow  

---

## /lore

Narrative archive.

Possible topics:

mythology  
symbolism  
story world  

---

# 7. Visual System

Global styling lives in:

```
/shared/styles.css
```

Design language:

- dark cosmic background
- glassmorphism UI
- subtle gradients
- minimal typography
- cinematic spacing

The aesthetic should feel:

calm  
mysterious  
intentional  
spacious  

---

# 8. Development Priorities

## Phase 1 — Stabilize Core

Refine:

/home  
/myth  
/music  

Ensure:

navigation consistency  
mobile responsiveness  
visual polish  

---

## Phase 2 — Expand AXZIO

Build:

```
/axzio/reflect
/axzio/create
/axzio/become
```

These pages should guide users through the transformation interface.

---

## Phase 3 — Expand the System

Develop:

```
/e3
/engine
/lore
```

These pages explain the deeper architecture of NE3ULA.

---

# 9. Long-Term Vision

NE3ULA is not just a website.

It is the entry point to a broader system involving:

creative output  
identity frameworks  
interactive interfaces  
future technology layers  

The website is the **gateway into that ecosystem**.

---

# 10. Developer Guidance

When making changes:

1. Follow SOURCE_OF_TRUTH.md
2. Follow BUILD_WORKFLOW.md
3. Preserve the conceptual structure
4. Extend the architecture intentionally

Avoid creating unnecessary pages outside the defined system.

---

End of document.