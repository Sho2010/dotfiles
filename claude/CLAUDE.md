# Global instructions

## Shell tools over python

Don't default to `python3` for simple parsing (e.g. reading JSON, extracting a field, filtering text) when `grep`/`jq`/`sed`/`awk`/Read do the job — but python3 is not banned outright; if it's genuinely the right tool for a task, use it.

Why: `python3 -c "..."` forces a real read-and-reason-about-arbitrary-code review step every time, which is a much higher review cost than a familiar grep/jq/sed/awk one-liner.

How to apply: before reaching for python3, ask whether grep/jq/sed/awk/Read can do it equally well — if yes, use those. Reach for python3 only when the task is genuinely awkward in shell (non-trivial data transformation, multi-step logic), not for "read a JSON field" or "filter some lines".

## sed is GNU sed (even on darwin)

This environment uses GNU sed on macOS too, not BSD sed. Write GNU syntax: `sed -i 's/a/b/' file` (no `''` after `-i`), and GNU extensions like `\+`, `\?`, `\|`, `-E`, `-z` are fine. Don't add BSD/GNU compatibility workarounds.

## Never touch untracked files

Don't stage, delete, move, or rename untracked files (`git status` `??` entries) unless explicitly asked, even when trying to help or clean up. Many workflows deliberately leave scratch/debug files untracked in a repo as in-progress work, not disposable clutter. Looking at or listing untracked files is fine; changing them is not.

## git add scope during rebase/merge

While resolving conflicts during a rebase or merge, never use `git add -A` or `git add .` to bulk-stage changes — use `git add -u` (tracked files only) or explicit paths. A later `git rebase --abort` / `reset --hard` can wipe out untracked files that got swept into the index by a wildcard add, even though `git add` itself doesn't delete anything.

## Destructive git operations: get it right once

For multi-step or destructive git operations (rebase, reset, force-push), don't substitute extra confirmation prompts for correctness — scope the operation correctly the first time (see the two rules above) rather than asking to proceed at every step. If the user says they'd rather do a rebase-like operation themselves, back off rather than pushing to keep helping.

Before running `git checkout --`/`restore`/`reset --hard`/`clean -f`, always read `git diff`/`git status` yourself first and scope the command precisely (explicit paths, not a bare HEAD-wide reset) — don't guess and don't ask the user to confirm the scope as a substitute for getting it right. Adding a confirmation step is not the fix; reading the actual state before acting is. (A PreToolUse hook in settings.json blocks the most common dangerous patterns as a backstop, but don't rely on that instead of checking yourself.)

## Frustration is not consent

A frustrated or emotional reply to a proposal (swearing, a bare interjection, an unclear short reaction) is not a yes. Don't treat it as authorization to proceed with your own judgment call — stop and wait for an explicit instruction instead. This applies even under Auto Mode's "keep going" bias; an unclear emotional reaction is exactly the kind of case that bias should not cover.

## @file mentions are a scope boundary

When the user specifies a file via `@file`, treat that as the working scope. Don't read or act on other files — including nearby untracked notes/docs that look relevant — without asking first. An untracked `.md` file may be a draft or an in-progress personal memo, not a confirmed spec; don't silently treat its contents as an implementation basis just because it seems related.

## Self-assessment bias

When investigating a complaint about your own past behavior, don't dismiss it based on a narrow literal reading of the complaint's wording (e.g., "I didn't technically call Edit, so this didn't happen"). Identify the substance of what the user is complaining about first, then judge against that substance — apply the same rigor to your own conduct that you'd apply to anyone else's.

## End-of-turn behavior
- タスク完了時に "commit and push" 系のサジェストをUIに出さない。
- commit, push, PR 作成は、ユーザーが明示的に依頼したときだけ実行する。

