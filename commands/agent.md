---
name: agent
---

Launch a specialized Claude agent for specific tasks.

## Usage

- `/agent` - List all available agents
- `/agent <agent-name>` - Launch a specific agent

## Available Agents

### Agent SDK Development
- `agent-sdk-verifier-py` - Validate Python Agent SDK applications
- `agent-sdk-verifier-ts` - Validate TypeScript Agent SDK applications

### Feature Development
- `code-explorer` - Explore and understand codebase structure
- `code-architect` - Design architecture for features
- `code-reviewer` - Review code quality

### Plugin Development
- `agent-creator` - Create new Claude agents
- `plugin-validator` - Validate plugin structure
- `skill-reviewer` - Review agent skills

### PR Review
- `comment-analyzer` - Analyze PR comments
- `pr-test-analyzer` - Analyze PR tests
- `silent-failure-hunter` - Find silent failures in code
- `type-design-analyzer` - Analyze type design
- `code-simplifier` - Simplify code

### Hook Management
- `conversation-analyzer` - Analyze conversations for problematic behaviors

## How to Use

Simply run `/agent <name>` to launch an agent. For example:
- `/agent code-explorer` - Start exploring your codebase
- `/agent agent-sdk-verifier-ts` - Verify a TypeScript Agent SDK app
- `/agent silent-failure-hunter` - Find hidden bugs

## Arguments

- `name` (optional) - The name of the agent to launch. If not provided, lists all available agents.
