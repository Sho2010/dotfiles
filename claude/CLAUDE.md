# Global instructions

## Shell tools over python

Don't default to `python3` for simple parsing (e.g. reading JSON, extracting a field, filtering text) when `grep`/`jq`/`sed`/`awk`/Read do the job — but python3 is not banned outright; if it's genuinely the right tool for a task, use it.

Why: `python3 -c "..."` forces a real read-and-reason-about-arbitrary-code review step every time, which is a much higher review cost than a familiar grep/jq/sed/awk one-liner.

How to apply: before reaching for python3, ask whether grep/jq/sed/awk/Read can do it equally well — if yes, use those. Reach for python3 only when the task is genuinely awkward in shell (non-trivial data transformation, multi-step logic), not for "read a JSON field" or "filter some lines".

## Never touch untracked files

Don't stage, delete, move, or rename untracked files (`git status` `??` entries) unless explicitly asked, even when trying to help or clean up. Many workflows deliberately leave scratch/debug files untracked in a repo as in-progress work, not disposable clutter. Looking at or listing untracked files is fine; changing them is not.

## git add scope during rebase/merge

While resolving conflicts during a rebase or merge, never use `git add -A` or `git add .` to bulk-stage changes — use `git add -u` (tracked files only) or explicit paths. A later `git rebase --abort` / `reset --hard` can wipe out untracked files that got swept into the index by a wildcard add, even though `git add` itself doesn't delete anything.

## Destructive git operations: get it right once

For multi-step or destructive git operations (rebase, reset, force-push), don't substitute extra confirmation prompts for correctness — scope the operation correctly the first time (see the two rules above) rather than asking to proceed at every step. If the user says they'd rather do a rebase-like operation themselves, back off rather than pushing to keep helping.
