# Claude Code Ultimate Backup

A **production-grade** Claude Code configuration for a one-person dev team.

## What This Is

This isn't just a backup - it's a **complete production operations platform** that acts as your entire dev team:

- 🔒 **Security Team** - Automated security scanning, secret detection, vulnerability reporting
- 🚀 **DevOps Team** - One-command deployments, rollback automation, container management
- 🧪 **QA Team** - Comprehensive testing, coverage analysis, E2E automation
- 📊 **SRE Team** - Production monitoring, error tracking, incident response
- 📚 **Docs Team** - Automated documentation, runbooks, architecture decisions

## Structure

```
.claude/
├── settings.json              # Production-ready configuration
├── agents/                    # 5 specialized production agents
│   ├── code-reviewer.md       # Code quality and bug detection
│   ├── code-architect.md      # Feature design and architecture
│   ├── security-reviewer.md   # OWASP security audit
│   ├── error-tracker.md       # Production error analysis
│   └── deploy-agent.md        # Safe deployment automation
├── commands/                  # 8 production commands
│   ├── code-review.md         # Multi-agent code review
│   ├── security-scan.md       # Comprehensive security audit
│   ├── deploy.md              # Deploy to staging/production
│   ├── test.md                # Run full test suite
│   ├── monitor.md             # Check production health
│   ├── help.md                # Show available commands
│   └── memory.md              # Load contextual memory
├── skills/                    # 5 production skills
│   ├── refactor-python/       # Python modernization
│   ├── git-workflow/          # Git best practices
│   ├── test-generation/       # Automated test writing
│   ├── secret-scanner/        # Detect secrets in code
│   └── docker-manager/        # Container management
├── hooks/                     # Event-driven automation
│   └── hooks.json             # Pre-commit, pre-push hooks
└── rules/                     # Session guidelines
    ├── project.md             # Project coding standards
    └── python.md              # Python best practices

runbooks/                      # Production runbooks
├── deployment.md              # Deployment procedures
└── incident-response.md       # Incident response procedures

archive/                       # Previous implementations
```

## Production Commands

| Command | Purpose | When to Use |
|---------|---------|-------------|
| `/security-scan` | Run security audit | Before every commit, before deploy |
| `/deploy [env]` | Deploy with safety checks | Releasing to staging/production |
| `/test [--all]` | Run comprehensive tests | Pre-commit, pre-deploy |
| `/monitor` | Check production health | Debugging, daily checks |
| `/review [PR]` | Multi-agent code review | PR review |
| `/help` | Show available commands | Discovery |

## Production Agents

| Agent | Model | Responsibility |
|-------|-------|----------------|
| `security-reviewer` | sonnet | OWASP Top 10, secrets, vulnerabilities |
| `deploy-agent` | sonnet | Safe deployments with rollback |
| `error-tracker` | sonnet | Production error analysis |
| `code-reviewer` | haiku | Bug detection, code quality |
| `code-architect` | sonnet | Feature design, architecture |

## Production Skills

| Skill | Purpose |
|-------|---------|
| `secret-scanner` | Detect API keys, tokens, credentials |
| `docker-manager` | Build, run, deploy containers |
| `test-generation` | Generate unit/integration/E2E tests |
| `refactor-python` | Modern Python patterns |
| `git-workflow` | Git best practices |

## Quick Start

```bash
# Clone
git clone https://github.com/tanviiiiir-r/claude-code-backup.git ~/.claude-backup

# Install in project
cp -r ~/.claude-backup/.claude /path/to/your/project/
cp -r ~/.claude-backup/runbooks /path/to/your/project/

# Configure
cp .claude/settings.json .claude/settings.local.json
# Edit .claude/settings.local.json for your project
```

## Production Workflow

### Daily Development
```bash
# 1. Write code
# 2. Run security scan
/security-scan

# 3. Run tests
/test --coverage

# 4. Deploy to staging
/deploy staging

# 5. Verify staging
/monitor
```

### Production Deployment
```bash
# 1. Security check
/security-scan --full

# 2. Run all tests
/test --all --coverage

# 3. Deploy with canary strategy
/deploy production --strategy=canary

# 4. Monitor
/monitor --live
```

### Incident Response
```bash
# 1. Check status
/monitor --alerts

# 2. View logs
/logs --errors --last=30m

# 3. Rollback if needed
/deploy rollback production

# 4. Follow runbook
# See runbooks/incident-response.md
```

## Production Readiness Checklist

- [x] Security scanning on every commit
- [x] Automated testing (unit + integration)
- [x] One-command deployment with rollback
- [x] Production monitoring
- [x] Error tracking capabilities
- [x] Secret detection
- [x] Container management
- [x] Incident response runbooks
- [x] Deployment runbooks

## Security

This configuration enforces:
- **Secret scanning** - Pre-commit hooks block secrets
- **OWASP audit** - Automated security review
- **Dependency scanning** - Vulnerability detection
- **Container security** - Non-root user, minimal images
- **Rollback capability** - Quick recovery from issues

## Configuration

Settings hierarchy:
1. `~/.claude/settings.json` — Global defaults
2. `.claude/settings.json` — Project settings
3. `.claude/settings.local.json` — Personal overrides (gitignored)

## Architecture

```
┌─────────────────────────────────────────────┐
│              USER COMMANDS                   │
│  /deploy  /test  /security-scan  /monitor   │
└────────────────────┬────────────────────────┘
                     │
        ┌────────────┼────────────┐
        ▼            ▼            ▼
  ┌──────────┐ ┌──────────┐ ┌──────────┐
  │  Agents  │ │  Skills  │ │   Hooks  │
  │          │ │          │ │          │
  │ Security │ │  Secret  │ │Pre-commit│
  │  Deploy  │ │ Scanner  │ │Pre-push  │
  │  Error   │ │  Docker  │ │Post-merge│
  │  Review  │ │   Test   │ └──────────┘
  └──────────┘ └──────────┘
```

## Runbooks

- **deployment.md** - Step-by-step deployment procedures
- **incident-response.md** - Incident response playbooks

## Sources

- [Claude Code Docs](https://code.claude.com/docs)
- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [SRE Book](https://sre.google/sre-book/table-of-contents/)

## License

MIT
