# Claude Code Setup Prompt

## Overview

Set up a complete Claude Code environment with the "Claude Dev Team Bible" configuration. This transforms Claude Code into an autonomous production-grade dev team for a one-person operation.

## Prerequisites

- Node.js 18+ installed
- Git configured
- Python 3.11+ installed
- Docker installed (optional but recommended)

## Step 1: Install Claude Code

```bash
# Install Claude Code globally
npm install -g @anthropic-ai/claude-code

# Verify installation
claude --version
```

## Step 2: Clone the Bible Repository

```bash
# Clone to a backup location
git clone https://github.com/tanviiiiir-r/claude-code-backup.git ~/.claude-bible

# Verify structure
ls ~/.claude-bible/.claude/
# Should show: agents/, commands/, skills/, hooks/, rules/, settings.json, mcp.json
```

## Step 3: Install the Bible Configuration

```bash
# Navigate to your project
cd /path/to/your/project

# Copy the .claude directory
cp -r ~/.claude-bible/.claude .

# Verify
tree .claude/ -L 2
```

## Step 4: Install Security Tools

```bash
# Python security scanners
pip install bandit safety pip-audit

# Git secrets
git clone https://github.com/awslabs/git-secrets ~/.git-secrets
cd ~/.git-secrets && make install

# Configure git-secrets in your repo
cd /path/to/your/project
git secrets --install
git secrets --register-aws

# Detect secrets
pip install detect-secrets
detect-secrets scan > .secrets.baseline
```

## Step 5: Configure MCP Servers (External Integrations)

Edit `.claude/mcp.json`:

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@anthropic-ai/mcp-server-github"],
      "env": {
        "GITHUB_TOKEN": "${GITHUB_TOKEN}"
      }
    },
    "stripe": {
      "command": "npx",
      "args": ["-y", "@stripe/mcp-server-stripe"],
      "env": {
        "STRIPE_API_KEY": "${STRIPE_API_KEY}"
      }
    },
    "postgres": {
      "command": "npx",
      "args": ["-y", "@anthropic-ai/mcp-server-postgres"],
      "env": {
        "POSTGRES_URL": "${DATABASE_URL}"
      }
    }
  }
}
```

Set environment variables:
```bash
export GITHUB_TOKEN="ghp_your_token"
export STRIPE_API_KEY="sk_test_..."
export DATABASE_URL="postgres://user:pass@localhost/db"
```

## Step 6: Ollama Integration (Local LLM)

```bash
# Install Ollama
curl -fsSL https://ollama.com/install.sh | sh

# Pull a model (choose based on your needs)
ollama pull llama3.2      # Fast, good for coding
ollama pull mistral       # Balanced
ollama pull codellama     # Code-specific
ollama pull mixtral       # Powerful

# Verify
ollama list

# Test
ollama run llama3.2
```

### Configure Claude Code to use Ollama

Create `.claude/settings.local.json`:

```json
{
  "model": "ollama",
  "ollama": {
    "baseUrl": "http://localhost:11434",
    "model": "llama3.2",
    "temperature": 0.7
  },
  "agents": {
    "defaultModel": "ollama",
    "ollama": {
      "baseUrl": "http://localhost:11434",
      "model": "llama3.2"
    }
  }
}
```

### Hybrid Setup (Claude + Ollama)

For cost savings, use Ollama for agents, Claude for main:

```json
{
  "model": "claude-sonnet-4-6",
  "agents": {
    "defaultModel": "ollama",
    "ollama": {
      "baseUrl": "http://localhost:11434",
      "model": "llama3.2"
    }
  }
}
```

## Step 7: Create Project-Specific Configuration

### Create .claude/settings.local.json

```json
{
  "permissions": {
    "default": "askUser",
    "sandbox": {
      "write": [
        "src/**/*",
        "tests/**/*",
        "**/*.py",
        "**/*.js",
        "**/*.ts"
      ]
    }
  },
  "hooks": {
    "enabled": true
  },
  "outputStyle": "concise"
}
```

### Create .env.example

```bash
# Copy this to .env and fill in real values
DATABASE_URL=postgres://user:password@localhost/dbname
GITHUB_TOKEN=ghp_your_token_here
STRIPE_API_KEY=sk_test_your_key
AWS_ACCESS_KEY_ID=your_key
AWS_SECRET_ACCESS_KEY=your_secret
SENTRY_DSN=your_sentry_dsn
```

## Step 8: Verify Installation

```bash
# Start Claude Code in your project
claude

