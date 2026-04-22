---
name: application-tracker
description: Track job applications, interviews, and outcomes with status updates and follow-up reminders
description: |
  Use this skill when logging applications or checking application status.
  Maintains pipeline visibility and follow-up schedule.
user-invocable: true
argument-hint: [action] [company] [role] [status]
disable-model-invocation: false
allowed-tools: Read, Write, Edit, Bash
model: haiku
effort: low
---

# Application Tracker Skill

Track job search pipeline and application outcomes.

## Task

Log applications, update statuses, and manage follow-ups.

## Input Parameters

- **action:** add, update, list, stats, follow-up
- **company:** Company name
- **role:** Job title
- **status:** Applied, Phone Screen, Assessment, Interview, Offer, Rejected, Ghosted
- **date:** Application date (default: today)
- **notes:** Additional information

## Actions

### Add New Application
```yaml
action: add
company: ICEYE
role: AI Intern
status: Applied
date: 2026-04-22
location: Helsinki
salary_range: €2.5k-3k/mo
source: LinkedIn
referral: false
notes: Excited about SAR satellite technology
```

### Update Status
```yaml
action: update
company: ICEYE
status: Assessment
notes: Completed take-home on on-call handover
update_date: 2026-04-25
```

### List Applications
```yaml
action: list
filter: all  # Options: all, active, pending, rejected
sort: date_desc  # Options: date_desc, company, status
```

### View Stats
```yaml
action: stats
period: 2026-04  # Month or "all"
```

### Check Follow-ups
```yaml
action: follow-up
threshold_days: 7  # Applications older than this
```

## Tracker Schema

### Application Record
```yaml
applications:
  - id: 001
    company: "ICEYE"
    role: "AI Intern"
    status: "Assessment Complete"
    applied_date: "2026-04-22"
    last_update: "2026-04-25"
    location: "Helsinki, Finland"
    salary_range: "€2.5k-3k/month"
    source: "LinkedIn"
    referral: false
    assessment_completed: true
    assessment_date: "2026-04-25"
    assessment_notes: "On-call handover tool - Python, FastAPI, Redis"
    next_steps: "Wait for interview invitation"
    priority: "high"
    notes: |
      - Space tech company
      - SAR satellite imaging
      - Profitable and growing
      - Strong match with ML background

  - id: 002
    company: "Ericsson"
    role: "Software Development Intern"
    status: "Interview Complete"
    applied_date: "2026-04-15"
    last_update: "2026-04-20"
    location: "Stockholm, Sweden"
    salary_range: "€3.5k-4.5k/month"
    source: "Career fair"
    referral: false
    interview_date: "2026-04-20"
    interview_notes: "Cloud focus, Kubernetes questions"
    next_steps: "Waiting for decision"
    priority: "medium"
```

## Status Pipeline

```
┌──────────┐     ┌──────────────┐     ┌─────────────┐
│  Applied │────>│ Phone Screen │────>│  Assessment │
└──────────┘     └──────────────┘     └─────────────┘
                                               │
                                               ▼
┌──────────┐     ┌──────────────┐     ┌─────────────┐
│ Rejected │<────│    Offer     │<────│   Interview │
└──────────┘     └──────────────┘     └─────────────┘
   ▲                                              │
   └──────────────────────────────────────────────┘
                    Ghosted
```

### Status Definitions
- **Applied:** CV submitted, waiting for response
- **Phone Screen:** Initial recruiter call scheduled/completed
- **Assessment:** Take-home or technical assessment
- **Interview:** Technical/behavioral interviews
- **Offer:** Offer received, negotiating
- **Rejected:** Explicitly declined
- **Ghosted:** No response after 30+ days
- **Withdrawn:** Pulled application

## Analytics

### Conversion Rates
```
Applied → Phone Screen:     X%
Phone Screen → Assessment:  Y%
Assessment → Interview:     Z%
Interview → Offer:          W%
Overall Applied → Offer:    V%
```

### Pipeline Health
- Active applications: N
- Awaiting response (>7 days): N
- Interviews this week: N
- Offers pending: N

