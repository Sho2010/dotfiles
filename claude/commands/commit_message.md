---
description: Generate a Conventional Commits format message for staged changes
---

Analyze the currently staged changes in git and generate a commit message following the Conventional Commits format.

Instructions:
1. Run `git diff --cached` to see all staged changes
2. Run `git status` to see the list of staged files
3. Analyze the changes to understand:
   - The type of change (feat, fix, docs, style, refactor, test, chore, build, ci, perf)
   - The scope (component/module affected)
   - The nature and purpose of the changes
4. Generate a commit message in Conventional Commits format:
   ```
   <type>(<scope>): <short summary>

   <optional body with more details>

   <optional footer>
   ```

Format rules:
- Type must be one of: feat, fix, docs, style, refactor, test, chore, build, ci, perf
- Scope should indicate the affected component (e.g., "api", "ui", "auth", "provider", "tests", "taskfile")
- Summary should be concise, lowercase, and without period at the end
- Body should explain the "what" and "why" (not "how"), provide context if needed
- Add "BREAKING CHANGE:" in footer if there are breaking changes
- Keep the summary line under 72 characters

Present only the final commit message without explanations or commentary.
