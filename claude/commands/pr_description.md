---
description: Generate a GitHub PR description for current branch changes (usage: /pr_description [en|ja])
---

Analyze the changes between the current topic branch and main branch, and generate a GitHub Pull Request description.

Instructions:
1. Check if a language argument is provided: "en" for English, "ja" for Japanese (default)
2. Run `git rev-parse --abbrev-ref HEAD` to get the current branch name
3. Run `git diff main...HEAD` to see all changes from main to current branch
4. Run `git log main..HEAD --oneline` to see the commit history
5. Analyze the changes to understand:
   - The purpose and scope of the changes
   - What features/fixes are included
   - What needs to be confirmed/tested
   - Related documentation or issues

Generate a PR description with the following template structure.

IMPORTANT:
- Keep the header names in English (## Summary, ## Changes, ## Confirmation, ## Related docs) regardless of the language argument
- Only translate the content inside each section based on the language argument
- If language is "en", write all content in English
- If language is "ja" or not specified, write all content in Japanese

Template structure:

```markdown
## Summary

[Provide a concise summary of what this PR does and why. Include the motivation and context.]

## Changes

- [List the main changes made in this PR]
- [Be specific about what was added, modified, or removed]

## Confirmation

- [ ] [List items that reviewers should verify]
- [ ] [Include testing steps if applicable]
- [ ] [Mention any breaking changes or migration steps]

## Related docs

- [Link to related issues, documentation, or resources]
- [If none, write "N/A"]
```

Present only the final PR description without explanations or commentary.