# Inside Claude, run:
/doctor

# Expected output: All checks pass ✅
```

## Step 9: Initial Setup Tasks

Run these commands in Claude:

```bash
# 1. Security baseline
/security-scan --full

# 2. Set up daily automation
/loop "/security-scan" every 24h
/loop "/test --all" every 12h

# 3. Verify commands work
/help
/test --unit
```

## Step 10: Production Workflow Setup

### Pre-commit Hook

Create `.git/hooks/pre-commit`:

```bash
#!/bin/bash
# Pre-commit hook for security

echo "Running security scan..."
bandit -r src/ -f json -o bandit-report.json
if [ $? -ne 0 ]; then
    echo "❌ Security issues found. Fix before committing."
    cat bandit-report.json
    exit 1
fi

echo "Checking for secrets..."
git-secrets --scan
if [ $? -ne 0 ]; then
    echo "❌ Secrets detected. Remove before committing."
    exit 1
fi

echo "✅ Pre-commit checks passed"
```

Make executable:
```bash
chmod +x .git/hooks/pre-commit
```

### GitHub Actions (Optional)

Create `.github/workflows/claude-automation.yml`:

```yaml
name: Claude Automation

on:
  schedule:
    - cron: '0 9 * * *'  # Daily at 9am
  push:
    branches: [main]

jobs:
  security-scan:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Security Scan
        run: |
          pip install bandit safety
          bandit -r src/
          safety check
```

## Verification Checklist

Run `/doctor` in Claude and verify:

- [ ] Configuration files valid
- [ ] MCP servers reachable (if configured)
- [ ] Security tools installed
- [ ] Git hooks functional
- [ ] All commands available (/help)
- [ ] Agents loadable
- [ ] Ollama responsive (if configured)

## Available Commands

After setup, these commands are available:

| Command | Purpose |
|---------|---------|
| `/security-scan` | Security audit (bandit, git-secrets) |
| `/deploy [env]` | Deploy to staging/production |
| `/test` | Run tests (80% coverage required) |
| `/review [PR]` | Multi-agent code review |
| `/loop [cmd] every [N]h` | Schedule recurring tasks |
| `/schedule [cmd] at [time]` | Schedule one-time task |
| `/compact` | Compress context |
| `/tasks` | Task tracking |
| `/doctor` | Health check |
| `/help` | Show commands |

## Automation Examples

```bash
# Daily security scan at 9am
/loop "/security-scan --full && notify if issues" at 9am

# Monitor production every 5 minutes
/loop "/monitor --alerts" every 5m

# Weekly dependency check
/loop "pip-audit && safety check" on sundays at 9am

# Deploy reminder
/schedule "Review and deploy pending changes" at tomorrow 10am
```

## Troubleshooting

### Issue: MCP servers not connecting
**Fix:** Check environment variables are set and MCP servers installed:
```bash
npx -y @anthropic-ai/mcp-server-github
```

### Issue: Ollama not responding
**Fix:** Verify Ollama is running:
```bash
curl http://localhost:11434/api/tags
```

### Issue: Security tools not found
**Fix:** Install tools:
```bash
pip install bandit safety pip-audit
git secrets --install
```

### Issue: Commands not available
**Fix:** Verify .claude directory structure:
```bash
tree .claude/commands/
```

## Resources

- Documentation: code.claude.com/docs
- Best Practices: github.com/tanviiiiir-r/claude-code-best-practice
- This Setup: github.com/tanviiiiir-r/claude-code-backup

---

**Setup Complete!** You now have an autonomous dev team that:
- Scans for security issues 24/7
- Deploys safely with rollback
- Maintains 80% test coverage
- Integrates with GitHub, Stripe, databases
- Runs scheduled tasks automatically
- Uses local LLMs for cost savings (Ollama)
