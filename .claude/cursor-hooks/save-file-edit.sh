#!/bin/bash
# Save file edit observation

EDIT_DIR="$HOME/.claude/file-edits"
mkdir -p "$EDIT_DIR"

TIMESTAMP=$(date +%Y%m%d-%H%M%S)
echo "[$(date '+%Y-%m-%d %H:%M:%S')] File edited" >> "$EDIT_DIR/edits.log"
