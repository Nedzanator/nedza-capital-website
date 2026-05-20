# Multi-Agent Coordination

Shared handoff for **Codex**, **Gemini**, **Claude**, **Jules**, and **Cursor**.

Setup guide: `.agents/SETUP.md` · Jules templates: `.agents/PROMPT_JULES.md` · Repo rules: `AGENTS.md`

## Ground Rules

- Claim a task in **Active Work** before editing files.
- **Codex** — default implementation owner (local CLI / worktree).
- **Gemini** — scout: structure, copy, CSS sections, deploy docs (read-only unless claimed).
- **Claude** — review: diffs, PRs, a11y, visual regressions (read-only unless claimed).
- **Jules** — async GitHub tasks only; scoped prompts → branch/PR ([jules.google.com](https://jules.google.com)).
- **Cursor** — IDE orchestration; avoid duplicating Codex on the same files.
- One editing agent per area: `index.html` · `thank-you.html` · root images · `.github/` · `netlify.toml`.
- Parallel implementers use **git worktrees** under `.worktrees/` (`scripts/new-agent-worktree.ps1`).
- Scratch work in `.agents/tmp/`; crop experiments in `_crop_test/`.

## File areas (quick reference)

| Area | Paths | Notes |
| --- | --- | --- |
| Main site | `index.html` | Hero, sections, inline CSS/JS |
| Thank-you | `thank-you.html` | Post-form page |
| Assets | `*.png`, `*.jpg`, `*.webp` | Optimize before commit; watch file size |
| Deploy | `netlify.toml`, `.github/workflows/*` | Netlify site ID in `README.md` |
| Docs | `README.md`, `AGENTS.md`, `.agents/*` | Agent coordination |

## Quick start

| Action | How |
| --- | --- |
| Start Gemini + Codex + Claude | `Ctrl+Shift+P` → **Tasks: Run Task** → **Agents: Start All** |
| Local preview | **Site: Local Preview** or `python -m http.server 8080` → http://localhost:8080 |
| New parallel worktree | **Agents: New Worktree** or `.\scripts\new-agent-worktree.ps1 -Name <name>` |
| Open Jules | **Agents: Open Jules** |
| Jules prompt templates | `.agents/PROMPT_JULES.md` |

## Active Work

| Agent | Task | Files / Area | Worktree / PR | Status | Last Updated |
| --- | --- | --- | --- | --- | --- |
| — | — | — | — | — | — |

_Status: `Queued` · `In progress` · `Review` · `Done` · `Blocked`_

## Jules queue

| Task summary | Branch base | PR link | Status |
| --- | --- | --- | --- |
| — | `main` | — | — |

## Handoff Notes

- GitHub: `Nedzanator/nedza-capital-website` — push `AGENTS.md` and `.agents/` so Jules sees repo rules.
- Production deploy: Netlify team `chris-o1desba`, site `nedza-capital` (details in `README.md`).
- CI on PR: validates required HTML files; no `TODO` in `index.html`.
- Issue automation: add GitHub label **`jules`** to start a Jules task from an issue (optional).
