---
name: doctor
description: Diagnose issues and check setup health
description: |
  Run diagnostics on Claude Code setup.
  Checks configuration, permissions, MCP connections.
user-invocable: true
---

# /doctor Command

Diagnostics and health checks.

Usage:
  /doctor

Checks:
- Configuration files valid
- MCP servers reachable
- Required tools installed
- Permissions correct
- Hooks functional

Output: Report with ✅/❌ for each check + fixes if needed.