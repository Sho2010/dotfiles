#!/usr/bin/env bash
# resume-find: 全 Claude Code セッションを横断検索し、/resume 候補を提示する。
# working dir 非依存。依存は rg (ripgrep) と jq のみ (Python 不要)。
#
# 使い方:
#   resume-find.sh <検索語> [検索語2 ...]     # 全語を含む(AND)セッションを新しい順に
#   resume-find.sh --days 30 <検索語>          # 直近 N 日に絞る
#   resume-find.sh --project sre <検索語>      # cwd に文字列を含むプロジェクトに絞る
#   resume-find.sh --limit 10 <検索語>         # 表示セッション数 (既定 15)
set -euo pipefail

ROOT="${CLAUDE_PROJECTS_DIR:-$HOME/.claude/projects}"
LIMIT=15
DAYS=""
PROJ=""
TERMS=()

while [ $# -gt 0 ]; do
  case "$1" in
    --limit)   LIMIT="$2"; shift 2 ;;
    --days)    DAYS="$2";  shift 2 ;;
    --project) PROJ="$2";  shift 2 ;;
    --)        shift; while [ $# -gt 0 ]; do TERMS+=("$1"); shift; done ;;
    *)         TERMS+=("$1"); shift ;;
  esac
done

if [ "${#TERMS[@]}" -eq 0 ]; then
  echo "usage: resume-find.sh [--days N] [--project STR] [--limit N] <検索語> [検索語...]" >&2
  exit 2
fi
[ -d "$ROOT" ] || { echo "セッション保存先が見つかりません: $ROOT" >&2; exit 1; }

SINCE=""
if [ -n "$DAYS" ]; then
  SINCE="$(date -u -v-"${DAYS}"d '+%Y-%m-%dT%H:%M:%SZ' 2>/dev/null \
        || date -u -d "${DAYS} days ago" '+%Y-%m-%dT%H:%M:%SZ')"
fi

# 1語目で候補ファイルを高速プレフィルタ
mapfile -t FILES < <(rg -l -i -F -- "${TERMS[0]}" "$ROOT" --glob '*.jsonl' 2>/dev/null || true)
[ "${#FILES[@]}" -eq 0 ] && { echo "ヒットなし: ${TERMS[*]}"; exit 0; }

# 各ファイルを検索可能な TSV へ整形: ts \t cwd \t branch \t sid \t role \t text
STREAM="$(
  for f in "${FILES[@]}"; do
    jq -rc '
      def totext:
        if type=="string" then .
        elif type=="array" then
          [ .[] | (.text // .thinking //
             (if .type=="tool_use" then ((.name//"")+" "+((.input//{})|tostring)) else empty end)) ]
          | join(" ")
        else "" end;
      select(.type=="user" or .type=="assistant")
      | {ts:(.timestamp//""), cwd:(.cwd//"?"), br:(.gitBranch//""),
         sid:(.sessionId//""), role:(.message.role//.type),
         text:((.message.content//"")|totext|gsub("[\n\t\r]+";" "))}
      | select(.text|length>0)
      | [.ts,.cwd,.br,.sid,.role,.text] | @tsv
    ' "$f" 2>/dev/null || true
  done
)"

# 全 TERMS を AND で絞り込み
for t in "${TERMS[@]}"; do
  STREAM="$(printf '%s\n' "$STREAM" | rg -i -F -- "$t" || true)"
done
[ -z "$STREAM" ] && { echo "ヒットなし: ${TERMS[*]}"; exit 0; }

# 期間 / プロジェクト絞り込み + セッション単位に集約し、抜粋を作る
AGG="$(printf '%s\n' "$STREAM" | awk -F'\t' -v ft="${TERMS[0]}" -v since="$SINCE" -v proj="$PROJ" '
  {
    ts=$1; cwd=$2; br=$3; sid=$4; role=$5; text=$6;
    if (since!="" && ts<since) next;
    if (proj!="" && index(tolower(cwd), tolower(proj))==0) next;
    cnt[sid]++;
    if (mn[sid]=="" || ts<mn[sid]) mn[sid]=ts;
    if (mx[sid]=="" || ts>mx[sid]) mx[sid]=ts;
    cw[sid]=cwd; bn[sid]=br;
    # 抜粋は user 発言を優先し、1語目のヒット周辺を切り出す
    if (snip[sid]=="" || (role=="user" && srole[sid]!="user")) {
      lc=tolower(text); p=index(lc, tolower(ft));
      start=(p>60)?p-60:1;
      s=substr(text, start, 240);
      if (start>1) s="…" s;
      if (length(text) > start+240) s=s "…";
      snip[sid]=s; srole[sid]=role;
    }
  }
  END {
    for (s in cnt)
      printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\n", mx[s], mn[s], cw[s], bn[s], s, cnt[s], snip[s];
  }
')"
[ -z "$AGG" ] && { echo "ヒットなし (絞り込み後): ${TERMS[*]}"; exit 0; }

TOTAL="$(printf '%s\n' "$AGG" | rg -c '^' || echo 0)"

# 新しい順に並べて resume 候補として整形
printf '%s\n' "$AGG" \
  | sort -t$'\t' -k1,1r \
  | head -n "$LIMIT" \
  | awk -F'\t' '
    {
      mx=$1; mn=$2; cwd=$3; br=$4; sid=$5; cnt=$6; snip=$7;
      d1=substr(mn,1,10) " " substr(mn,12,5);
      d2=substr(mx,1,10) " " substr(mx,12,5);
      span=(substr(mn,1,10)==substr(mx,1,10)) ? d2 : (d1 " 〜 " d2);
      printf "▸ %s%s\n", cwd, (br!=""?"  ["br"]":"");
      printf "  %s ・ %s件ヒット\n", span, cnt;
      printf "  %s\n", snip;
      gsub(/\047/, "\047\\\047\047", cwd);
      printf "  ▶ cd %s && claude --resume %s\n\n", "\047" cwd "\047", sid;
    }'

echo "── ${TOTAL} セッションにヒット (上位 ${LIMIT} 件 / 検索語: ${TERMS[*]}) ──"
