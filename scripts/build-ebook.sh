#!/bin/bash
# 一键生成 AI Playbook.epub
# Markdown 仓库是 single source of truth，本脚本只做组装，不复制内容。
# 用法：./scripts/build-ebook.sh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="$ROOT/dist/AI-Playbook.epub"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

command -v pandoc >/dev/null || { echo "缺 pandoc：macOS 跑 brew install pandoc"; exit 1; }

# 章节顺序：显式列出，不依赖 find 排序（数组顺序 = EPUB 章节顺序）
CHAPTERS=(
  README.md
  01-tools/ai-agents.md
  02-playbooks/coding.md
  02-playbooks/writing.md
  02-playbooks/research.md
  02-playbooks/learning.md
  02-playbooks/image-video.md
  03-agent-systems/skills.md
  03-agent-systems/harness.md
  03-agent-systems/multi-agent.md
  03-agent-systems/context.md
  03-agent-systems/memory.md
  04-recipes/debugging.md
  04-recipes/code-review.md
  04-recipes/handoff.md
  04-recipes/long-running-task.md
  05-prompts/prompt-library.md
  06-troubleshooting/troubleshooting.md
)

for f in "${CHAPTERS[@]}"; do
  [ -f "$ROOT/$f" ] || { echo "缺章节：$f"; exit 1; }
done

# 末尾附 License 页（短版，全文见仓库 LICENSE 文件）
cat > "$TMP/license.md" <<'EOF'
# License

除特别注明的第三方材料外，本书原创内容采用 CC BY 4.0（署名-相同方式共享不要求，仅需署名）。

完整法律文本见仓库根目录 `LICENSE` 文件。
EOF

# 跨文件 .md 链接改写成 EPUB 章内跳转。
# pandoc 按输入顺序编号章节（ch001 起），这里从同一数组推导映射，不另维护 manifest。
STAGE="$TMP/stage"
FINAL="$TMP/final"
mkdir -p "$STAGE" "$FINAL"
RULES="$TMP/rewrite.sed"
: > "$RULES"
i=0
for f in "${CHAPTERS[@]}"; do
  i=$((i + 1))
  ch=$(printf "ch%03d.xhtml" "$i")
  base="$(basename "$f" .md)"
  # [x](任意路径/base.md[#描点]) -> [x](chNNN.xhtml)（ERE：字面括号转义，量词 ? 不转义）
  echo "s|\\]\\(([^)]*/)?${base}\\.md(#[^)]*)?\\)|](${ch})|g" >> "$RULES"
  cp "$ROOT/$f" "$STAGE/$i.md"
done
i=$((i + 1)) # license 页是最后一章
cp "$TMP/license.md" "$STAGE/$i.md"
# 目录 / LICENSE 链接 -> 对应章节
cat >> "$RULES" <<'EOF'
s|\]\((\.\./)*02-playbooks/\)|](ch003.xhtml)|g
s|\]\((\.\./)*03-agent-systems/\)|](ch008.xhtml)|g
s|\]\((\.\./)*04-recipes/\)|](ch013.xhtml)|g
s|\]\((\.\./)*05-prompts/\)|](ch017.xhtml)|g
s|\]\((\.\./)*01-tools/\)|](ch002.xhtml)|g
s|\]\((\.\./)*06-troubleshooting/\)|](ch018.xhtml)|g
s|\]\(LICENSE\)|](ch019.xhtml)|g
EOF
INPUTS=()
total=$((${#CHAPTERS[@]} + 1))
for ((n = 1; n <= total; n++)); do
  sed -E -f "$RULES" "$STAGE/$n.md" > "$FINAL/$n.md"
  INPUTS+=("$FINAL/$n.md")
done

mkdir -p "$ROOT/dist"

pandoc "${INPUTS[@]}" -o "$OUT" \
  --toc --toc-depth=2 \
  --metadata title="AI Playbook" \
  --metadata author="MachineGunLin" \
  --metadata lang="zh-CN" \
  --metadata rights="CC BY 4.0" \
  --split-level=1

echo "OK: $OUT ($(du -h "$OUT" | cut -f1))"
