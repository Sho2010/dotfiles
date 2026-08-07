---
name: resume-find
description: 全 Claude Code セッションを working dir 非依存で横断検索し、/resume する対象を見つける。「これどこでやったっけ？」「前に XX した件のセッションどこ」「あのプロジェクトの続きどこから」など、過去の作業・相談を再開したいときに使う。
allowed-tools: Bash(~/.claude/skills/resume-find/resume-find.sh:*), Bash(bash ~/.claude/skills/resume-find/resume-find.sh:*)
---

全セッション横断で過去の会話を検索し、`claude --resume` する候補を提示するスキル。
履歴は `~/.claude/projects/<cwd>/*.jsonl` に保存されており、これを一括検索する。

## 手順

1. `$ARGUMENTS` が検索クエリ。空なら「何を探す?(キーワードやプロジェクト名)」と一言だけ聞く。
2. 次のスクリプトを実行する(引数はユーザーのクエリをそのまま渡す。空白区切りは AND 検索):

   ```bash
   ~/.claude/skills/resume-find/resume-find.sh $ARGUMENTS
   ```

   オプション:
   - `--days N`     直近 N 日に絞る
   - `--project STR` cwd に STR を含むプロジェクトに絞る
   - `--limit N`    表示セッション数(既定 15)

3. 出力はセッション単位に集約済み(日時範囲 / プロジェクト(cwd と branch) / ヒット件数 / 抜粋 / 再開用ワンライナー)。
   これをそのまま提示しつつ、ユーザーの意図に合いそうな1〜2件を「これが近そう」と一言添えて絞る。
4. ユーザーがどのセッションかを選んだら、そのセッションの **`cd '<cwd>' && claude --resume <id>`** のワンライナーを
   コピペしやすい形で1行だけ提示する(`claude --resume` は cwd 依存のため cd を必ず前置する)。
   スクリプト出力の各セッション末尾に既にこの形で出ているので、それを抜き出して渡すだけでよい。

## 補足

- 0 件のときは検索語を緩める案(表記ゆれ・英日切替・語を減らす・`--days` を外す)を1〜2個出す。
- ヒットが多すぎるときは `--project` や `--days` で絞り直す。
- 抜粋にツール実行ログ(Bash コマンド等)が出ることがあるが、それも「どこで何を実行したか」の手がかりになる。
