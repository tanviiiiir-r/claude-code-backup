---
name: git-workflow
user-invocable: true
---

Git best practices.

Commit:
  - Separate commits per logical change
  - Format: "Type: Description" (Add, Fix, Refactor, Docs)
  - Imperative mood, <50 chars subject

Branch:
  - feature/description
  - fix/description
  - Rebase on main before merge

Safety:
  - Never force push main
  - Review before merge
  - Tag releases

Pre-push:
  - Tests pass
  - Security scan clean