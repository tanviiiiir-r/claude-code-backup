# Salary Research Agent Memory

This is the persistent memory for the salary-research-agent.
The first 200 lines are injected into the agent's context on startup.

## Learned Patterns

### Reliable Data Sources

#### Tier 1 (High Confidence)
1. **Levels.fyi** — Best for tech roles at established companies
   - Real verified data
   - Granular by level/experience
   - Regularly updated

2. **Glassdoor** — Best for company-specific data
   - Self-reported but aggregated
   - Shows trends over time
   - Includes benefits info

3. **LinkedIn Salary** — Best for market ranges
   - Self-reported by professionals
   - Location-specific
   - Experience-level breakdowns

#### Tier 2 (Medium Confidence)
4. **PayScale** — Good for market context
5. **Indeed Salaries** — Volume of data
6. **Company career pages** — Official ranges (EU requirement)

#### Tier 3 (Context Only)
7. **Reddit** — r/cscareerquestionsEU, r/cscareerquestions
8. **Blind** — Anonymous but unverified
9. **Salary surveys** — Annual reports

### Compensation Patterns by Company Type

#### Startups (Seed - Series B)
| Component | Typical Range | Notes |
|-----------|---------------|-------|
| Base | €2.5k-4k/mo | Lower than market |
| Equity | 0.1%-1% | High risk, high potential |
| Benefits | Minimal | Often just basics |
| Total Year 4 | €50k-200k | If equity pays off |

#### Scale-ups (Series C+)
| Component | Typical Range | Notes |
|-----------|---------------|-------|
| Base | €3.5k-6k/mo | Market rate |
| Equity | 0.05%-0.2% | More standardized |
| Benefits | Good | Health, PTO, development |
| Total Year 4 | €80k-150k | More predictable |

#### Corporates (Established)
| Component | Typical Range | Notes |
|-----------|---------------|-------|
| Base | €4k-7k/mo | Higher base |
| Equity/RSUs | Standard | Public company RSUs |
| Benefits | Excellent | Full packages |
| Total Year 4 | €90k-180k | Steady, predictable |

### Regional Variations

#### Finland
- **Market rates:** Generally 10-15% below Sweden
- **Benefits:** 6 weeks PTO standard
- **Taxes:** High but healthcare included
- **Remote:** Fully remote increasingly common

#### Sweden
- **Market rates:** Higher than Finland
- **Benefits:** 6 weeks PTO, strong parental leave
- **Taxes:** Very high but services excellent
- **Remote:** Hybrid most common

#### Germany
- **Market rates:** Similar to Sweden
- **Benefits:** 30 days PTO, strong protections
- **Taxes:** Progressive, complex
- **Remote:** Varies by company

#### Remote EU
- **Market rates:** Usually location-based
- **Trend:** Moving toward global pay
- **Benefits:** Varies widely
- **Taxes:** Complex, location-dependent

## Negotiation Patterns

### What Works
- **Anchoring high:** Start 15-20% above target
- **Total comp focus:** Include equity, benefits
- **Competing offers:** Always mention if available
- **Written follow-up:** Confirm details in writing

### What Doesn't
- **Ultimatums:** Rarely effective
- **Current salary:** Never disclose first
- **Rushing:** Take time to evaluate
- **Ignoring benefits:** Can be 20-30% of total

### Successful Scripts

**Initial offer below range:**
> "Based on my research of market rates for this role in {location}, 
> the range is typically €X-€Y. Given my experience with {specific skill}, 
> I was hoping we could align on €Z."

**Asking for equity:**
> "I'm excited about {company}'s mission and growth trajectory. 
> To align my interests with the company's success, could we discuss 
> equity participation in addition to base?"

**Remote flexibility:**
> "I've demonstrated strong productivity in remote settings. 
> Would full remote or hybrid flexibility be possible?"

## Equity Knowledge

### Stock Options (Startups)
- **Vesting:** 4 years typical
- **Cliff:** 1 year standard
- **Exercise window:** 90 days post-departure (negotiate for longer)
- **Tax treatment:** Complex, varies by country

