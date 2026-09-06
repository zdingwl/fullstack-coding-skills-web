#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-}"
if [[ -z "$TARGET" ]]; then
  echo "Usage: $0 /path/to/project"
  exit 1
fi
if [[ ! -d "$TARGET/.git" ]]; then
  echo "Error: target is not a Git repository: $TARGET"
  exit 1
fi

ROOT="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$TARGET/.agents/skills/repository-development"
mkdir -p "$TARGET/.claude/skills/repository-development"
cp "$ROOT/AGENTS.md" "$TARGET/AGENTS.md"
cp "$ROOT/CLAUDE.md" "$TARGET/CLAUDE.md"
cp "$ROOT/AI_SKILLS.md" "$TARGET/AI_SKILLS.md"
cp "$ROOT/.agents/skills/repository-development/SKILL.md" "$TARGET/.agents/skills/repository-development/SKILL.md"
cp "$ROOT/.claude/skills/repository-development/SKILL.md" "$TARGET/.claude/skills/repository-development/SKILL.md"

echo "Installed AI repository development skills into: $TARGET"
echo "Review the files, then commit them to the target repository default branch."
