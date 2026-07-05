#!/usr/bin/env bash
set -euo pipefail

# List every skill in this repo with its trigger description.
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

for skill_md in "$REPO_DIR"/skills/*/SKILL.md; do
  name=$(basename "$(dirname "$skill_md")")
  desc=$(awk -F': ' '/^description:/{print $2; exit}' "$skill_md")
  printf '%-24s %s\n' "$name" "$desc"
done
