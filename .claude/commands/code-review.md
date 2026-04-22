---
name: review
user-invocable: true
---

Code review. Spawns 2 parallel agents:
- code-reviewer (bugs)
- security-reviewer (vulnerabilities)

Usage: /review [pr-number] [--comment]

Reports critical/high issues only.