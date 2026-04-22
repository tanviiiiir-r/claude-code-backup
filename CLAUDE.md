# CLAUDE.md

**Claude Dev Team Bible** - One-person production team setup.

## Quick Start

```bash
# Copy to project
cp -r .claude /path/to/project/

# Install tools (one-time)
pip install bandit safety pip-audit
git secrets --install
```

## Workflow

**Daily:**
1. Code
2. `/security-scan` - block if secrets
3. `/test --coverage` - need 80%
4. Commit

**Deploy:**
1. `/security-scan --full`
2. `/test --all`
3. `/deploy staging`
4. `/deploy production --strategy=canary`

## Commands

| Command | Purpose |
|---------|---------|
| `/security-scan` | Security audit (bandit, git-secrets, pip-audit) |
| `/deploy [env]` | Deploy with safety checks |
| `/test` | Test suite |
| `/review [PR]` | Code review |
| `/help` | Available commands |

## Agents

| Agent | Model | Purpose |
|-------|-------|---------|
| security-reviewer | sonnet | OWASP, secrets, CVEs |
| deploy-agent | sonnet | Safe deployments |
| code-reviewer | haiku | Bugs, logic errors |
| code-architect | sonnet | Design features |

## Skills

- secret-scanner - Detect API keys
- docker-manager - Container ops
- git-workflow - Git practices
- refactor-python - Python patterns
- test-generation - Write tests

## Rules

See `.claude/rules/`:
- project.md - General standards
- python.md - Python specifics

## Production Checklist

- [ ] Security scan passes
- [ ] Tests pass (80% coverage)
- [ ] Staging verified
- [ ] Canary deployment
- [ ] 30min monitoring

## Emergency

Rollback:
```bash
/deploy rollback production
# or
kubectl rollout undo deployment/app
```

## Sources

- code.claude.com/docs
- OWASP Top 10
- SRE Book
