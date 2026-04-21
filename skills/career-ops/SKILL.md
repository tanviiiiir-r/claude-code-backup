---
name: career-ops
description: AI job search command center -- evaluate offers, generate CVs, scan portals, track applications
user_invocable: true
args: mode
---

# career-ops -- Router (Global)

**Installation Path:** `/Users/tanvir/career-ops/`

## Mode Routing

Determine the mode from `{{mode}}`:

| Input | Mode |
|-------|------|
| (empty / no args) | `discovery` -- Show command menu |
| JD text or URL (no sub-command) | **`auto-pipeline`** |
| `oferta` | `oferta` |
| `ofertas` | `ofertas` |
| `contacto` | `contacto` |
| `deep` | `deep` |
| `pdf` | `pdf` |
| `training` | `training` |
| `project` | `project` |
| `tracker` | `tracker` |
| `pipeline` | `pipeline` |
| `apply` | `apply` |
| `scan` | `scan` |
| `batch` | `batch` |
| `patterns` | `patterns` |

**Auto-pipeline detection:** If `{{mode}}` is not a known sub-command AND contains JD text (keywords: "responsibilities", "requirements", "qualifications", "about the role", "we're looking for", company name + role) or a URL to a JD, execute `auto-pipeline`.

If `{{mode}}` is not a sub-command AND doesn't look like a JD, show discovery.

---

## Discovery Mode (no arguments)

Show this menu:

```
career-ops -- Command Center

Installation: /Users/tanvir/career-ops/

Available commands:
  /career-ops {JD}      → AUTO-PIPELINE: evaluate + report + PDF + tracker (paste text or URL)
  /career-ops pipeline  → Process pending URLs from inbox (/Users/tanvir/career-ops/data/pipeline.md)
  /career-ops oferta    → Evaluation only A-F (no auto PDF)
  /career-ops ofertas   → Compare and rank multiple offers
  /career-ops contacto  → LinkedIn power move: find contacts + draft message
  /career-ops deep      → Deep research prompt about company
  /career-ops pdf       → PDF only, ATS-optimized CV
  /career-ops training  → Evaluate course/cert against North Star
  /career-ops project   → Evaluate portfolio project idea
  /career-ops tracker   → Application status overview
  /career-ops apply     → Live application assistant (reads form + generates answers)
  /career-ops scan      → Scan portals and discover new offers
  /career-ops batch     → Batch processing with parallel workers
  /career-ops patterns  → Analyze rejection patterns and improve targeting

Inbox: add URLs to /Users/tanvir/career-ops/data/pipeline.md → /career-ops pipeline
Or paste a JD directly to run the full pipeline.
```

---

## Context Loading by Mode

**IMPORTANT:** All mode files are loaded from `/Users/tanvir/career-ops/modes/`.

### Modes that require `_shared.md` + their mode file:
Read `/Users/tanvir/career-ops/modes/_shared.md` + `/Users/tanvir/career-ops/modes/{mode}.md`

Applies to: `auto-pipeline`, `oferta`, `ofertas`, `pdf`, `contacto`, `apply`, `pipeline`, `scan`, `batch`

### Standalone modes (only their mode file):
Read `/Users/tanvir/career-ops/modes/{mode}.md`

Applies to: `tracker`, `deep`, `training`, `project`, `patterns`

### Modes delegated to subagent:
For `scan`, `apply` (with Playwright), and `pipeline` (3+ URLs): launch as Agent with the content of `_shared.md` + `{mode}.md` injected into the subagent prompt.

```
Agent(
  subagent_type="general-purpose",
  prompt="[content of /Users/tanvir/career-ops/modes/_shared.md]\n\n[content of /Users/tanvir/career-ops/modes/{mode}.md]\n\n[invocation-specific data]",
  description="career-ops {mode}"
)
```

---

## Execution

### Working Directory

All file operations (reading cv.md, writing reports, generating PDFs) must use the absolute path `/Users/tanvir/career-ops/` as the base.

When running scripts (like `generate-pdf.mjs`, `merge-tracker.mjs`, etc.), use:
```bash
cd /Users/tanvir/career-ops && node {script}.mjs
```

### File Paths Reference

| File | Absolute Path |
|------|---------------|
| CV (source) | `/Users/tanvir/career-ops/cv.md` |
| Profile config | `/Users/tanvir/career-ops/config/profile.yml` |
| Portals config | `/Users/tanvir/career-ops/portals.yml` |
| Shared modes | `/Users/tanvir/career-ops/modes/_shared.md` |
| Profile modes | `/Users/tanvir/career-ops/modes/_profile.md` |
| Mode files | `/Users/tanvir/career-ops/modes/{mode}.md` |
| Tracker | `/Users/tanvir/career-ops/data/applications.md` |
| Pipeline inbox | `/Users/tanvir/career-ops/data/pipeline.md` |
| Reports | `/Users/tanvir/career-ops/reports/` |
| Output (PDFs) | `/Users/tanvir/career-ops/output/` |
| CV template | `/Users/tanvir/career-ops/templates/cv-template.html` |

---

## Onboarding Check

Before executing any mode, verify the setup by checking these files exist:
1. `/Users/tanvir/career-ops/cv.md` - User's CV in markdown
2. `/Users/tanvir/career-ops/config/profile.yml` - User's profile
3. `/Users/tanvir/career-ops/portals.yml` - Scanner config

If any are missing, guide the user through setup first.

Execute the instructions from the loaded mode file.
