#!/bin/bash
# Session summary hook - runs on stop

SESSION_DIR="$HOME/.claude/sessions"
LATEST=$(ls -t "$SESSION_DIR" 2>/dev/null | head -1)

if [ -n "$LATEST" ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Session ended" >> "$SESSION_DIR/$LATEST/session.log"
fi
