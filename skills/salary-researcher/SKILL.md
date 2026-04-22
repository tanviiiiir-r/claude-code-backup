---
name: salary-researcher
description: Research market compensation, salary benchmarks, and benefits packages for roles and companies
description: |
  Use this skill when researching salary data for job offers, negotiations, 
  or market positioning. Provides comprehensive compensation analysis.
user-invocable: true
argument-hint: [role] at [company] in [location]
disable-model-invocation: false
allowed-tools: WebSearch, WebFetch, Read, Write
model: haiku
effort: medium
---

# Salary Researcher Skill

Gather market intelligence on compensation and benefits.

## Task

Research salary data for the specified role, company, and location.

## Input Parameters

- **Role:** Job title (e.g., "AI Engineer", "Software Developer")
- **Company:** Company name (optional, for company-specific data)
- **Location:** City/Country/Remote (e.g., "Finland", "Remote EU")
- **Experience:** Years of experience (optional)

## Research Sources

### Tier 1 (Most Reliable)
1. **Levels.fyi** - Tech industry compensation database
   - URL: https://www.levels.fyi
   - Best for: Tech roles, major companies
   
2. **Glassdoor** - Company-specific salaries
   - URL: https://www.glassdoor.com/Salaries
   - Best for: Company culture + compensation

3. **LinkedIn Salary** - Self-reported data
   - Requires LinkedIn account
   - Best for: Professional roles

### Tier 2 (Secondary)
4. **PayScale** - General market data
   - URL: https://www.payscale.com
   - Best for: Market ranges

5. **Salary.com** - US-focused
   - URL: https://www.salary.com
   - Best for: US market

6. **Indeed Salaries** - Job board data
   - URL: https://www.indeed.com/career/salaries
   - Best for: Volume of data

### Tier 3 (Context)
7. **Company Career Pages** - Posted ranges
   - Required in EU (pay transparency laws)
   - Best for: Official ranges

8. **Reddit** - r/cscareerquestions, r/fatFIRE
   - Search: "[Company] salary [location]"
   - Best for: Recent data points

## Research Methodology

### Step 1: Market Range
Search for:
- "{role} salary {location} 2026"
- "{role} compensation {location}"
- Use Levels.fyi for tech roles

Extract:
- P10 (Entry level)
- P25 (Junior)
- P50 (Median)
- P75 (Senior)
- P90 (Expert)

### Step 2: Company-Specific Data
Search for:
- "{company} {role} salary Glassdoor"
- "{company} levels.fyi"
- "{company} compensation"

Extract:
- Reported ranges
- Confidence level
- Sample size

### Step 3: Benefits Research
Search for:
- "{company} benefits"
- "{company} employee reviews"
- "{location} standard benefits"

Extract:
- Health insurance
- Retirement plans
- PTO policy
- Stock options/RSUs
- Remote work policy
- Professional development

### Step 4: Market Context
Research:
- Industry demand for role
- Supply/demand dynamics
- Cost of living in location
- Currency adjustments

## Output Structure

