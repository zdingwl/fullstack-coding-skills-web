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
mkdir -p "$TARGET/.agents/skills" "$TARGET/.claude/skills"

cp "$ROOT/AGENTS.md" "$TARGET/AGENTS.md"
cp "$ROOT/CLAUDE.md" "$TARGET/CLAUDE.md"
cp "$ROOT/AI_SKILLS.md" "$TARGET/AI_SKILLS.md"

# Canonical skill source is .agents/skills. Copy physical files to both agent locations
# so the installed project works consistently on macOS, Linux and Windows checkouts.
cp -R "$ROOT/.agents/skills/." "$TARGET/.agents/skills/"
cp -R "$ROOT/.agents/skills/." "$TARGET/.claude/skills/"

echo "Installed repository-native AI development rules and skills into: $TARGET"
echo "Codex:  AGENTS.md + .agents/skills/*/SKILL.md"
echo "Claude: CLAUDE.md + .claude/skills/*/SKILL.md"
echo "Next: review the added files and commit them to the target repository default branch."
