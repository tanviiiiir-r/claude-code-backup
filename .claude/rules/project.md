# Project Rules

## Code
- Type hints required
- 80% test coverage minimum
- No secrets in code (use env vars)

## Git
- Separate commits per change
- Imperative mood, <50 chars
- Rebase on main before merge

## Security
- Scan before commit: /security-scan
- Scan before deploy: /security-scan --full
- Block on secrets detection