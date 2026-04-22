---
name: compact
description: Compress conversation context
description: |
  When context exceeds 50%, compress without losing state.
  Prevents "context rot."
user-invocable: true
---

# /compact Command

Compress conversation to save context.

Usage:
  /compact

Compresses conversation history while preserving:
- Current task state
- File modifications
- Agent results
- Critical decisions

When to use:
- Context > 50%
- Before spawning multiple agents
- During long sessions
- Before complex operations

Prevents "context rot" where earlier context degrades.