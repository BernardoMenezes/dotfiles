# Memory

## User Preferences

- **GitHub PR comments**: When replying to PR review comments on GitHub, always note that the response is from Claude Code (e.g., append a short note like "— via Claude Code" or similar).

## Working Directory

- Always use absolute paths or `git rev-parse --show-toplevel` when referencing repo-root files, since the working directory may drift during a session (e.g. after running tests in a subdirectory).

## Feedback

- [TDD red-green discipline](feedback_tdd.md) — Always verify tests fail before implementing the fix

## GitHub API Patterns

See [github-api.md](github-api.md) for PR comment reply patterns and other GitHub API notes.
