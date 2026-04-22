---
name: test-generation
user-invocable: true
---

Generate tests.

Unit:
  - Test one function at a time
  - Mock external dependencies
  - Arrange-Act-Assert

Edge cases:
  - Empty, None, 0
  - Boundaries
  - Invalid types

Coverage:
  - Minimum 80%
  - Measure: pytest --cov

Structure:
  tests/unit/test_module.py
  tests/integration/test_api.py