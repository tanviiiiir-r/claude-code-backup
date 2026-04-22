---
name: security-scan
user-invocable: true
---

Security scan. Runs:
- bandit (Python vulnerabilities)
- git-secrets (committed secrets)
- pip-audit (dependency CVEs)

Usage: /security-scan [--full] [--fix]

Exit 0 = clean, 1 = issues found, 2 = secrets detected (block deploy)