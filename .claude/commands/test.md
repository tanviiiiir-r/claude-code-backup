---
name: test
description: Run test suite with coverage and reporting
description: |
  Comprehensive testing including unit, integration, and e2e tests.
  Generates coverage reports and failure analysis.
user-invocable: true
argument-hint: [--unit|--integration|--e2e|--all] [--coverage] [--parallel]
---

# Test Command

Run comprehensive test suite.

## Usage

```
/test                              # Run changed tests
/test --unit                       # Unit tests only
/test --integration                # Integration tests only
/test --e2e                       # End-to-end tests
/test --all                       # All test types
/test --coverage                  # With coverage report
/test --parallel                  # Parallel execution
/test --failed                    # Re-run failed tests
```

## Test Levels

### Unit Tests
- Test individual functions
- Mock external dependencies
- Fast execution (< 1s per test)
- Run on every commit

### Integration Tests
- Test component interactions
- Use test database
- Test API endpoints
- Run before deployment

### E2E Tests
- Test full user flows
- Use real browser (Playwright/Selenium)
- Test critical paths only
- Run nightly or before major releases

## Output

```
🧪 RUNNING TESTS
   Type: all
   Coverage: enabled
   Parallel: enabled

📊 UNIT TESTS
   Running......................................................
   ✅ 142 passed
   ⏱️  Time: 3.42s

📊 INTEGRATION TESTS
   Running......................................................
   ✅ 56 passed
   ⏱️  Time: 12.8s

📊 E2E TESTS
   Running......................................................
   ✅ 18 passed
   ⏱️  Time: 45.2s

📈 COVERAGE REPORT
   File                  Stmts    Miss   Cover
   -------------------------------------------
   src/__init__.py          12       0   100%
   src/main.py             156       8    95%
   src/api.py              234      23    90%
   src/db.py                89       5    94%
   -------------------------------------------
   TOTAL                   491      36    93%

✅ ALL TESTS PASSED
   Total: 216 tests
   Coverage: 93%
   Duration: 61.4s
```

## Configuration

Create `pytest.ini`:
```ini
[pytest]
testpaths = tests
python_files = test_*.py
python_classes = Test*
python_functions = test_*
addopts = -v --tb=short --strict-markers
markers =
    unit: Unit tests
    integration: Integration tests
    e2e: End-to-end tests
    slow: Slow tests
```

## Pre-Deployment Requirements

- Unit tests: 100% pass rate
- Coverage: > 80%
- Integration tests: 100% pass rate
- No critical E2E failures

## Failure Analysis

If tests fail:
```
❌ TEST FAILURE

🔴 FAILED: test_user_login
   File: tests/test_auth.py:45
   Error: AssertionError: expected 200, got 401
   
💡 LIKELY CAUSE
   Recent change to auth middleware (commit abc123)
   
🔧 SUGGESTED FIX
   Check token validation logic in src/auth.py:78
```
