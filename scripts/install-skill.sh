#!/usr/bin/env bash
set -euo pipefail

# Install a skill from this repo into ~/.claude/skills (personal skills).
# Usage: ./scripts/install-skill.sh <skill-name>

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILL_NAME="${1:-}"

if [ -z "$SKILL_NAME" ]; then
  echo "Usage: ./scripts/install-skill.sh <skill-name>"
  echo ""
  echo "Available skills:"
  for d in "$REPO_DIR"/skills/*/; do
    echo "  - $(basename "$d")"
  done
  exit 1
fi

SOURCE_DIR="$REPO_DIR/skills/$SKILL_NAME"
TARGET_DIR="$HOME/.claude/skills/$SKILL_NAME"

if [ ! -d "$SOURCE_DIR" ]; then
  echo "Skill not found: $SOURCE_DIR"
  exit 1
fi

mkdir -p "$HOME/.claude/skills"
rm -rf "$TARGET_DIR"
cp -R "$SOURCE_DIR" "$TARGET_DIR"

echo "Installed skill: $SKILL_NAME -> $TARGET_DIR"
echo "Restart Claude Code (or start a new session) to pick it up."
echo "Invoke with: /$SKILL_NAME"
