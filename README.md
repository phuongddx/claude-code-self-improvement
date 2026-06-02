# Claude Code Self-Improvement System 🧠

Adds Hermes-style self-improvement review to Claude Code. After completing tasks, Claude automatically reflects on learnings and saves reusable knowledge.

## Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/phuongddx/claude-code-self-improvement/main/install.sh | bash
```

## What Gets Installed

```
your-project/
├── .claude/
│   ├── skills/
│   │   └── self-improvement-review.md    # Auto-triggered skill
│   ├── knowledge/
│   │   ├── pitfalls.md                   # Lessons from failures
│   │   ├── workflows.md                  # Proven procedures
│   │   └── decisions.md                  # Architecture decisions
│   └── settings.json                     # Stop hook
└── CLAUDE.md                             # Updated with review triggers
```

## How It Works

1. **Auto-trigger**: Claude reviews after building features, fixing bugs, debugging issues
2. **Knowledge base**: Saves learnings to `.claude/knowledge/` files
3. **Avoid repeats**: Check knowledge files before starting complex tasks

## Usage

- **Auto**: Triggers after significant tasks
- **Manual**: Say "review what you learned"
- **Check**: Look in `.claude/knowledge/` for past learnings

## Knowledge Files

| File | Purpose |
|------|---------|
| `pitfalls.md` | Debugging discoveries, common mistakes |
| `workflows.md` | Proven step-by-step procedures |
| `decisions.md` | Architecture choices and rationale |

## Example Entry

```markdown
## [2026-06-02] HealthKit Simulator Limitations

**Context:** Testing HealthKit integration on iOS Simulator
**Learning:** HealthKit data is NOT available on Simulator
**Application:** Always remind user when testing HealthKit on Simulator
**Example:** `HKHealthStore.isHealthDataAvailable()` returns false on Simulator
```

## License

MIT
