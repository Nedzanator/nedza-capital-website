# Nedza Capital website — agent guide

This repository uses multiple AI agents in parallel. Read this file before making changes.

## Project context

- **Stack:** Static HTML/CSS (`index.html`, `thank-you.html`), images at repo root
- **CI:** `.github/workflows/ci.yml` — requires `index.html`, `thank-you.html`, no `TODO` in `index.html`
- **Production:** Netlify → `https://www.nedzacapital.com` (see `README.md` for site ID and deploy options)
- **GitHub:** `Nedzanator/nedza-capital-website` · branch `main`

## Roles

| Agent | Where | Does | Does not |
| --- | --- | --- | --- |
| **Codex** | Local CLI (`codex`) | Main implementation, local preview checks, commits in worktree | Broad repo dumps |
| **Gemini** | Local CLI (`gemini`) | Scout, layout/CSS maps, copy plans, risks | Edit files (unless claimed) |
| **Claude** | Local CLI (`claude`) | Review diffs, accessibility, design regressions | Implement features (unless claimed) |
| **Jules** | [jules.google.com](https://jules.google.com) | Async scoped tasks → branch/PR on GitHub | Same files Codex is editing |
| **Cursor** | IDE | Orchestration, in-editor agents | Replace Codex for large multi-file builds |

## Coordination

- **Handoff board:** `.agents/COORDINATION.md` — claim tasks and file areas before editing.
- **Startup prompts:** `.agents/PROMPT_*.md`
- **Setup:** `.agents/SETUP.md`

## Rules

1. Claim work in `COORDINATION.md` before touching files.
2. One editing agent per file group at a time (`index.html` vs assets vs workflows).
3. Jules tasks must be **scoped** (specific files, acceptance criteria, open PR only).
4. Prefer **git worktrees** under `.worktrees/` for parallel implementers (`scripts/new-agent-worktree.ps1`).
5. Scratch output goes in `.agents/tmp/`; local image experiments in `_crop_test/` (not committed).
6. After HTML changes, verify locally (`python -m http.server 8080`) and ensure CI checks pass.
7. Do not commit secrets (Netlify tokens, `.env`). Deploy credentials stay in GitHub/Netlify settings.

## Jules (async PR worker)

- **Repo:** `Nedzanator/nedza-capital-website` on GitHub
- **Good tasks:** copy tweaks, accessibility fixes, CI/workflow updates, image optimization docs, small HTML sections from an issue
- **Avoid:** vague prompts, full redesigns without mockups, overlapping active Codex paths
- **Label:** add GitHub label `jules` on an issue to auto-start a task (if configured)
- **After Jules finishes:** Claude reviews the PR; Codex does not re-implement the same change locally

## Environment

- Primary branch: `main`
- OS: Windows (PowerShell)
- No build step required; keep the site static unless a task explicitly adds tooling
