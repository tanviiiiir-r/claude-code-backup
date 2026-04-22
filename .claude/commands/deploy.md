---
name: deploy
user-invocable: true
---

Deploy to staging/production.

Usage:
  /deploy staging
  /deploy production --strategy=canary

Pipeline: tests → security scan → build → staging → smoke tests → production → monitor
Auto-rollback if error rate >1% or health checks fail.