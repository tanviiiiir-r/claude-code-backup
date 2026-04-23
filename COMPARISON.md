# Comparison: Current Setup vs Backup Repo

## Current Working Setup (~/.claude)

**Has 22 directories/files including:**
- ✅ agents/ (4 agents with Kimi+Qwen wiring)
- ✅ commands/ (10 commands)
- ✅ skills/ (5 skills)
- ✅ hooks/ (with hooks.json)
- ✅ cursor-hooks/ (5 shell scripts)
- ✅ plugins/ (27 plugins including cache/)
- ✅ rules/ (project.md, python.md)
- ✅ mcp.json (configured)
- ✅ model-router.json (Kimi+Qwen routing)
- ✅ settings.json + settings.local.json (proper config)
- ✅ Generated files: cache/, history.jsonl, logs/, sessions/, telemetry/

**Total: ~22 items | Status: WORKING**

---

## Backup Repo (~/claude-code-backup/.claude)

**Has 11 directories/files:**
- ✅ agents/ (4 agents)
- ✅ commands/ (10 commands)
- ✅ skills/ (5 skills)
- ✅ hooks/ (hooks.json only)
- ❌ cursor-hooks/ (MISSING - 5 shell scripts)
- ⚠️ plugins/ (partial, no cache/)
- ✅ rules/
- ✅ mcp.json
- ✅ model-router.json
- ⚠️ settings.json (outdated)
- ⚠️ settings.local.json (outdated)

**Total: 11 items | Status: INCOMPLETE**

---

## What's Missing in Backup

### Critical (Must Have)
1. ❌ cursor-hooks/ directory (5 shell scripts)
2. ⚠️ hooks.json (needs full version)
3. ⚠️ settings.json (needs autoUpdate fix)
4. ⚠️ settings.local.json (needs Kimi+Qwen wiring)

### Optional (Runtime Generated)
- cache/ (can be rebuilt)
- history.jsonl (session history)
- logs/ (can be recreated)
- sessions/ (session data)
- telemetry/ (usage data)

---

## Verdict

**Current Setup (~/.claude) has MORE potential.**

**Why:**
- Working Kimi+Qwen model routing
- Full hooks system with cursor-hooks
- 27 plugins including cache
- All configurations properly set

**Backup repo is INCOMPLETE** - missing cursor-hooks and has outdated configs.

---

## Action Required

**Update backup repo to match working setup:**

1. Add cursor-hooks/ directory with 5 scripts
2. Update hooks.json with full configuration
3. Update settings.json + settings.local.json
4. Keep plugins/ but exclude cache/ from git

This will make backup = working setup.
