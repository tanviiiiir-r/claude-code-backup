---
name: help
description: Show available commands and agents in this configuration
description: |
  Lists all available commands, agents, skills, and hooks.
  Quick reference for what's configured.
user-invocable: true
---

# Help Command

Quick reference for this Claude Code configuration.

## Available Commands

| Command | Description |
|---------|-------------|
| `/review` | Multi-agent code review |
| `/help` | This help message |
| `/memory` | Load memory for current context |

## Available Agents

| Agent | Purpose | Model |
|-------|---------|-------|
| `code-reviewer` | Review code for bugs | haiku |
| `code-explorer` | Explore codebase structure | haiku |
| `code-architect` | Design feature implementations | sonnet |

## Available Skills

| Skill | Description |
|-------|-------------|
| `refactor-python` | Python refactoring patterns |
| `git-workflow` | Git best practices |
| `test-generation` | Test writing strategies |

## Hooks

| Event | Description |
|-------|-------------|
| `PreToolUse` | Log before tool execution |
| `PostToolUse` | Log after tool completion |

## Configuration

- **Settings**: `.claude/settings.json`
- **Memory**: `.claude/memory/`
- **Rules**: `.claude/rules/`

## Learn More

- [Claude Code Docs](https://code.claude.com/docs)
- [Subagents](https://code.claude.com/docs/en/sub-agents)
- [Skills](https://code.claude.com/docs/en/skills)