### Source Effectiveness
| Source | Applied | Responses | Response Rate |
|--------|---------|-----------|---------------|
| LinkedIn | 15 | 5 | 33% |
| Referral | 3 | 2 | 67% |
| Direct | 8 | 2 | 25% |

### Company Type Performance
| Type | Applied | Interviews | Conversion |
|------|---------|------------|------------|
| Startups | 10 | 4 | 40% |
| Scale-ups | 8 | 3 | 37% |
| Corporates | 5 | 1 | 20% |

## Follow-up Automation

### Schedule
```
Day 0: Application submitted
Day 3: Confirmation email received?
Day 7: Follow-up if no response
Day 14: Second follow-up
Day 21: Consider application ghosted
Day 30: Archive if no response
```

### Follow-up Templates

**Week 1 Follow-up:**
```
Subject: Application Follow-up - {Role} at {Company}

Hi {Recruiter Name},

I hope you're doing well. I wanted to follow up on my application 
for the {Role} position I submitted on {Date}.

I'm very excited about {Company}'s mission and would love the 
opportunity to discuss how my experience with {relevant skill} 
could contribute to your team.

Is there any additional information I can provide?

Best regards,
{Your Name}
```

**Post-Interview Thank You:**
```
Subject: Thank you - {Role} Interview

Hi {Interviewer Name},

Thank you for taking the time to speak with me today about the 
{Role} position at {Company}.

I especially enjoyed learning about {specific detail from interview}.

I'm excited about the possibility of joining your team and 
contributing to {company goal}.

Please don't hesitate to reach out if you need any additional 
information.

Best regards,
{Your Name}
```

## Output Formats

### Summary View
```
╔════════════════════════════════════════════════════════════╗
║           APPLICATION TRACKER - April 2026               ║
╠════════════════════════════════════════════════════════════╣
║                                                            ║
║  ACTIVE PIPELINE                                           ║
║  ─────────────────                                         ║
║  ICEYE          AI Intern        Assessment Complete   ⏳ ║
║  Ericsson       SW Dev Intern    Interview Complete    ⏳ ║
║                                                            ║
║  STATS                                                     ║
║  ─────────────────                                         ║
║  Applied: 2    |    Interviews: 2    |    Offers: 0      ║
║  Response Rate: 100%                                       ║
║                                                            ║
║  NEEDS FOLLOW-UP                                           ║
║  ─────────────────                                         ║
║  None - all within 7 days                                  ║
║                                                            ║
╚════════════════════════════════════════════════════════════╝
```

### Detailed View
```markdown
# Application Tracker

## Active Applications (2)

### ICEYE - AI Intern
- **Status:** Assessment Complete ⏳
- **Applied:** 2026-04-22
- **Last Update:** 2026-04-25
- **Next Step:** Wait for interview invitation
- **Priority:** HIGH
- **Notes:** Take-home completed (on-call handover tool)

### Ericsson - Software Development Intern
- **Status:** Interview Complete ⏳
- **Applied:** 2026-04-15
- **Last Update:** 2026-04-20
- **Next Step:** Waiting for decision
- **Priority:** MEDIUM
- **Notes:** Cloud focus, technical interview completed

## Completed This Month
- **Applied:** 2
- **Assessments:** 1
- **Interviews:** 1
- **Offers:** 0 (pending)

## Response Rate
- **Total Applied:** 2
- **Responses:** 2 (100%)
- **Average Time to Response:** 3 days
```

## Integration

### With Calendar
```bash
# Add interview to calendar
claude skill calendar-add "ICEYE Interview" "2026-04-28" "14:00" "Zoom"
```

### With Notifications
```bash
# Daily digest
0 9 * * * claude skill application-tracker action:follow-up
```

## Data Storage

Location: `/Users/tanvir/career-ops/data/applications.yml`

Backup: Git-tracked, commit weekly

## Reports

### Weekly Report
Generated every Sunday:
- Applications sent this week
- Status updates
- Follow-ups needed
- Interview prep reminders

### Monthly Analysis
- Conversion rates by source
- Response times by company type
- Salary offers received
- Success patterns

## Memory Updates

Track over time:
- Which sources yield best results
- Optimal application timing
- Successful follow-up strategies
- Salary benchmarks by company

---

*Last updated: 2026-04-22*
