# Jules task templates

Copy a template into [jules.google.com](https://jules.google.com) after selecting **Nedzanator/nedza-capital-website**.

## Before you submit

1. Log a row in `.agents/COORDINATION.md` (Agent: Jules, Status: In progress).
2. Confirm Codex/Cursor is not editing the same paths.
3. Use branch `main` unless you created a feature branch for this task.

---

## Template: Copy / content update

```
Update site copy in index.html for [SECTION].

Scope:
- Only touch: index.html (section [describe: hero, team, footer, etc.])
- Keep existing design system (fonts, colors, spacing)
- Do not add TODO markers

Acceptance:
- [Specific text changes listed here]
- CI passes (required files present, no TODO in index.html)

Deliverable: Branch + PR. Do not merge.
```

---

## Template: Accessibility fix

```
Improve accessibility in [FILE].

Scope:
- Only touch: [index.html | thank-you.html]
- Focus: [alt text, heading order, contrast, focus states, aria labels]

Acceptance:
- [List concrete fixes]
- No unrelated redesign

Deliverable: Branch + PR with short summary of changes.
```

---

## Template: GitHub issue

```
Fix GitHub issue #[N]: [short title]

Scope:
- Only touch: [paths]
- Acceptance: [what "done" means]

Deliverable: Branch + PR with root cause and fix summary.
```

---

## Template: CI / workflow

```
Update [.github/workflows/ci.yml | netlify.yml] to [goal].

Scope:
- Only workflow/config files listed above
- Do not change site HTML unless required for the check

Acceptance:
- [Describe new check or deploy behavior]
- Workflow YAML valid

Deliverable: Branch + PR only.
```

---

## Template: Docs

```
Document [topic] in README.md.

Acceptance:
- Accurate Netlify/GitHub steps
- No unrelated refactors

Deliverable: Branch + PR only.
```

---

## Avoid

- Full site redesign without mockups or section scope
- Replacing production images without approval
- Editing `index.html` and `thank-you.html` in one vague prompt
