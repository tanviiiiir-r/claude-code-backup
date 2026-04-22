---
name: refactor-python
description: Apply Python refactoring patterns to improve code quality
description: |
  Use this skill when refactoring Python code.
  Applies best practices and modern Python patterns.
user-invocable: true
argument-hint: [file-path] [pattern]
---

# Refactor Python Skill

Apply Python best practices refactoring.

## Supported Refactors

### Type Hints
```python
# Before
def process(data):
    return data.items()

# After  
def process(data: dict[str, Any]) -> list[tuple[str, Any]]:
    return data.items()
```

### Dataclasses
```python
# Before
class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

# After
from dataclasses import dataclass

@dataclass
class Point:
    x: float
    y: float
```

### Context Managers
```python
# Before
f = open(file)
data = f.read()
f.close()

# After
with open(file) as f:
    data = f.read()
```

### List/Generator Comprehensions
```python
# Before
result = []
for x in items:
    if x > 0:
        result.append(x * 2)

# After
result = [x * 2 for x in items if x > 0]
```

### Walrus Operator
```python
# Before
match = pattern.search(text)
if match:
    return match.group(1)

# After
if match := pattern.search(text):
    return match.group(1)
```

## Usage

```python
Skill(skill="refactor-python", args="{\"file\": \"src/module.py\", \"pattern\": \"type-hints\"}")
```

## Patterns

- `type-hints` - Add comprehensive type annotations
- `dataclasses` - Convert classes to dataclasses
- `comprehensions` - Use list/dict/set comprehensions
- `context-managers` - Apply context managers
- `walrus` - Use assignment expressions
- `f-strings` - Convert to f-strings
- `pathlib` - Use pathlib instead of os.path
- `all` - Apply all applicable patterns
