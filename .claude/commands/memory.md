---
name: memory
description: Load and manage memory for the current context
description: |
  Loads relevant memory based on current file/directory context.
  Searches for CLAUDE.md files and memory entries.
user-invocable: true
argument-hint: [topic]
---

# Memory Command

Load contextually relevant memory.

## Usage

```
/memory
/memory python
/memory auth
```

## Behavior

1. **Context Detection** - Identifies current file/directory
2. **Memory Search** - Finds relevant `.claude/memory/` entries
3. **CLAUDE.md Discovery** - Locates applicable rules files
4. **Summary** - Presents findings concisely

## Example

```python
/memory

# Output:
# Found 3 relevant memories:
# - .claude/memory/python-patterns.md
# - .claude/memory/testing-strategies.md
# - CLAUDE.md (current directory)
#
# Key patterns:
# - Use type hints
# - Prefer dataclasses over dicts
# - Write tests first
```
