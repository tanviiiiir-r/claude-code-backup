---
name: schedule
description: Schedule one-time tasks
description: |
  Schedule a prompt for later execution.
  One-time (not recurring).
user-invocable: true
argument-hint: [prompt] at [time]
---

# /schedule Command

Schedule one-time tasks.

Usage:
  /schedule "Review PR #123" at 2pm
  /schedule "Deploy to production" at tomorrow 10am
  /schedule "Check deployment health" in 30m

One-time execution (vs /loop which is recurring).

List: /schedule list
Cancel: /schedule cancel [id]