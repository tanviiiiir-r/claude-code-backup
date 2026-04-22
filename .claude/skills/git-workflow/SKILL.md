---
name: git-workflow
description: Execute Git workflows following best practices
description: |
  Use this skill for Git operations.
  Follows commit conventions, branch strategies, and safety checks.
user-invocable: true
argument-hint: [action] [args]
---

# Git Workflow Skill

Execute Git operations safely.

## Supported Actions

### Commit
```python
Skill(skill="git-workflow", args="{\"action\": \"commit\", \"message\": \"Add feature\", \"files\": [\"src.py\"]}")
```

Creates commit following conventions:
- Imperative mood ("Add" not "Added")
- Concise subject (<50 chars)
- Body explains why
- Separate commits per logical change

### Branch
```python
Skill(skill="git-workflow", args="{\"action\": \"branch\", \"name\": \"feature/x\", \"base\": \"main\"}")
```

### PR Creation
```python
Skill(skill="git-workflow", args="{\"action\": \"pr\", \"title\": \"Add feature\", \"body\": \"...\"}")
```

### Sync
```python
Skill(skill="git-workflow", args="{\"action\": \"sync\", \"branch\": \"main\"}")
```

## Safety Checks

Before destructive operations:
- Uncommitted changes backed up?
- Branch up to date?
- Tests passing?
- User confirmation for: reset --hard, push --force

## Conventions

### Branch Naming
- `feature/description`
- `fix/description`
- `refactor/description`
- `docs/description`

### Commit Messages
```
Add user authentication

- Implement JWT token generation
- Add middleware for protected routes
- Include bcrypt for password hashing

Closes #123
```
