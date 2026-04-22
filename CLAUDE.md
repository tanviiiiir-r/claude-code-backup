# CLAUDE.md

This file provides guidance to Claude Code when working with code in this repository.

## Repository Overview

This is a **Claude Code configuration backup** for a 1-person company with multiple income streams. It demonstrates advanced patterns for:

- **Orchestration workflows** — Command → Agent → Skill architecture
- **Agent teams** — Multiple agents working in parallel
- **Persistent memory** — Agents that learn across sessions
- **Event-driven automation** — Hooks and scheduled tasks
- **Multi-income stream management** — Career, content, product, consulting

## Key Components

### Orchestration Pattern

This repository implements the **Command → Agent → Skill** workflow pattern:

```
User triggers /command
    ↓
Command orchestrates workflow
    ↓
Command spawns Agent(s) in parallel
    ↓
Agent uses preloaded Skill
    ↓
Command invokes Skill for output
```

**Example:** `/career-orchestrator`
- Spawns 3 agents: company-researcher, jd-analyzer, salary-researcher
- Each agent has preloaded skills
- Results flow back to command
- Command invokes cv-generator skill
- Final output: application package

### Agent Memory System

Agents have persistent memory across sessions:
- `memory: user` — Personal knowledge across projects
- `memory: project` — Team-shared knowledge
- `memory: local` — Project-specific personal knowledge

**Memory files:** `.claude/agent-memory/{agent-name}/MEMORY.md`

### Income Stream Architecture

Each income stream is an orchestration workflow:

| Command | Agents | Purpose |
|---------|--------|---------|
| `/career-orchestrator` | 3 agents | Job search automation |
| `/content-ops` | 2 agents | Content creation |
| `/launch-product` | 4 agents | SaaS product launch |
| `/consulting-ops` | 2 agents | Client services |

## Critical Patterns

### Subagent Orchestration

Use Agent tool to spawn subagents. NEVER use bash commands to invoke agents.

```yaml
Agent(
  subagent_type="agent-name",
  description="What this agent should do",
  prompt="Detailed instructions",
  model="haiku"
)
```

### Parallel Execution

Spawn multiple agents in parallel when tasks are independent:

```python
# Launch 3 agents simultaneously
agent_1 = Agent(...)  # Research
agent_2 = Agent(...)  # Analysis
agent_3 = Agent(...)  # Writing

# Wait for all to complete
results = [agent_1, agent_2, agent_3]
```

### Skill Invocation

Use Skill tool for reusable capabilities:

```yaml
Skill(skill="skill-name", args="arguments")
```

Skills are for reusable procedures. Agents are for autonomous multi-step tasks.

### Memory Management

Agents with `memory:` frontmatter automatically:
1. Read first 200 lines of MEMORY.md on startup
2. Can Read/Write/Edit their memory directory
3. Build knowledge over time

## Configuration Hierarchy

Settings load in this order (later overrides earlier):

1. `~/.claude/settings.json` — Global personal defaults
2. `.claude/settings.json` — Project settings (this repo)
3. `.claude/settings.local.json` — Personal project settings

## Workflow Best Practices

From experience with this repository:

- **Use plan mode** for complex orchestration workflows
- **Keep agents focused** — Single responsibility per agent
- **Preload skills** — Agents should have domain knowledge at startup
- **Parallel execution** — Spawn independent agents simultaneously
- **Memory persistence** — Let agents learn from past work
- **User gating** — Show summary before committing changes
- **Error handling** — Report which agent failed and why

## Git Commit Rules

When committing changes, **create separate commits per file**. Do NOT bundle multiple file changes into a single commit.

For orchestration workflows:
- Commit 1: Command file
- Commit 2: Agent definition(s)
- Commit 3: Skill definition(s)
- Commit 4: Documentation updates

## Answering Questions

When asked about Claude Code patterns in this repository:

1. **Search this repo first** (`.claude/`, `commands/`, `agents/`, `skills/`)
2. Reference the orchestration examples
3. Point to specific file patterns
4. Explain the Command → Agent → Skill architecture

## Documentation

- `commands/` — Workflow entry points
- `agents/` — Autonomous actor definitions
- `skills/` — Reusable capability definitions
- `agent-memory/` — Persistent agent knowledge
- `hooks/` — Event-driven automation

## Income Stream Multiplication

To add a new income stream:

1. **Create command** — Entry point for the workflow
2. **Create agents** — 2-4 specialized agents
3. **Create skills** — Domain knowledge for agents
4. **Add memory** — Persistent learning for agents
5. **Test parallel execution** — Ensure agents can run simultaneously
6. **Document pattern** — Add to README

**Template:** Copy `/career-orchestrator` pattern.

## Sources

- [Claude Code Docs](https://code.claude.com/docs)
- [Subagents Guide](https://code.claude.com/docs/en/sub-agents)
- [Skills Guide](https://code.claude.com/docs/en/skills)
- [Memory Guide](https://code.claude.com/docs/en/memory)

---

*This CLAUDE.md follows best practices from claude-code-best-practice repository.*
