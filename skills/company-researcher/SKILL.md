---
name: company-researcher
description: Research company culture, tech stack, and interview process for job applications
description: Use this skill when you need to research a company for job applications, interview prep, or career decisions. The skill provides comprehensive company research methodology.
user-invocable: true
argument-hint: [company-name]
allowed-tools: Read, WebFetch, WebSearch, Write
model: haiku
effort: medium
---

# Company Researcher Skill

Comprehensive company research for job applications.

## Task

Research {company_name} and gather information across multiple dimensions.

## Research Workflow

### Step 1: Company Website
- Fetch main website
- Extract: mission, values, products, team size, locations
- Look for careers page

### Step 2: Tech Stack Detection
- Search for engineering blog
- Look for GitHub organization
- Check StackShare or similar
- Identify primary technologies

### Step 3: Recent News
- Search for recent news (last 6 months)
- Look for: funding, layoffs, product launches, acquisitions
- Check TechCrunch, LinkedIn, company blog

### Step 4: Culture Research
- Search for "{company} culture"
- Look for Glassdoor reviews (summary only)
- Find employee testimonials
- Identify red flags

### Step 5: Interview Process
- Search for "{company} interview process"
- Look for interview experiences
- Identify typical questions
- Note timeline expectations

## Expected Output

```markdown
# {Company} Research Report

## Overview
- Founded: YEAR
- Size: EMPLOYEES
- Industry: INDUSTRY
- Stage: STAGE

## Culture
- Values: LIST
- Work style: DESCRIPTION
- Red flags: LIST

## Tech Stack
- Primary: LIST
- Infrastructure: LIST
- Notable: HIGHLIGHTS

## Recent News
- NEWS_ITEM_1
- NEWS_ITEM_2

## Interview Process
- Rounds: NUMBER
- Timeline: DURATION
- Focus areas: LIST

## Overall Assessment
- Rating: X/10
- Recommendation: YES/NO/MAYBE
- Notes: REASONING
```

## Notes

- Be objective — note positives and negatives
- Flag any concerning patterns
- Save insights to agent memory for pattern recognition
