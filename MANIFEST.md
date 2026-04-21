# Claude Code Backup Manifest

## Directories Included
- agents/ - 15 custom agent definitions
- commands/ - 16 custom commands
- config/ - Configuration files
- hooks/ - User hooks
- memory/ - Project memory
- plugins/ - 14 plugin configurations
- skills/ - 4 custom skills

## Key Components

### Skills
- career-ops/ - Career operations automation
- career-ops.skill - Career ops skill definition
- frontend-design/ - Frontend design skill
- tailor_application.skill - Application tailoring skill

### Plugins Enabled
- railway@claude-plugins-official, vercel@claude-plugins-official
- agent-sdk-dev, claude-opus-4-5-migration, code-review
- commit-commands, explanatory-output-style, feature-dev
- frontend-design, hookify, learning-output-style
- plugin-dev, pr-review-toolkit, ralph-wiggum
- security-guidance

### Agents
- agent-creator, agent-sdk-verifier-py, agent-sdk-verifier-ts
- code-architect, code-explorer, code-reviewer
- code-simplifier, comment-analyzer, conversation-analyzer
- plugin-validator, pr-test-analyzer, silent-failure-hunter
- skill-reviewer, type-design-analyzer

### Configuration
- settings.json - Main settings
- settings.local.json - Local overrides
- keybindings.json - Custom keybindings

## Size
Total: ~1.4 MB (cached data excluded)

## Excluded (device-specific)
- Session history (history.jsonl)
- Large conversation files
- MCP auth tokens
- Cached plugin data (node_modules, marketplaces, gstack, claude-mem)
