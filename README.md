# Claude Code Ultimate Backup

A complete, best-practice Claude Code configuration backup.

## Structure

```
.claude/
├── settings.json        # Main configuration
├── agents/              # Autonomous actor definitions
│   ├── code-reviewer.md
│   ├── code-explorer.md
│   └── code-architect.md
├── commands/            # Slash command entry points
│   ├── code-review.md
│   ├── help.md
│   └── memory.md
├── skills/              # Reusable capability modules
│   ├── refactor-python/
│   ├── git-workflow/
│   └── test-generation/
├── hooks/               # Event-driven automation
│   └── hooks.json
└── rules/               # Session rules
    ├── project.md
    └── python.md

archive/                 # Previous career-specific implementation
config/                  # Additional config
memory/                  # Legacy memory files
plugins/                 # Plugin examples
```

## Quick Start

1. **Clone this repo:**
   ```bash
   git clone https://github.com/tanviiiiir-r/claude-code-backup.git ~/.claude-backup
   ```

2. **Copy to your project:**
   ```bash
   cp -r ~/.claude-backup/.claude /path/to/your/project/
   ```

3. **Customize settings:**
   ```bash
   # Edit .claude/settings.json for project-specific config
   # Or create .claude/settings.local.json for personal overrides
   ```

## Available Commands

| Command | Description |
|---------|-------------|
| `/review [PR]` | Multi-agent code review |
| `/help` | Show available commands |
| `/memory [topic]` | Load relevant memory |

## Available Agents

| Agent | Model | Purpose |
|-------|-------|---------|
| `code-reviewer` | haiku | Review code for bugs |
| `code-explorer` | haiku | Explore codebase structure |
| `code-architect` | sonnet | Design feature implementations |

## Available Skills

| Skill | Purpose |
|-------|---------|
| `refactor-python` | Python refactoring patterns |
| `git-workflow` | Git best practices |
| `test-generation` | Test writing strategies |

## Configuration

Settings hierarchy (later overrides earlier):

1. `~/.claude/settings.json` — Global defaults
2. `.claude/settings.json` — Project settings
3. `.claude/settings.local.json` — Personal overrides

## Best Practices

- **Agents:** Spawn parallel agents for independent tasks
- **Skills:** Preload skills to give agents domain knowledge
- **Memory:** Use persistent memory for learning across sessions
- **Hooks:** Automate based on tool usage patterns
- **Rules:** Auto-load guidelines for consistent behavior

## Sources

- [Claude Code Docs](https://code.claude.com/docs)
- [Best Practices Repository](https://github.com/tanviiiiir-r/claude-code-best-practice)

## License

MIT
