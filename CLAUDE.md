# CLAUDE.md

**Claude Dev Team Bible** - One-person production team.

## Quick Start

```bash
cp -r .claude /path/to/project/
```

## Commands (10)

| Command | Purpose |
|---------|---------|
| `/security-scan` | Security audit |
| `/deploy [env]` | Deploy with safety checks |
| `/test` | Run test suite |
| `/review [PR]` | Code review |
| `/loop [cmd] every [N]h` | Schedule recurring tasks |
| `/schedule [cmd] at [time]` | Schedule one-time task |
| `/compact` | Compress context |
| `/tasks` | Task tracking |
| `/doctor` | Health check |
| `/help` | Show commands |

## Agents (4)

| Agent | Model | Purpose |
|-------|-------|---------|
| `security-reviewer` | sonnet | OWASP, secrets, CVEs |
| `deploy-agent` | sonnet | Safe deployments |
| `code-reviewer` | haiku | Bugs, logic |
| `code-architect` | sonnet | Design features |

## Skills (5)

- `secret-scanner` - Detect API keys
- `docker-manager` - Container ops
- `git-workflow` - Git practices
- `refactor-python` - Python patterns
- `test-generation` - Write tests

## Automation

```bash
# Schedule daily security scan
/loop "/security-scan" every 24h

# Monitor production every 5 min
/loop "/monitor --alerts" every 5m

# Weekly dependency check
/loop "Check CVEs" on mondays at 9am
```

## MCP Servers

Connect to external tools:
- GitHub (PRs, issues)
- Stripe (payments)
- Postgres (database)

Configure in `.claude/mcp.json`

## Rules

See `.claude/rules/`:
- `project.md` - Standards
- `python.md` - Python specifics

## Production Ready

- Security scanning
- Safe deployment + rollback
- 80% test coverage
- Scheduled automation
- Context management
- MCP integrations
