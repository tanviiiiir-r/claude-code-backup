#!/bin/bash
# Session initialization hook

SESSION_DIR="$HOME/.claude/sessions/$(date +%Y%m%d-%H%M%S)"
mkdir -p "$SESSION_DIR"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Session started" >> "$SESSION_DIR/session.log"
echo "Session directory: $SESSION_DIR" >> "$SESSION_DIR/session.log"
