---
name: tasks
description: Track and manage long-running tasks
description: |
  Create, update, and track tasks across sessions.
  Task list persists.
user-invocable: true
---

# /tasks Command

Task tracking across sessions.

Usage:
  /tasks list              # Show all tasks
  /tasks create "Fix auth" # Create new task
  /tasks update 1 done     # Mark task 1 done
  /tasks get 3             # Get task details
  /tasks claim 2           # Assign task to yourself

Tasks persist across Claude sessions.

States: pending, in_progress, completed, blocked

Integration with /loop:
  /loop "Check tasks and remind if blocked" every 2h