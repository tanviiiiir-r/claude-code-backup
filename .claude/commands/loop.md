---
name: loop
description: Schedule recurring tasks
description: |
  Run commands on schedule even when computer is off.
  Uses cloud triggers.
user-invocable: true
argument-hint: [prompt] every [interval]
---

# /loop Command

Schedule recurring tasks.

Usage:
  /loop "/security-scan" every 24h
  /loop "/monitor --alerts" every 5m
  /loop "Review pending PRs" at 9am
  /loop "Weekly report" on mondays at 9am

Schedules persist across sessions. Cloud-based, runs even when offline.

Examples:
  # Daily security scan
  /loop "Run security scan and notify if issues" every 24h

  # Monitor production every 5 minutes
  /loop "/monitor --alerts" every 5m

  # Weekly dependency check
  /loop "Check for CVEs in dependencies" on mondays at 9am

List: /loop list
Cancel: /loop cancel [id]