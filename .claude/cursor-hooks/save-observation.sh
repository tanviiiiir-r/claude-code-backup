#!/bin/bash
# Save observation from tool execution

OBSERVATION_DIR="$HOME/.claude/observations"
mkdir -p "$OBSERVATION_DIR"

TIMESTAMP=$(date +%Y%m%d-%H%M%S)
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Observation logged" >> "$OBSERVATION_DIR/observations.log"
