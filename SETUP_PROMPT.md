# Claude Code Setup Prompt - Kimi + Ollama Wiring

## Overview

Set up Claude Code with **Kimi K2.5 as main model** and **Ollama for agents**. This is the "Claude Dev Team Bible" with your specific LLM wiring configuration.

## Your LLM Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                     CLAUDE CODE                              │
├─────────────────────────────────────────────────────────────┤
│  Main Model (User Interaction)                               │
│  ├── Model: kimi-k2.5:cloud                                  │
│  └── Purpose: Complex reasoning, planning, user interaction  │
├─────────────────────────────────────────────────────────────┤
│  Agent Models (Background Tasks)                             │
│  ├── security-reviewer  → ollama/qwen2.5-coder:14b          │
│  ├── code-reviewer      → ollama/llama3.2:latest             │
│  ├── deploy-agent       → ollama/mixtral:8x7b               │
│  └── code-architect     → ollama/deepseek-coder:6.7b        │
└─────────────────────────────────────────────────────────────┘
```

## Prerequisites

- Node.js 18+ installed
- Git configured
- Python 3.11+ installed
- Ollama installed and running
- Kimi API access configured

## Step 1: Install Ollama Models

```bash
# Install Ollama if not already installed
curl -fsSL https://ollama.com/install.sh | sh

# Start Ollama
ollama serve

# Pull the required models for agents
ollama pull llama3.2:latest      # For code-reviewer (fast)
ollama pull qwen2.5-coder:14b   # For security-reviewer (precise)
ollama pull mixtral:8x7b         # For deploy-agent (capable)
ollama pull deepseek-coder:6.7b  # For code-architect (coding)

# Verify all models
ollama list
```

## Step 2: Install Claude Code

```bash
# Install Claude Code globally
npm install -g @anthropic-ai/claude-code

# Verify installation
claude --version
```

## Step 3: Clone the Bible Repository

```bash
# Clone to a backup location
git clone https://github.com/tanviiiiir-r/claude-code-backup.git ~/.claude-bible

# Verify structure
ls ~/.claude-bible/.claude/
# Should show: agents/, commands/, skills/, hooks/, rules/, settings.json, mcp.json
```

## Step 4: Configure Kimi + Ollama Wiring

### Create `.claude/settings.local.json`

```json
{
  "model": "kimi-k2.5:cloud",
  "modelProvider": "anthropic",
  "agents": {
    "defaultModel": "ollama",
    "ollama": {
      "baseUrl": "http://localhost:11434",
      "defaultModel": "llama3.2:latest",
      "models": {
        "security-reviewer": "qwen2.5-coder:14b",
        "code-reviewer": "llama3.2:latest",
        "deploy-agent": "mixtral:8x7b",
        "code-architect": "deepseek-coder:6.7b"
      }
    }
  },
  "permissions": {
    "default": "acceptEdits",
    "allow": ["Bash", "Read", "Write", "Edit", "Agent", "Skill", "WebSearch", "WebFetch"]
  },
  "effort": "high",
  "outputStyle": "concise",
  "hooks": {
    "enabled": true,
    "path": ".claude/hooks/hooks.json"
  },
  "statusLine": {
    "enabled": true,
    "format": "{model} | {cost} | {context}%"
  }
}
```

### Create `.claude/model-router.json`

```json
{
  "routing": {
    "user_interaction": {
      "model": "kimi-k2.5:cloud",
      "reason": "Main model for complex reasoning"
    },
    "agents": {
      "security-reviewer": {
        "model": "ollama/qwen2.5-coder:14b",
        "reason": "Precise security analysis"
      },
      "code-reviewer": {
        "model": "ollama/llama3.2:latest",
        "reason": "Fast bug detection"
      },
      "deploy-agent": {
        "model": "ollama/mixtral:8x7b",
        "reason": "Capable deployment decisions"
      },
      "code-architect": {
        "model": "ollama/deepseek-coder:6.7b",
        "reason": "Code-focused architecture"
      }
    }
  }
}
```

## Step 5: Install the Bible Configuration

```bash
# Navigate to your project
cd /path/to/your/project

