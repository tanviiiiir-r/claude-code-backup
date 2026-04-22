# Python Best Practices

Rules for Python development.

## Type Hints

```python
# Good
def process(data: dict[str, Any]) -> list[Item]:
    ...

# Avoid
def process(data):
    ...
```

## Error Handling

```python
# Good
try:
    result = risky_operation()
except SpecificError as e:
    logger.error(f"Operation failed: {e}")
    raise ServiceError from e

# Avoid
try:
    result = risky_operation()
except Exception:
    pass
```

## Imports

```python
# Good
from pathlib import Path
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from models import User

# Avoid
from pathlib import *
```

## Async

```python
# Good
async def fetch(url: str) -> Response:
    async with aiohttp.ClientSession() as session:
        return await session.get(url)

# Avoid
async def fetch(url):
    session = aiohttp.ClientSession()
    return await session.get(url)  # Leaks session
```

## Resources

```python
# Good
with open(path) as f:
    data = f.read()

# Avoid
f = open(path)
data = f.read()
f.close()
```
