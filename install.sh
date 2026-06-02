#!/bin/bash
# Claude Code Self-Improvement System - One-line installer
# Usage: curl -fsSL https://raw.githubusercontent.com/phuongddx/claude-code-self-improvement/main/install.sh | bash

set -e

echo "🧠 Installing Claude Code Self-Improvement System..."

# Create directories
mkdir -p .claude/skills .claude/knowledge

# Download files
BASE_URL="https://raw.githubusercontent.com/phuongddx/claude-code-self-improvement/main"

curl -fsSL "$BASE_URL/.claude/skills/self-improvement-review.md" -o .claude/skills/self-improvement-review.md
curl -fsSL "$BASE_URL/.claude/knowledge/pitfalls.md" -o .claude/knowledge/pitfalls.md
curl -fsSL "$BASE_URL/.claude/knowledge/workflows.md" -o .claude/knowledge/workflows.md
curl -fsSL "$BASE_URL/.claude/knowledge/decisions.md" -o .claude/knowledge/decisions.md
curl -fsSL "$BASE_URL/CLAUDE.md" -o CLAUDE.md 2>/dev/null || true

# Merge settings.json
if [ -f ".claude/settings.json" ]; then
  echo "⚠️  .claude/settings.json exists. Add hook manually:"
  echo '  "hooks": { "Stop": [{ "hooks": [{"type": "command", "command": "echo REVIEW_HINT"}] }] }'
else
  curl -fsSL "$BASE_URL/.claude/settings.json" -o .claude/settings.json
fi

echo ""
echo "✅ Done! Claude Code will now self-review after significant tasks."
echo ""
echo "Files installed:"
echo "  .claude/skills/self-improvement-review.md"
echo "  .claude/knowledge/{pitfalls,workflows,decisions}.md"
echo "  .claude/settings.json (Stop hook)"
echo ""
echo "Usage:"
echo "  • Auto-triggered after complex tasks"
echo "  • Say 'review what you learned' to trigger manually"
echo "  • Check .claude/knowledge/ for past learnings"
