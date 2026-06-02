#!/bin/bash
# Claude Code Self-Improvement System - Enhanced Auto-Trigger Version
# Usage: curl -fsSL https://raw.githubusercontent.com/phuongddx/claude-code-self-improvement/main/install-auto.sh | bash

set -e

echo "🧠 Installing Claude Code Self-Improvement System (Auto-Trigger)..."

# Create directories
mkdir -p .claude/skills .claude/knowledge

# Download files
BASE_URL="https://raw.githubusercontent.com/phuongddx/claude-code-self-improvement/main"

curl -fsSL "$BASE_URL/skills/self-improvement-review-auto.md" -o .claude/skills/self-improvement-review.md
curl -fsSL "$BASE_URL/knowledge/pitfalls.md" -o .claude/knowledge/pitfalls.md
curl -fsSL "$BASE_URL/knowledge/workflows.md" -o .claude/knowledge/workflows.md
curl -fsSL "$BASE_URL/knowledge/decisions.md" -o .claude/knowledge/decisions.md

# Enhanced settings with auto-triggers
if [ -f ".claude/settings.json" ]; then
  echo ""
  echo "⚠️  .claude/settings.json exists."
  echo "Add these hooks manually:"
  echo ""
  cat << 'HOOKS'
  "hooks": {
    "SessionStart": [{"hooks": [{"type": "command", "command": "if [ -f .claude/knowledge/pitfalls.md ]; then echo '📚 Knowledge loaded'; fi"}]}],
    "Stop": [{"hooks": [{"type": "command", "command": "if git diff --stat HEAD~1 2>/dev/null | grep -q 'file'; then echo '🧠 SELF-IMPROVEMENT REVIEW TRIGGERED'; fi"}]}],
    "PostToolUse": [
      {"matcher": "Bash(git commit *)", "hooks": [{"type": "command", "command": "echo '💾 COMMIT DETECTED — Review learnings'"}]},
      {"matcher": "Bash(*test*)", "hooks": [{"type": "command", "command": "echo '🧪 TEST COMPLETE — Document debugging'"}]},
      {"matcher": "Bash(*build*)", "hooks": [{"type": "command", "command": "echo '🔨 BUILD COMPLETE — Save build fixes'"}]}
    ]
  }
HOOKS
else
  curl -fsSL "$BASE_URL/settings-enhanced.json" -o .claude/settings.json
  echo "✅ Created settings.json with auto-trigger hooks"
fi

# Update CLAUDE.md
if [ -f "CLAUDE.md" ]; then
  if ! grep -q "Self-Improvement Protocol" CLAUDE.md; then
    cat >> CLAUDE.md << 'EOF'

## Self-Improvement Protocol

After completing significant tasks, review your work:

1. **Auto-triggers**: Hooks will remind you after git commits, tests, builds, deploys
2. **Quick check**: Any pitfalls? Useful workflow? Important decision?
3. **Save to**: `.claude/knowledge/{pitfalls,workflows,decisions}.md`
4. **Before tasks**: Check `.claude/knowledge/` for relevant past experience
EOF
    echo "✅ Updated CLAUDE.md"
  fi
else
  cat > CLAUDE.md << 'EOF'
# Project

## Self-Improvement Protocol

After completing significant tasks, review your work:

1. **Auto-triggers**: Hooks will remind you after git commits, tests, builds, deploys
2. **Quick check**: Any pitfalls? Useful workflow? Important decision?
3. **Save to**: `.claude/knowledge/{pitfalls,workflows,decisions}.md`
4. **Before tasks**: Check `.claude/knowledge/` for relevant past experience
EOF
  echo "✅ Created CLAUDE.md"
fi

echo ""
echo "🎉 Auto-Trigger Self-Improvement System installed!"
echo ""
echo "Auto-triggers on:"
echo "  • Session start → loads knowledge reminder"
echo "  • After responses → if files changed"
echo "  • git commit → review learnings"
echo "  • test/build → document debugging"
echo ""
echo "Manual trigger: Say 'review what you learned'"