# Copy the .claude directory
cp -r ~/.claude-bible/.claude .

# Copy settings.local.json (with your wiring)
cp ~/.claude-bible/.claude/settings.local.json .claude/settings.local.json
# Now edit it with the Kimi + Ollama config above

# Verify structure
tree .claude/ -L 2
```

## Step 6: Update Agent Definitions for Ollama

### `.claude/agents/code-reviewer.md`

```yaml
---
name: code-reviewer
description: Code review for bugs, anti-patterns, logic errors
allowedTools: ["Read", "Grep", "Bash"]
model: ollama
ollamaModel: llama3.2:latest
color: orange
maxTurns: 10
---

Code reviewer. Check for:
1. Syntax errors, undefined variables, missing imports
2. Logic errors, race conditions, resource leaks
3. Error handling gaps
4. Type mismatches

Only flag HIGH CONFIDENCE issues. Output YAML with severity, file, line.
```

### `.claude/agents/security-reviewer.md`

```yaml
---
name: security-reviewer
description: Security audit - OWASP Top 10, secrets, vulnerabilities
allowedTools: ["Read", "Grep", "Bash"]
model: ollama
ollamaModel: qwen2.5-coder:14b
color: red
maxTurns: 10
---

Security reviewer. Scan for:
1. Secrets (API keys, passwords, private keys)
2. Injection (SQL, command, XSS)
3. Misconfig (DEBUG=True, weak crypto)
4. OWASP Top 10

Block: hardcoded credentials, SQL f-strings, eval(user_input).
Output YAML with severity, file, line, CWE, OWASP category.
```

### `.claude/agents/deploy-agent.md`

```yaml
---
name: deploy-agent
description: Safe deployments with rollback capability
allowedTools: ["Read", "Bash", "Write"]
model: ollama
ollamaModel: mixtral:8x7b
color: green
maxTurns: 15
permissionMode: askUser
---

Deploy agent. Pipeline:
1. Pre-check: tests pass, security clean, no uncommitted changes
2. Build: docker image, push to registry
3. Staging: deploy, smoke tests, health checks
4. Production: canary 5%→25%→50%→100%, auto-rollback on failure
5. Monitor: 30 min post-deploy

Strategies: canary (default), blue-green, rolling.
Always backup DB before migrations.
```

### `.claude/agents/code-architect.md`

```yaml
---
name: code-architect
description: Design feature architectures and implementation plans
allowedTools: ["Read", "Grep", "Write", "Glob", "WebSearch"]
model: ollama
ollamaModel: deepseek-coder:6.7b
color: blue
maxTurns: 12
permissionMode: askUser
---

Architect. Process:
1. Analyze requirements and constraints
2. Design components and interfaces
3. Plan implementation phases
4. Match existing codebase patterns

Output: Markdown with architecture, component table, data flow, phases, files to modify. Get user confirmation before implementation.
```

## Step 7: Install Security Tools

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

## Step 8: Configure MCP Servers

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
# Add to ~/.zshrc or ~/.bashrc
export GITHUB_TOKEN="ghp_your_token"
export STRIPE_API_KEY="sk_test_..."
export DATABASE_URL="postgres://user:pass@localhost/db"

# Source it
source ~/.zshrc
```

## Step 9: Verify Wiring

```bash
# Terminal 1: Start Ollama
ollama serve

# Terminal 2: Test models
curl http://localhost:11434/api/generate -d '{
  "model": "llama3.2:latest",
  "prompt": "Hello, testing connection"
}'

# Terminal 3: Start Claude Code
cd /path/to/your/project
claude

# Inside Claude, verify wiring:
/doctor

# Expected output:
# ✅ Kimi K2.5 (main) - Connected
# ✅ Ollama (agents) - Connected
#   - llama3.2:latest - Ready
#   - qwen2.5-coder:14b - Ready
#   - mixtral:8x7b - Ready
#   - deepseek-coder:6.7b - Ready
```

## Step 10: Test Agent Wiring