```markdown
# Salary Research: {Role} in {Location}

## Executive Summary
- **Market Range:** €X - €Y
- **Company-Specific:** €A - €B (if available)
- **Confidence:** Low/Medium/High
- **Recommendation:** Strong/Fair/Negotiate

## Base Salary Analysis

### Market Benchmarks ({Location})
| Percentile | Annual Salary |
|-----------|---------------|
| P10 (Entry) | €X |
| P25 (Junior) | €X |
| P50 (Median) | €X |
| P75 (Senior) | €X |
| P90 (Expert) | €X |

### Company-Specific Data
| Source | Range | Sample Size | Confidence |
|--------|-------|-------------|-----------|
| Levels.fyi | €X-€Y | N | High |
| Glassdoor | €X-€Y | N | Medium |
| LinkedIn | €X-€Y | N | Medium |

### Location Adjustments
- **Cost of Living:** Index vs reference
- **Currency:** Exchange rate considerations
- **Tax:** Net vs gross calculations

## Equity & Stock Compensation

### Stock Options
- **Type:** ISOs / NSOs
- **Vesting:** 4-year typical
- **Cliff:** 1-year typical
- **Estimated Value:** €X - €Y

### RSUs
- **Vesting Schedule:**
- **Tax Treatment:**
- **Estimated Value:** €X - €Y

### ESPP
- **Discount:**
- **Lookback:**
- **Max Contribution:**

## Benefits Package

### Core Benefits
| Benefit | Company Offer | Market Standard | Evaluation |
|---------|---------------|-----------------|------------|
| Health Insurance | Details | Standard | ✅/⚠️/❌ |
| Retirement Match | X% | Y% | ✅/⚠️/❌ |
| PTO Days | X days | Y days | ✅/⚠️/❌ |
| Remote Work | Policy | Standard | ✅/⚠️/❌ |

### Additional Perks
- Professional development: €X budget
- Home office stipend: €X
- Wellness programs: Description
- Meal allowances: €X/month
- Transportation: €X/month

## Total Compensation

### Breakdown
| Component | Amount | % of Total |
|-----------|--------|------------|
| Base Salary | €X | X% |
| Equity (4yr) | €X | X% |
| Benefits | €X | X% |
| **Total** | **€X** | **100%** |

### Year-by-Year (if equity)
| Year | Base | Equity | Bonus | Total |
|------|------|--------|-------|-------|
| 1 | €X | €Y | €Z | €X+Y+Z |
| 2 | €X | €Y | €Z | €X+Y+Z |
| 3 | €X | €Y | €Z | €X+Y+Z |
| 4 | €X | €Y | €Z | €X+Y+Z |

## Market Context

### Demand for Role
- **Trend:** Growing/Stable/Declining
- **Competition:** Low/Medium/High
- **Time to Fill:** Average days

### Supply/Demand
- **Available Talent:** Scarce/Moderate/Abundant
- **Company Hiring:** Aggressive/Selective/Frozen

### Industry Trends
- Recent changes affecting role
- Future outlook
- Skill premiums

## Negotiation Strategy

### Your Position
- **Current Salary:** €X
- **Market Value:** €Y
- **Target Range:** €Z - €W

### Leverage Points
- Unique skills: List
- Experience: Differentiator
- Competing offers: Yes/No
- Current role: Critical/Nice-to-have

### Negotiation Priorities (Rank 1-5)
1. Base salary: Priority X
2. Equity: Priority X
3. Sign-on bonus: Priority X
4. Benefits: Priority X
5. Title: Priority X

### Scripts

**If offer is below target:**
"Based on my research, the market range for this role is €X-€Y. 
Given my experience in [specific skill], I was hoping for €Z."

**If asking for equity:**
"I'm excited about the company's mission. To align my interests 
with the company's success, could we discuss equity participation?"

**If asking for remote:**
"Given my demonstrated productivity in remote settings, would 
full remote or hybrid flexibility be possible?"

## Verdict & Recommendation

**Overall Assessment:**
- **Compensation Rating:** Below Market / Market / Above Market
- **Confidence Level:** Low / Medium / High
- **Recommendation:** Accept / Negotiate / Decline

**If Negotiating:**
- Ask for: Specific numbers
- Minimum acceptable: €X
- Walk-away point: €Y

**Next Steps:**
1. Step 1
2. Step 2
3. Step 3

## Data Sources

1. [Levels.fyi - {Company}](URL)
2. [Glassdoor - {Company}](URL)
3. [LinkedIn Salary](URL)
4. [PayScale - {Role}](URL)

## Notes & Caveats

- Data accuracy depends on sample size
- Self-reported data may be inflated
- Company stage affects equity value
- Location matters significantly
- Always verify with multiple sources

---

*Research completed: {date}*
*Next update recommended: {date + 3 months}*
```

## Special Cases

### Startup vs Established
- **Startup:** Lower base, higher equity
- **Established:** Higher base, standard equity
- **Adjust total comp expectations accordingly**

### Remote vs On-site
- **Remote:** Location-agnostic pay vs location-based
- **On-site:** Local market rates
- **Hybrid:** Often same as on-site

### Contractor vs Employee
- **Contractor:** Higher hourly, no benefits
- **Employee:** Lower base, full benefits
- **Calculate total compensation including benefits**

## Notes

- Always use multiple sources
- Note confidence level in data
- Consider total compensation, not just base
- Update agent memory with findings
- Track negotiation outcomes for learning
