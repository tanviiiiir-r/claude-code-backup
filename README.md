# Claude Dev Team Bible

**One-person production dev team with automation.**

## Install (10 seconds)

```bash
git clone https://github.com/tanviiiiir-r/claude-code-backup.git
cp -r claude-code-backup/.claude /path/to/project/
```

## Core Commands

```bash
/security-scan          # Security audit
/deploy production      # Deploy with rollback
/test --coverage       # 80% minimum
/review [PR]           # Multi-agent review
```

## Automation Commands

```bash
/loop "security-scan" every 24h          # Daily scans
/loop "monitor --alerts" every 5m        # Production monitoring
/schedule "deploy" at tomorrow 10am      # One-time schedule
/compact                                 # Manage context
/tasks                                   # Track work
```

## What You Get

- **Security Team** - Automated OWASP scans, secret detection
- **DevOps Team** - One-command deployments, auto-rollback
- **QA Team** - 80% coverage requirement
- **Automation** - Scheduled tasks run 24/7
- **Integrations** - GitHub, Stripe, DB via MCP

## Stack

- 4 Agents (security, deploy, review, architect)
- 5 Skills (secrets, docker, git, python, tests)
- 10 Commands (core + automation)
- MCP servers (external integrations)
- Hooks (event logging)

## Example Automation

```bash
# Daily security + report
/loop "/security-scan && notify if issues" every 24h

# Monitor and alert
/loop "/monitor --alerts | slack #alerts" every 5m

# Weekly maintenance
/loop "/test --all && /security-scan --full" on sundays at 9am
```

See `CLAUDE.md` for full documentation.
