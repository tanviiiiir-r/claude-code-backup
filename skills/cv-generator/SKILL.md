---
name: cv-generator
description: Generate ATS-optimized CV in multiple formats (PDF, DOCX, HTML) from markdown source
description: |
  Use this skill when generating CV outputs from markdown source.
  Creates ATS-friendly, keyword-optimized documents.
user-invocable: true
argument-hint: [output-format] [target-role] [keywords]
disable-model-invocation: false
allowed-tools: Read, Write, Bash, Edit
model: haiku
effort: medium
---

# CV Generator Skill

Transform markdown CV into ATS-optimized output formats.

## Task

Generate a CV in the specified format optimized for the target role.

## Input Parameters

- **source:** Path to markdown CV file (default: `/Users/tanvir/career-ops/cv.md`)
- **format:** Output format (pdf, html, docx, txt)
- **target_role:** Optional - role to optimize for
- **keywords:** Optional - keywords to emphasize
- **output_path:** Optional - custom output path

## Generation Workflow

### Step 1: Read Source CV
- Load markdown CV from source path
- Parse sections: Header, Summary, Experience, Education, Skills, Projects

### Step 2: Role Optimization (if target_role specified)
- Reorder experience to highlight relevant roles
- Prioritize relevant skills
- Adjust summary for role fit
- Emphasize achievements matching role requirements

### Step 3: ATS Optimization
- Use standard section headers
- Include keywords naturally
- Avoid tables, graphics, columns
- Use bullet points for readability
- Ensure parseable text (not images)

### Step 4: Format Generation

#### PDF Generation
```bash
cd /Users/tanvir/career-ops && node generate-pdf.mjs --input cv-tailored.md --output cv-tailored.pdf
```

#### HTML Generation
- Use template: `/Users/tanvir/career-ops/templates/cv-template.html`
- Inject markdown content
- Apply responsive styling
- Optimize for web viewing

#### DOCX Generation
- Use Pandoc or similar
- Apply ATS-friendly formatting
- Ensure compatibility with Word/Google Docs

#### TXT Generation
- Strip all formatting
- Plain text for ATS parsing
- Maximum compatibility

### Step 5: Quality Check
Verify:
- [ ] File generated successfully
- [ ] File size reasonable (< 2MB for PDF)
- [ ] Text selectable (not image PDF)
- [ ] Formatting clean
- [ ] Keywords present

## CV Structure Best Practices

### Header Section
```
Name
Phone | Email | LinkedIn | GitHub | Location
```

### Professional Summary
- 3-4 sentences maximum
- Tailored to target role
- Key qualifications highlighted
- Years of experience mentioned

### Experience Section
```
Job Title | Company | Dates
- Achievement 1 (quantified)
- Achievement 2 (quantified)
- Achievement 3 (quantified)
```

### Skills Section
- Group by category (Languages, Frameworks, Tools)
- Match keywords from JD
- Order by proficiency

### Education Section
- Degree, Institution, Date
- Relevant coursework (if applicable)
- GPA (if 3.5+)

## ATS Optimization Rules

### Do
- Use standard fonts (Arial, Calibri, Garamond)
- 10-12pt font size
- Clear section headers
- Consistent formatting
- Keywords from job description
- Spell out acronyms first use

### Don't
- Headers/footers with contact info
- Tables or columns
- Graphics or images
- Fancy formatting
- Multiple font sizes
- Uncommon file formats

## Output Structure

```markdown
# CV Generation Report

## Output Files
| Format | Path | Size | Status |
|--------|------|------|--------|
| PDF | path/to/cv.pdf | 245KB | ✅ Generated |
| HTML | path/to/cv.html | 12KB | ✅ Generated |

## Optimization Applied
- **Target Role:** AI Engineer
- **Keywords Emphasized:** Python, PyTorch, MLOps
- **ATS Score:** 95/100

## Next Steps
1. Review generated CV
2. Customize for specific application
3. Export to application portal
```

## Template Variables

### Available Substitutions
- `{{name}}` - Full name
- `{{email}}` - Contact email
- `{{phone}}` - Phone number
- `{{linkedin}}` - LinkedIn URL
- `{{github}}` - GitHub URL
- `{{summary}}` - Professional summary
- `{{skills}}` - Skills section
- `{{experience}}` - Experience section
- `{{education}}` - Education section
- `{{projects}}` - Projects section

## Automation Integration

### GitHub Actions
```yaml
name: Generate CV
on:
  push:
    paths:
      - 'cv.md'
jobs:
  generate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Generate PDF
        run: node generate-pdf.mjs
      - name: Commit
        run: |
          git add output/
          git commit -m "Update CV [automated]"
          git push
```

### Scheduled Updates
```bash
# Weekly CV refresh
0 9 * * 1 cd /Users/tanvir/career-ops && node generate-pdf.mjs
```

## Quality Metrics

- **ATS Parse Rate:** > 95%
- **Keyword Density:** 2-5%
- **Length:** 1-2 pages
- **File Size:** < 2MB

## Notes

- Always test PDF with ATS scanner
- Keep master CV updated in markdown
- Generate role-specific versions
- Track which versions get responses
- Update monthly minimum

---

*Last updated: 2026-04-22*