```bash
# In Claude Code, test each agent:

# 1. Security reviewer (qwen2.5-coder)
Agent(
  subagent_type="security-reviewer",
  description="Test security scan",
  prompt="Review this code for security issues: print('Hello')"
)

# 2. Code reviewer (llama3.2)
Agent(
  subagent_type="code-reviewer",
  description="Test code review",
  prompt="Review this function: def add(a,b): return a+b"
)

# 3. Deploy agent (mixtral)
Agent(
  subagent_type="deploy-agent",
  description="Test deploy check",
  prompt="Check if project is ready for deployment"
)
```

## Cost Comparison

| Component | Model | Cost | Use Case |
|-----------|-------|------|----------|
| Main | kimi-k2.5:cloud | ~$0.003/1K tokens | User interaction, planning |
| Security | ollama/qwen2.5-coder:14b | $0 (local) | Security scans |
| Code Review | ollama/llama3.2:latest | $0 (local) | Bug detection |
| Deploy | ollama/mixtral:8x7b | $0 (local) | Deployment decisions |
| Architect | ollama/deepseek-coder:6.7b | $0 (local) | Feature design |

**Savings:** ~80% cost reduction vs using Kimi for everything.

## Available Commands

| Command | Main Model | Agent Model | Purpose |
|---------|-----------|-------------|---------|
| User chat | Kimi K2.5 | - | Complex reasoning |
| `/security-scan` | - | Qwen2.5-coder | Security audit |
| `/deploy` | - | Mixtral | Safe deployment |
| `/review` | - | Llama3.2 | Code review |
| `/loop` | Kimi K2.5 | - | Schedule tasks |
| `/tasks` | Kimi K2.5 | - | Task tracking |

## Troubleshooting

### Issue: Ollama not connecting
**Fix:**
```bash
# Check if Ollama is running
curl http://localhost:11434/api/tags

# If not running:
ollama serve

# Or start as service:
brew services start ollama  # macOS
sudo systemctl start ollama # Linux
```

### Issue: Agent using wrong model
**Fix:** Check `.claude/settings.local.json`:
```json
{
  "agents": {
    "defaultModel": "ollama",
    "ollama": {
      "models": {
        "security-reviewer": "qwen2.5-coder:14b"
      }
    }
  }
}
```

### Issue: Kimi not responding
**Fix:** Verify API access:
```bash
# Check if Kimi is accessible
curl -H "Authorization: Bearer $KIMI_API_KEY" \
  https://api.moonshot.cn/v1/models
```

### Issue: Model routing not working
**Fix:** Check agent definition has correct model:
```yaml
---
name: code-reviewer
model: ollama
ollamaModel: llama3.2:latest
---
```

## Performance Tuning

### Ollama Optimization

```bash
# Edit Ollama config (~/.ollama/config.json)
{
  "gpu": true,
  "parallel": 4,
  "models": {
    "llama3.2:latest": {
      "num_ctx": 8192,
      "num_gpu": 1
    },
    "mixtral:8x7b": {
      "num_ctx": 32768,
      "num_gpu": 1
    }
  }
}
```

### System Requirements

| Model | RAM Required | VRAM | Notes |
|-------|-------------|------|-------|
| llama3.2:latest | 8GB | 4GB | Fast, efficient |
| qwen2.5-coder:14b | 16GB | 8GB | Precise coding |
| mixtral:8x7b | 32GB | 16GB | Most capable |
| deepseek-coder:6.7b | 12GB | 6GB | Code-focused |

## Automation Examples

```bash
# Daily security scan (uses Qwen2.5-coder)
/loop "/security-scan" every 24h

# Weekly code review (uses Llama3.2)
/loop "/review --stale-prs" on mondays at 9am

# Deploy reminder
/schedule "/deploy staging" at tomorrow 10am
```

## Verification

Run in Claude Code:
```
/doctor
/model-info
/agents-status
```

Expected:
- ✅ Kimi K2.5 connected
- ✅ Ollama running
- ✅ All 4 agent models loaded
- ✅ MCP servers configured

---

**Setup Complete!** Your wiring:
- **Main:** Kimi K2.5 (cloud) - Complex tasks, user interaction
- **Agents:** Ollama (local) - Background tasks, 80% cost savings
