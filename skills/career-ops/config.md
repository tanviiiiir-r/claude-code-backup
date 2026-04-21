---
name: career-ops-config
description: Configuration settings for career-ops
---

# Career-Ops Configuration

## Auto-Generation Settings

### Cover Letters (NEW)
When evaluating any job, automatically generate:
- [x] Tailored CV (existing)
- [x] **Cover Letter (enabled)** ← NEW

**Location:** `output/coverletter-{company-slug}.pdf`

**Trigger:**
- `/career-ops {URL}` → CV + Cover Letter
- `/career-ops pipeline` → CV + Cover Letter for all pending
- Score >= 3.0 → Generate both

### Cover Letter Includes:
1. Hook referencing specific JD
2. Skills match table (if technical role)
3. Portfolio proof point
4. Why this company (research-based)
5. Blocker mitigation (visa/language if applicable)
6. Professional close

## How It Works

When you paste a JD:
```
/career-ops https://company.com/job/123
```

Career-ops will create:
```
output/
├── cv-{company}-{role}.pdf          ← Tailored CV
└── coverletter-{company}.pdf        ← ← NEW: Cover Letter
```

## Check Tracker Anytime

```bash
# Command line
cat /Users/tanvir/career-ops/data/applications.md

# Or via career-ops
/career-ops tracker
```

## Update Status

After applying, update tracker manually or say:
"Update Reaktor status to Applied"

---

**Configuration updated: Cover letters now auto-generated**
