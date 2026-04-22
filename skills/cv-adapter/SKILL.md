---
name: cv-adapter
description: Tailor CV for specific job descriptions by matching keywords and highlighting relevant experience
description: |
  Use this skill when customizing a CV for a specific job application.
  Matches CV content to JD requirements.
user-invocable: true
argument-hint: [job-description] [source-cv-path]
disable-model-invocation: false
allowed-tools: Read, Write, Edit, Grep
model: haiku
effort: medium
---

# CV Adapter Skill

Tailor CV to match specific job description requirements.

## Task

Analyze job description and adapt CV to maximize match score.

## Input Parameters

- **job_description:** Full JD text or path to JD file
- **source_cv:** Path to base CV (default: `/Users/tanvir/career-ops/cv.md`)
- **output_path:** Where to save tailored CV
- **company_name:** For file naming
- **role_title:** For customization

## Adaptation Workflow

### Step 1: JD Analysis
Extract from job description:
- **Required Skills:** Must-have technical skills
- **Preferred Skills:** Nice-to-have additions
- **Experience Level:** Years and seniority
- **Key Responsibilities:** What you'll do
- **Company Keywords:** Culture and values
- **Tools/Technologies:** Specific platforms

### Step 2: CV Gap Analysis
Compare CV against JD:
- ✅ Direct matches (keep prominent)
- ⚠️ Partial matches (strengthen wording)
- ❌ Missing (address or acknowledge)

### Step 3: Keyword Optimization

#### Exact Match Keywords
Identify exact terms from JD:
- Programming languages
- Frameworks
- Tools
- Methodologies
- Domain terms

#### Keyword Placement
Priority locations:
1. Professional summary
2. Skills section
3. Experience bullets (first word)
4. Project descriptions

### Step 4: Experience Reordering

Reorder based on relevance:
```
Before: Chronological (oldest first)
After: Relevance-based (most relevant first)
```

### Step 5: Achievement Reframing

Rewrite bullets to match JD language:

**Before:**
"Built web application using Python and Flask"

**After (for ML role):**
"Developed ML-powered web application using Python, PyTorch, and Flask to process 10k+ predictions daily"

**After (for backend role):**
"Architected scalable REST API using Python, Flask, and Docker, handling 100k+ requests/day"

### Step 6: Summary Customization

Tailor professional summary:
- Include target role title
- Mention years of relevant experience
- Highlight top 3 matching skills
- Express alignment with company mission

## Match Scoring

### Calculate Match Score
```
Match Score = (Direct Matches / Total Requirements) × 100

90-100%: Strong match, emphasize in cover letter
70-89%: Good match, address gaps proactively
50-69%: Partial match, focus on transferable skills
<50%: Consider if worth applying
```

### ATS Keyword Match
- Count occurrences of JD keywords in CV
- Ensure >80% of required keywords present
- Use variations (Python, python, Python 3.x)

## Tailoring Strategies

### When Strong Match (80%+)
- Lead with relevant experience
- Quantify relevant achievements
- Emphasize exact skill matches
- Show progression in relevant areas

### When Partial Match (50-79%)
- Highlight transferable skills
- Show learning agility
- Emphasize project relevance
- Address gaps in cover letter

### When Weak Match (<50%)
- Focus on adjacent skills
- Demonstrate passion for domain
- Include relevant projects
- Consider informational interview first

## Output Structure

```markdown
# CV Adaptation Report

## Target Position
- **Role:** AI Engineer
- **Company:** Example Corp
- **Match Score:** 87%

## Keyword Mapping

### Direct Matches (12/15)
| Keyword | JD Frequency | CV Location |
|---------|-------------|-------------|
| Python | 5x | Skills, Experience |
| PyTorch | 3x | Skills, Projects |
| MLOps | 2x | Skills |

### Added Keywords (3)
- Kubernetes (from project experience)
- CI/CD (from DevOps exposure)
- Docker (implied from experience)

### Missing Keywords (3)
- AWS SageMaker (no direct experience)
- Recommendation: Mention AWS in general skills

## Changes Made

### Experience Section
- Reordered to highlight ML projects first
- Reframed 3 bullets with ML terminology
- Added metrics to 2 achievements

### Skills Section
- Promoted PyTorch to top tier
- Added MLOps category
- Included Kubernetes under DevOps

### Summary
- Rewrote to mention "AI Engineer" title
- Emphasized 2+ years ML experience
- Added company-specific language

## Tailored CV Location
`/Users/tanvir/career-ops/output/cv-example-corp-ai-engineer.md`

## Recommendations

### Strong Points to Emphasize
- ML project with measurable results
- Python proficiency (matches JD)
- Open source contributions

### Gaps to Address
- No direct SageMaker experience → Mention AWS general
- No production MLOps → Emphasize learning agility

### Cover Letter Angle
"While my experience with SageMaker is limited, I've deployed 
similar ML pipelines using open-source tools on AWS EC2..."
```

## Automation Integration

### Pre-Submit Hook
```json
{
  "pattern": ".*apply.*",
  "command": "claude skill cv-adapter '{{input}}'"
}
```

### Parallel with JD Analysis
```python
# Spawn simultaneously
jd_analysis = Agent(subagent_type="jd-analyzer", ...)
cv_adaptation = Agent(subagent_type="cv-adapter", ...)
```

## Quality Checklist

Before submitting tailored CV:
- [ ] >80% of required keywords present
- [ ] Experience reordered for relevance
- [ ] Summary customized for role
- [ ] No generic "objective" statement
- [ ] File named with company-role
- [ ] PDF generated and reviewed
- [ ] Gap analysis documented

## Template: Tailored CV File Name
```
cv-{company}-{role}.md
cv-{company}-{role}.pdf

Examples:
cv-iceye-ai-intern.md
cv-ericsson-software-dev-intern.md
```

## Memory Updates

After tailoring:
- Track match scores by company type
- Note which adaptations get responses
- Refine strategies based on outcomes
- Build library of successful reframes

---

*Last updated: 2026-04-22*