### RSUs (Public Companies)
- **Vesting:** Quarterly or annual
- **Tax:** At vest (income tax)
- **Liquidity:** Immediate
- **Risk:** Lower than options

### ESPP (Employee Stock Purchase Plan)
- **Discount:** 10-15% typical
- **Lookback:** 6 months
- **Max contribution:** 10-15% of salary
- **Risk:** Minimal with lookback

## Historical Research Data

### Salary Data Points
| Role | Location | Source | Range | Date |
|------|----------|--------|-------|------|
| AI Intern | Helsinki | Levels.fyi | €2.2k-2.8k/mo | 2026-04 |
| Junior AI Engineer | Helsinki | Glassdoor | €3.5k-4.5k/mo | 2026-04 |
| ML Engineer | Stockholm | LinkedIn | €4k-6k/mo | 2026-04 |
| Software Engineer | Helsinki | Glassdoor | €3k-5k/mo | 2026-04 |
| Senior ML Engineer | Stockholm | Levels.fyi | €5k-8k/mo | 2026-04 |

### Company-Specific Data
| Company | Role | Base | Equity | Benefits | Confidence |
|---------|------|------|--------|----------|------------|
| ICEYE | AI Intern | €2.5k-3k | Possible | Standard | Medium |
| Ericsson | Software Dev | €3.5k-4.5k | RSUs | Excellent | High |
| Einride | ML Engineer | €4k-5.5k | Options | Good | Medium |

### Negotiation Outcomes
| Company | Initial | Final | Strategy Used | Result |
|---------|---------|-------|---------------|--------|
| ICEYE | €2.4k | €2.7k | Competing offer, skills match | Accepted |

## Market Trends

### Growing Roles (2026)
- AI/ML Engineers: High demand
- Platform Engineers: Growing
- Data Engineers: Stable
- Full-stack: Competitive
- DevOps: Always in demand

### Declining Demand
- Pure frontend (unless specialized)
- QA without automation
- Traditional sysadmin

### Skill Premiums
- **LLM/GenAI:** +20-40%
- **MLOps:** +15-25%
- **Rust:** +10-20%
- **Kubernetes:** +10-15%

## Red Flags in Compensation

- **"Competitive salary":** Usually below market
- **No range posted:** May be low (EU requires disclosure)
- **"Unlimited PTO":** Often means less taken
- **Complex equity:** May be worthless
- **"We'll discuss later":** Lack of transparency

## Green Flags in Compensation

- **Clear salary bands:** Transparency
- **Equity explained:** Vesting, strike price, etc.
- **Benefits detailed:** Health, retirement, PTO
- **Annual reviews:** Growth path
- **Signing bonus:** Shows investment

## Quick Reference Formulas

### Total Compensation
```
Total Comp = Base + (Equity × Multiplier) + Benefits Value

Benefits Value ≈ 20-30% of base (health, PTO, retirement)
Equity Multiplier = 0 (startup early) to 1 (public company)
```

### Contractor Rate
```
Hourly Rate = Annual Salary ÷ 1000

Example: €60k salary → €60/hour contractor
```

### Equity Value Estimate
```
Option Value = (Estimated Exit Price - Strike Price) × Shares × Probability

Probability: 10% seed, 25% Series A, 50% Series B+, 90% public
```

## Resources & Shortcuts

### Quick Research (5 minutes)
1. Levels.fyi for market range
2. Glassdoor for company-specific
3. LinkedIn for peer comparison
4. Company website for benefits

### Deep Research (20 minutes)
1. All quick sources
2. Reddit for recent data
3. Blind for unfiltered info
4. Cost of living calculators
5. Tax calculators

### Negotiation Prep
1. Know your walk-away number
2. Research 3 comparable roles
3. Prepare 3 leverage points
4. Script responses to low offers
5. Plan follow-up timeline

---

*Last updated: 2026-04-22*
*Agent: salary-research-agent*
