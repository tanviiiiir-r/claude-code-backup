---
name: test-generation
description: Generate comprehensive tests for code
description: |
  Use this skill when writing tests.
  Creates unit, integration, and edge case tests.
user-invocable: true
argument-hint: [file-path] [test-type]
---

# Test Generation Skill

Generate comprehensive tests.

## Test Types

### Unit Tests
Test individual functions in isolation:
```python
def test_add_positive_numbers():
    assert add(2, 3) == 5

def test_add_negative_numbers():
    assert add(-2, -3) == -5

def test_add_zero():
    assert add(0, 5) == 5
```

### Edge Cases
- Empty inputs
- Null/None values
- Boundary values
- Large inputs
- Invalid types

### Integration Tests
Test component interactions:
```python
def test_user_registration_flow():
    # Create user
    user = create_user("test@example.com")
    # Verify email sent
    assert email_was_sent(user.email)
    # Verify database entry
    assert user_exists_in_db(user.id)
```

### Property-Based Tests
```python
@given(st.integers(), st.integers())
def test_add_commutative(a, b):
    assert add(a, b) == add(b, a)
```

## Usage

```python
Skill(skill="test-generation", args="{\"file\": \"src/calc.py\", \"type\": \"unit\"}")
```

## Output

Creates test file at appropriate location:
- `tests/unit/test_module.py`
- `tests/integration/test_service.py`

## Patterns

- Arrange-Act-Assert structure
- Descriptive test names
- One assertion per test (ideally)
- Fixtures for common setup
- Parametrized tests for variations
