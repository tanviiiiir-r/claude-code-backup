---
name: code-review
description: |
  Trigger a comprehensive code review workflow.
  Spawns parallel agents to check for bugs, style, and CLAUDE.md compliance.
user-invocable: true
argument-hint: [pr-number-or-branch] [--comment]
---

# Code Review Command

Trigger multi-agent code review workflow.

## Usage

```
/review PR-123
/review feature-branch --comment
/review HEAD~3
```

## Workflow

1. **Pre-check** - Verify PR is open and not already reviewed
2. **CLAUDE.md Check** - Find relevant CLAUDE.md files
3. **Parallel Review** - Spawn 4 agents simultaneously:
   - Agent 1: CLAUDE.md compliance (rules check)
   - Agent 2: CLAUDE.md compliance (patterns check)
   - Agent 3: Bug scan (syntax/logic)
   - Agent 4: Bug scan (security/issues)
4. **Validation** - Verify flagged issues are real
5. **Report** - Output findings

## Options

- `--comment` - Post review as GitHub PR comments
- `--quick` - Skip validation step (faster but less accurate)

## Example

```python
/review 456 --comment

# Triggers:
# 1. Pre-check agent
# 2. 4 parallel review agents
# 3. Validation for flagged issues
# 4. Summary report
# 5. Comments posted to PR (if --comment)
```

## Output

```
## Code Review Summary

- Files reviewed: 12
- Issues found: 3
- CLAUDE.md violations: 1
- Potential bugs: 2

### Issues
1. [CLAUDE.md] Line 45: Missing error handling
2. [Bug] Line 78: Possible null reference
3. [Bug] Line 123: Unhandled promise rejection
```
