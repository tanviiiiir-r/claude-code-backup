---
name: secret-scanner
user-invocable: true
---

Secret scanner. Detects:
- AWS keys (AKIA...)
- API tokens (ghp_, xoxb-, sk-...)
- Database URLs with passwords
- Private keys (RSA, SSH, JWT)
- .env files

Tools: git-secrets, detect-secrets
git-secrets --scan || exit 1
detect-secrets-hook || exit 1

Block commit on detection. Remediation: use env vars, add to .gitignore