# Project Rules

These rules apply to all sessions in this repository.

## Code Style

- Use type hints on all function signatures
- Prefer dataclasses over dicts for structured data
- Use `pathlib.Path` instead of `os.path`
- F-strings for string formatting
- Maximum line length: 100 characters

## Testing

- Write tests for all new functionality
- Maintain 80% code coverage minimum
- Use pytest fixtures for common setup
- Mock external dependencies

## Git

- Commit message format: "Type: Description"
- Types: Add, Fix, Refactor, Docs, Test, Chore
- One logical change per commit
- Rebase feature branches on main before merging

## Documentation

- Docstrings for all public functions
- README updates for user-facing changes
- Architecture Decision Records for major decisions

## Security

- No secrets in code (use environment variables)
- Validate all user inputs
- Use parameterized queries (no SQL injection)
- Sanitize output (no XSS)
