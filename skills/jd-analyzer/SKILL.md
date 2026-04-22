---
name: jd-analyzer
description: Parse and analyze job descriptions to extract requirements, skills, red flags, and culture indicators
description: |
  Use this skill when analyzing job descriptions for application preparation.
  Automatically invoked when job description text is detected in user queries.
user-invocable: true
argument-hint: [paste-job-description-here]
disable-model-invocation: false
allowed-tools: Read, WebSearch, Write, Edit
model: haiku
effort: medium
---

# JD Analyzer Skill

Extract structured intelligence from job descriptions.

## Task

Analyze the provided job description and extract comprehensive insights.

## Input

{job_description_text} - Paste the full job description here.

## Analysis Workflow

### Step 1: Initial Scan
- Read entire JD for overall impression
- Identify job title and level
- Note company name and location
- Extract salary range if mentioned

### Step 2: Technical Requirements
Extract:
- **Must-Have Skills:** Core requirements for the role
- **Nice-to-Have:** Bonus skills that strengthen application
- **Experience Level:** Years and seniority
- **Education:** Degree requirements
- **Certifications:** Required or preferred

### Step 3: Soft Skills Extraction
Identify mentions of:
- Communication style
- Collaboration requirements
- Leadership expectations
- Autonomy level
- Problem-solving approach

### Step 4: Red Flag Detection
Watch for:
- **Unrealistic Stacks:** "React expert" for 2015 roles
- **Vague Descriptions:** No specific responsibilities
- **Scope Creep:** Multiple unrelated roles combined
- **Unfair Requirements:** Master's + 5 years for entry-level pay
- **Cultural Red Flags:** "Work hard play hard," "We're a family"
- **Unlimited PTO:** Often means no PTO
- **Fast-Paced:** Often means understaffed

### Step 5: Culture Assessment
Positive indicators:
- Mentorship programs
- Professional development budget
- Work-life balance mentions
- Remote flexibility
- Clear growth paths

Negative indicators:
- "Willing to wear multiple hats"
- "High-energy environment"
- Excessive urgency language
- No mention of benefits

### Step 6: Match Analysis
Compare against candidate profile:
- Calculate match percentage
- Identify strongest selling points
- Note gaps to address
- Suggest positioning strategy

## Output Structure

```markdown
# JD Analysis: {Position} at {Company}

## Position Overview
- **Title:**
- **Level:** Junior/Mid/Senior/Staff/Principal
- **Location:**
- **Salary Range:** (if mentioned)
- **Experience Required:**

## Required Skills

### Technical
| Skill | Importance | Your Match |
|-------|-----------|-----------|
| skill1 | Must-Have | ✅/⚠️/❌ |
| skill2 | Nice-to-Have | ✅/⚠️/❌ |

### Soft Skills
- Skill1: Context from JD
- Skill2: Context from JD

## Responsibilities

### Primary
1. Responsibility 1
2. Responsibility 2

### Secondary
1. Secondary 1
2. Secondary 2

## Red Flags

| Severity | Flag | Recommendation |
|----------|------|----------------|
| High/Med/Low | Description | How to handle |

## Culture Assessment

### Positive Indicators
- Indicator 1
- Indicator 2

### Concerns
- Concern 1
- Concern 2

## Match Analysis

**Overall Score:** X/10

**Strong Matches:**
- Match 1: Why it's a match
- Match 2: Why it's a match

**Gaps:**
- Gap 1: How to address
- Gap 2: How to address

**Questions to Ask:**
1. Question 1
2. Question 2

## Application Strategy

**CV Focus Areas:**
- Emphasize: X
- De-emphasize: Y

**Cover Letter Angle:**
- Unique positioning
- Key story to tell

**Interview Prep:**
- Technical areas to study
- Questions to prepare
- Portfolio pieces to showcase

## Verdict

**Recommendation:** Strong Apply / Apply / Maybe / Skip

**Reasoning:**
- Why this verdict
- Confidence level: High/Medium/Low
```

## Special Cases

### Entry-Level with "3-5 Years Experience"
- Often copy-pasted from senior roles
- Apply anyway if you have projects/internships
- Address in cover letter

### "Ninja/Rockstar/Guru"
- Often indicates unclear expectations
- Proceed with caution
- Ask specific questions in interview

### "Competitive Salary"
- Usually below market
- Research thoroughly
- Negotiate based on market data

## Notes

- Be objective — note both positives and negatives
- Flag ambiguity as potential concern
- Prioritize must-have requirements
- Save insights to agent memory for pattern recognition
- Update red flag patterns based on outcomes
