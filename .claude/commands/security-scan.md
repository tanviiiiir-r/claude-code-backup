---
name: security-scan
description: Run comprehensive security scan on codebase
description: |
  Scans for secrets, vulnerabilities, and security issues.
  Use before deploying to production.
user-invocable: true
argument-hint: [--full] [--fix]
---

# Security Scan Command

Comprehensive security audit before deployment.

## Usage

```
/security-scan                    # Quick scan
/security-scan --full             # Full audit with dependencies
/security-scan --fix              # Auto-fix where possible
/security-scan --full --fix       # Full + auto-fix
```

## What It Checks

### 1. Secrets in Code
- API keys, tokens, passwords
- Private keys (RSA, SSH)
- Database credentials
- Cloud service keys

### 2. Vulnerable Dependencies
- Known CVEs in packages
- Outdated dependencies
- Unmaintained packages

### 3. Code Vulnerabilities
- SQL injection
- XSS vulnerabilities
- Command injection
- Path traversal
- Insecure deserialization

### 4. Configuration Issues
- Debug mode enabled
- Weak crypto settings
- Insecure defaults

## Scanners Used

- **git-secrets** - AWS, GCP, Azure keys
- **detect-secrets** - Generic secret detection
- **bandit** - Python security issues
- **safety** / **pip-audit** - Dependency vulnerabilities
- **semgrep** - Static analysis rules

## Output

```
╔════════════════════════════════════════════════════════════╗
║                 SECURITY SCAN RESULTS                      ║
╠════════════════════════════════════════════════════════════╣
║                                                            ║
║  SEVERITY SUMMARY                                          ║
║  ─────────────────                                         ║
║  🔴 Critical:  0                                           ║
║  🟠 High:      1                                           ║
║  🟡 Medium:    3                                           ║
║  🔵 Low:       5                                           ║
║                                                            ║
║  SECRETS DETECTED                                          ║
║  ─────────────────                                         ║
║  ❌ 1 secret found in src/config.py:12                   ║
║     Hardcoded API key (AWS)                                ║
║                                                            ║
║  DEPENDENCY VULNERABILITIES                                ║
║  ─────────────────                                         ║
║  ⚠️  django 4.1.0 has CVE-2023-XXXX (High)               ║
║     Fix: pip install django>=4.1.3                         ║
║                                                            ║
║  CODE VULNERABILITIES                                      ║
║  ─────────────────                                         ║
║  ⚠️  SQL injection risk in src/db.py:34                   ║
║  ⚠️  eval() with user input in src/utils.py:78            ║
║                                                            ║
╚════════════════════════════════════════════════════════════╝
```

## Exit Codes

- **0** - Clean (no critical/high issues)
- **1** - Issues found
- **2** - Secrets detected (block deployment)

## CI/CD Integration

```yaml
- name: Security Scan
  run: |
    /security-scan --full
    if [ $? -ne 0 ]; then
      echo "Security issues found. Fix before deploying."
      exit 1
    fi
```

## Fixes Applied (--fix)

- Remove committed secrets (add to .gitignore)
- Update vulnerable dependencies
- Auto-format code
- Add security headers

## When to Run

- [ ] Before every commit (pre-commit hook)
- [ ] Before every deployment
- [ ] Weekly scheduled scans
- [ ] After adding new dependencies
