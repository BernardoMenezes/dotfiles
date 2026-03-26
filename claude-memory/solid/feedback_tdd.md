---
name: TDD red-green discipline
description: Always verify tests fail before implementing the fix (red-green-refactor cycle)
type: feedback
---

When following a TDD plan, always run the test first to confirm it fails (red step) before writing the implementation (green step). Do not write test and implementation simultaneously.

**Why:** The user wants confidence that the test actually catches the problem. Skipping the red step undermines TDD discipline.

**How to apply:** When a plan specifies red-green steps, run the test after creating it and confirm failure before proceeding to implement the fix.
