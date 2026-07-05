#!/usr/bin/env bash
set -euo pipefail

# Run a skill's eval cases against the model that will actually execute it.
# Usage: ./scripts/run-evals.sh <skill-name> [model]
# Example: ./scripts/run-evals.sh linkedin-signal-posts sonnet
# Requires the claude CLI (npm install -g @anthropic-ai/claude-code) and python3.

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILL="${1:-}"
MODEL="${2:-sonnet}"

if [ -z "$SKILL" ]; then
  echo "Usage: ./scripts/run-evals.sh <skill-name> [model]"
  exit 1
fi

SKILL_MD="$REPO_DIR/skills/$SKILL/SKILL.md"
EVALS="$REPO_DIR/evals/$SKILL.jsonl"
[ -f "$SKILL_MD" ] || { echo "Skill not found: $SKILL_MD"; exit 1; }
[ -f "$EVALS" ]    || { echo "No eval cases: $EVALS"; exit 1; }
command -v claude >/dev/null || { echo "Needs the claude CLI: npm install -g @anthropic-ai/claude-code"; exit 1; }

OUT_DIR="$REPO_DIR/evals/runs/$SKILL/$(date +%Y-%m-%d)-$MODEL"
mkdir -p "$OUT_DIR"
SKILL_BODY="$(cat "$SKILL_MD")"

while IFS= read -r line; do
  [ -z "$line" ] && continue
  id=$(printf '%s' "$line" | python3 -c 'import json,sys; print(json.load(sys.stdin)["id"])')
  input=$(printf '%s' "$line" | python3 -c 'import json,sys; print(json.load(sys.stdin)["input"])')
  echo "running: $id"
  claude -p --model "$MODEL" "Follow this skill exactly:

$SKILL_BODY

---
User request:
$input" > "$OUT_DIR/$id.md" 2>&1 || echo "  run failed: $id (see $OUT_DIR/$id.md)"
done < "$EVALS"

echo ""
echo "Outputs: $OUT_DIR"
echo "Score them against the eval's 'expected' field (and evals/rubric.md where one exists)."
echo "Anything that misses goes to /skill-repair-loop with the bad output attached."
