---
name: secret-scanner
description: Scan code for secrets, credentials, and sensitive data
description: |
  Detects API keys, tokens, passwords, and credentials in code.
  Use as pre-commit hook or security audit.
user-invocable: true
argument-hint: [--fix] [--staged]
---

# Secret Scanner Skill

Detect secrets and credentials in code.

## Patterns Detected

### High Confidence (Block Commit)
- AWS Access Key ID: `AKIA[0-9A-Z]{16}`
- AWS Secret Key: `[A-Za-z0-9/+=]{40}`
- GitHub Token: `ghp_[A-Za-z0-9]{36}`
- Slack Token: `xox[baprs]-[0-9a-zA-Z]{10,48}`
- Private Keys: `-----BEGIN (RSA|DSA|EC|OPENSSH) PRIVATE KEY-----`
- Database URLs with passwords: `postgres://user:pass@host`
- API Keys in URLs: `?api_key=...` or `?apikey=...`

### Medium Confidence (Warn)
- Generic password variables: `password = "..."`
- Token variables: `token = "..."`
- Secret variables: `secret = "..."`
- `.env` files in git

## Usage

```python
Skill(skill="secret-scanner", args="{\"fix\": true}")

# Or command line
git-secrets --scan
```

## Configuration

Create `.git-secrets/rules`:
```
# Block these patterns
AWS_ACCESS_KEY_ID=AKIA[0-9A-Z]{16}
AWS_SECRET_KEY=[A-Za-z0-9/+=]{40}
GITHUB_TOKEN=ghp_[A-Za-z0-9]{36}
PRIVATE_KEY=-----BEGIN.*PRIVATE KEY-----

# Allow these (test data)
ALLOWED: test_key_example_123
ALLOWED: example_api_key_12345
```

## Output

```
🔍 SCANNING FOR SECRETS
   Files checked: 42
   
❌ SECRET DETECTED
   File: src/config.py:15
   Pattern: AWS Access Key
   Match: AKIAIOSFODNN7EXAMPLE
   
   Action: Commit blocked
   Fix: Use environment variable: os.environ['AWS_ACCESS_KEY_ID']

❌ SECRET DETECTED
   File: .env
   Pattern: Database password
   Match: DATABASE_URL=postgres://user:secretpass@localhost/db
   
   Action: Commit blocked
   Fix: Add .env to .gitignore, use .env.example template

✅ SCAN COMPLETE
   Secrets found: 2
   Remediation required before commit
```

## Pre-Commit Hook

```bash
#!/bin/sh
# .git/hooks/pre-commit

git-secrets --scan || exit 1
detect-secrets-hook || exit 1
```

## Tools Integrated

- **git-secrets** - AWS-focused secret detection
- **detect-secrets** - Yelp's secret scanner
- **truffleHog** - Deep git history scanning
- **gitleaks** - Fast secret detection

## Remediation

If secrets found:

1. **Don't commit** - Block immediately
2. **Remove from code** - Move to environment variables
3. **Rotate secret** - Generate new credentials
4. **Scan git history** - Check if secret was committed before
5. **Clean history** - Use BFG Repo-Cleaner if needed
