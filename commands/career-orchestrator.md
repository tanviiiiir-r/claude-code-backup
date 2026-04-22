---
description: Orchestrate the complete career workflow — research → CV generation → application tracking
model: sonnet
allowed-tools: Read, Write, Edit, Bash, Agent, Skill, AskUserQuestion
---

# Career Orchestrator Command

Complete career workflow automation that demonstrates the Command → Agent → Skill architecture.

## Overview

This command orchestrates a multi-step workflow using parallel agents and skills.

## Workflow

### Step 1: Capture User Input

Use AskUserQuestion to collect:
- Target job URL or JD text
- Company name
- Preferred salary range
- Application deadline

### Step 2: Parallel Research (Spawn 3 Agents)

Spawn these agents in parallel using the Agent tool:

**Agent 1: Company Research**
- subagent_type: company-researcher-agent
- prompt: Research {company_name}. Extract: culture, tech stack, recent news, values, interview process.
- Wait for completion and capture results.

**Agent 2: JD Analysis**  
- subagent_type: jd-analyzer-agent
- prompt: Analyze this job description: {jd_text}. Extract: required skills, experience level, key responsibilities, red flags.
- Wait for completion and capture results.

**Agent 3: Salary Research**
- subagent_type: salary-research-agent  
- prompt: Research market salary for {role} at {company} in {location}. Extract: salary range, equity, benefits.
- Wait for completion and capture results.

### Step 3: CV Generation

Use the Skill tool:
- skill: cv-generator-skill
- This skill reads research results from context and generates tailored CV.

### Step 4: Cover Letter Generation

Use the Skill tool:
- skill: cover-letter-generator-skill
- Generates personalized cover letter using research.

### Step 5: Application Package Creation

Use the Skill tool:
- skill: application-packager-skill
- Creates complete application package (CV + cover letter + research summary).

### Step 6: Tracker Update

Use the Skill tool:
- skill: tracker-update-skill
- Adds application to tracker with status "Ready to Submit".

### Step 7: Summary Report

Provide user with:
- Company research summary
- JD analysis highlights
- Salary comparison
- Generated files locations
- Tracker entry confirmation
- Next steps (review, customize, submit)

## Critical Requirements

1. **Parallel Execution**: Spawn all 3 research agents simultaneously, not sequentially.
2. **Context Sharing**: Pass research results through context, not files.
3. **Skill Invocation**: Use Skill tool for CV/letter generation, not Agent tool.
4. **User Confirmation**: Show summary before updating tracker.
5. **Error Handling**: If any agent fails, report which one and why.

## Expected Output

- Company research: `.claude/outputs/{company}-research.md`
- JD analysis: `.claude/outputs/{role}-analysis.md`
- Generated CV: `/Users/tanvir/career-ops/output/CV-{company}-{role}.pdf`
- Cover letter: `/Users/tanvir/career-ops/output/Cover-{company}-{role}.pdf`
- Tracker entry: Added to `/Users/tanvir/career-ops/data/applications.md`

## Usage

```
/career-orchestrator
```

Claude will ask for job details and execute the full workflow.

## Notes

This demonstrates the pattern:
- Command (entry point)
- Agents (parallel research with preloaded skills)
- Skills (reusable capabilities)

For a 1-person billion-dollar company, replicate this pattern for each income stream.
