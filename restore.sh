#!/bin/bash
# restore.sh - Restore Claude Code configuration from backup

set -e

BACKUP_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="${HOME}/.claude"

echo "=========================================="
echo "Claude Code Setup Restore"
echo "=========================================="
echo ""

# Check if .claude directory exists
if [ -d "$CLAUDE_DIR" ]; then
    echo "WARNING: ~/.claude directory already exists!"
    read -p "Do you want to backup existing config first? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        BACKUP_NAME=".claude-backup-$(date +%Y%m%d-%H%M%S)"
        echo "Backing up existing config to ~/${BACKUP_NAME}..."
        cp -r "$CLAUDE_DIR" "${HOME}/${BACKUP_NAME}"
        echo "Backup created: ~/${BACKUP_NAME}"
    fi
fi

# Create .claude directory
echo "Creating ~/.claude directory..."
mkdir -p "$CLAUDE_DIR"

# Copy each directory
echo ""
echo "Restoring configuration..."

if [ -d "$BACKUP_DIR/skills" ]; then
    echo "  Copying skills..."
    cp -r "$BACKUP_DIR/skills" "$CLAUDE_DIR/"
fi

if [ -d "$BACKUP_DIR/plugins" ]; then
    echo "  Copying plugins..."
    cp -r "$BACKUP_DIR/plugins" "$CLAUDE_DIR/"
fi

if [ -d "$BACKUP_DIR/agents" ]; then
    echo "  Copying agents..."
    cp -r "$BACKUP_DIR/agents" "$CLAUDE_DIR/"
fi

if [ -d "$BACKUP_DIR/commands" ]; then
    echo "  Copying commands..."
    cp -r "$BACKUP_DIR/commands" "$CLAUDE_DIR/"
fi

if [ -d "$BACKUP_DIR/hooks" ]; then
    echo "  Copying hooks..."
    cp -r "$BACKUP_DIR/hooks" "$CLAUDE_DIR/"
fi

if [ -d "$BACKUP_DIR/memory" ]; then
    echo "  Copying memory..."
    cp -r "$BACKUP_DIR/memory" "$CLAUDE_DIR/"
fi

if [ -d "$BACKUP_DIR/config" ]; then
    echo "  Copying config files..."
    cp "$BACKUP_DIR/config/"* "$CLAUDE_DIR/" 2>/dev/null || true
fi

echo ""
echo "=========================================="
echo "Restore Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "  1. Restart Claude Code"
echo "  2. Run /mcp to re-authenticate MCP servers"
echo "  3. Test your skills: /career-ops"
echo ""
echo "Restored from: $BACKUP_DIR"
echo "Installed to: $CLAUDE_DIR"
echo ""
