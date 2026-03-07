# NE3ULA Core — Agent Instructions

This repository contains the core website for the NE3ULA system.

AI agents working on this repo should follow these rules.

## Architecture

The canonical architecture is defined in:

SOURCE_OF_TRUTH.md

Do not restructure page hierarchy unless explicitly instructed.

## Visual Design

The visual system is:

- dark background
- black/white palette
- glassmorphism elements
- minimal typography

Avoid introducing new color schemes.

Prefer subtle motion over visual complexity.

## Styling

Shared styling lives in:

/shared/styles.css

Prefer modifying shared styles rather than creating page-specific styles.

## Editing Guidelines

When making changes:

- preserve existing routing
- maintain mobile responsiveness
- keep diffs minimal
- avoid unnecessary refactors

## Philosophy

NE3ULA is a conceptual system built around:

NE3ULA = space  
Myth = meaning  
AXZIO = interface  
E3 = engine  

Edits should respect this structure.

## Deployment

Changes are deployed via:

GitHub → Cloudflare Pages

See BUILD_WORKFLOW.md for workflow instructions.