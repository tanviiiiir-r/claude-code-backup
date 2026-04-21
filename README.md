# Claude Code Complete Setup Backup

**Created:** 2026-04-21

## Contents
Complete backup of Claude Code configuration and customizations.

## Directories
- skills/ - Custom slash commands (e.g., /career-ops)
- plugins/ - Installed plugins with configurations
- agents/ - Custom agent definitions
- commands/ - Custom commands
- hooks/ - User hooks
- memory/ - Project memory files
- config/ - Settings and configuration

## Restore Instructions
Run ./restore.sh or manually copy directories to ~/.claude/

## Important Notes
- Session history excluded (device-specific)
- MCP tokens excluded (re-authenticate with /mcp)
- Large conversation files excluded
