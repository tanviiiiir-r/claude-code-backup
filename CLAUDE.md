# Claude Code Configuration

This repository contains a complete Claude Code configuration backup following best practices.

## Structure

```
.claude/
├── agents/          # Autonomous actor definitions
├── commands/        # Slash command entry points  
├── skills/          # Reusable capability modules
├── hooks/           # Event-driven automation
├── rules/           # Session rules and guidelines
└── settings.json    # Configuration
```

## Key Features

- **Agent-based workflows** - Spawn parallel agents for complex tasks
- **Skill system** - Reusable domain knowledge modules
- **Event hooks** - Automate based on tool usage patterns
- **Persistent memory** - Agents learn across sessions
- **Hierarchical settings** - Project + user + global config layers

## Usage

### Commands
- `/help` - Show available commands
- `/memory` - Load relevant memory
- `/review` - Trigger code review workflow

### Agents
Spawn specialized agents for specific tasks:

```python
Agent(
  subagent_type="code-reviewer",
  description="Review PR for bugs",
  prompt="Review the changes in PR #123..."
)
```

### Skills
Invoke reusable capabilities:

```python
Skill(skill="refactor-python", args="{\"file\": \"src/main.py\"}")
```

## Best Practices

1. **Separate concerns** - One agent per task
2. **Parallel execution** - Spawn independent agents simultaneously  
3. **Preload skills** - Give agents domain knowledge at startup
4. **Memory persistence** - Let agents learn from past work
5. **User gating** - Show summaries before destructive actions

## Configuration

Settings load in this order (later overrides earlier):
1. `~/.claude/settings.json` - Global defaults
2. `.claude/settings.json` - Project settings  
3. `.claude/settings.local.json` - Personal overrides

## Sources

- [Claude Code Docs](https://code.claude.com/docs)
- [Best Practices Repository](https://github.com/tanviiiiir-r/claude-code-best-practice)

---

*Backup created: 2026-04-22*
