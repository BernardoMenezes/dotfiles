# GitHub API Patterns

## Replying to PR review comments

To reply to a PR review comment, use `POST /repos/{owner}/{repo}/pulls/{pr}/comments` with `in_reply_to` — NOT `/replies` on the comment endpoint (that 404s).

```bash
gh api repos/SolidCredit/solidcredit/pulls/{PR_NUMBER}/comments -X POST \
  -f 'body=Your reply text' \
  -F 'in_reply_to={PARENT_COMMENT_ID}' \
  -f 'commit_id={PR_HEAD_SHA}' \
  -f 'path=path/to/file.md' \
  -F 'line={LINE_NUMBER}'
```

Key gotchas:
- Get the commit SHA from `gh api repos/.../pulls/{n} --jq '.head.sha'`, NOT from local `git log` (local may be truncated/different)
- The `in_reply_to` field is what makes it a reply vs a new comment
- Get parent comment IDs via `gh api repos/.../pulls/{n}/comments --jq '.[].id'`
