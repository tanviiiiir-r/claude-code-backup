#!/bin/bash
# Context injection hook - runs before prompt submission

CONTEXT_FILE="$HOME/.claude/context.md"

if [ -f "$CONTEXT_FILE" ]; then
    echo "# Context Injection"
    cat "$CONTEXT_FILE"
fi
