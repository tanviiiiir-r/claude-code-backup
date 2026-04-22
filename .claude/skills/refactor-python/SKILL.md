---
name: refactor-python
user-invocable: true
---

Python refactoring.

Type hints:
  def func(data: dict[str, Any]) -> list[Item]:

Dataclasses:
  @dataclass
  class Point:
      x: float
      y: float

Context managers:
  with open(path) as f:
      data = f.read()

Comprehensions:
  [x*2 for x in items if x > 0]

Walrus:
  if match := pattern.search(text):
      return match.group(1)

Pathlib:
  Path("/etc") / "config.yaml"