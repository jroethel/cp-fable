#!/usr/bin/env bash
# Installs the Fable operating manual + learning-guide skill into a Claude config dir.
# Usage: ./install.sh [config-dir]   (default: ~/.claude)
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)"
DEST="${1:-$HOME/.claude}"

[ -d "$DEST" ] || { echo "error: $DEST does not exist"; exit 1; }

cp "$SRC/fable-manual.md" "$DEST/fable-manual.md"
mkdir -p "$DEST/skills/learning-guide"
cp "$SRC/skills/learning-guide/SKILL.md" "$DEST/skills/learning-guide/SKILL.md"

CLAUDE_MD="$DEST/CLAUDE.md"
IMPORT_LINE="@$DEST/fable-manual.md"
if ! grep -qF "fable-manual.md" "$CLAUDE_MD" 2>/dev/null; then
  printf '\n## Fable Operating Manual\nInhabit this way of working in every session:\n%s\n' "$IMPORT_LINE" >> "$CLAUDE_MD"
  echo "added import to $CLAUDE_MD"
else
  echo "import already present in $CLAUDE_MD"
fi

echo "installed: $DEST/fable-manual.md, $DEST/skills/learning-guide/SKILL.md"
