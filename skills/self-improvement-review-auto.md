# Self-Improvement Review (Auto-Trigger Version)

This skill automatically triggers after significant tasks.

## Auto-Trigger Conditions

The hooks will prompt you to review when:
- **Stop hook**: After each response if files were changed
- **git commit**: After committing code
- **test/build**: After running tests or builds
- **deploy**: After deployment commands

## When Hook Fires

You'll see:
```
════════════════════════════════════════════
🧠 SELF-IMPROVEMENT REVIEW
════════════════════════════════════════════
```

## What To Do

### Quick Assessment (< 30 seconds)
1. Did anything unexpected happen? → pitfalls.md
2. Did I find a better way to do something? → workflows.md  
3. Did I make an important trade-off? → decisions.md

If nothing notable → skip and continue.

### Save Entry Format
```markdown
## [YYYY-MM-DD] Short Title

**Context:** What were you doing?
**Learning:** What did you discover?
**Impact:** How much time/frustration does this prevent?
**Example:** Code/command if applicable
```

## Session Start

On session start, you'll see:
```
📚 Knowledge loaded: Check .claude/knowledge/ for past learnings before starting.
```

This reminds you to check existing knowledge before starting work.

## Skip Rules

Don't save if:
- Task took < 5 minutes with no issues
- Knowledge is too specific to be reusable
- Similar entry already exists
- It's general programming knowledge (not project-specific)

## Integration with Git

The hooks detect:
- `git commit` → reminds to review before/after commit
- `git push` → final check before code goes remote

## Tips

1. **Be concise** — 3-5 lines per entry
2. **Date entries** — helps track relevance
3. **Search first** — avoid duplicates
4. **Prune quarterly** — remove outdated entries
