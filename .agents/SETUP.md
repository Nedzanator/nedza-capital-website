# Multi-agent setup (nedza-capital-website)

One-time and daily checklist for parallel Codex, Gemini, Claude, Jules, and Cursor.

## 1. Repo facts

| Item | Value |
| --- | --- |
| GitHub | `Nedzanator/nedza-capital-website` |
| Branch | `main` |
| Live site | https://www.nedzacapital.com (Netlify) |
| Local path | `c:\nedza-capital-website` |

## 2. Jules + GitHub (one time)

1. Open [jules.google.com](https://jules.google.com) and sign in with your Google account.
2. **Connect GitHub** → grant access to **Nedzanator/nedza-capital-website**.
3. In GitHub repo **Settings → Integrations → Applications**, confirm the Jules app is allowed.
4. Label **`jules`** exists on the repo (create via `.\scripts\setup-jules.ps1` if missing).
5. Enable **browser notifications** in Jules so async tasks can finish while you work elsewhere.

## 3. Local CLIs (verify once)

In PowerShell:

```powershell
codex --version
gemini --version
claude --version
```

## 4. Push agent config to GitHub

Jules reads `AGENTS.md` from the remote repo. Commit and push:

```powershell
cd c:\nedza-capital-website
git add AGENTS.md .agents/
git commit -m "Add multi-agent coordination for site repo"
git push origin main
```

## 5. Daily parallel workflow

### Start all local agents

`Ctrl+Shift+P` → **Tasks: Run Task** → **Agents: Start All**

Opens three terminals: Gemini (scout), Codex (build), Claude (review).

### Local preview (any agent)

```powershell
cd c:\nedza-capital-website
python -m http.server 8080
```

Visit http://localhost:8080 and check layout after HTML/CSS changes.

### Parallel implementers (avoid file fights)

```powershell
.\scripts\new-agent-worktree.ps1 -Name hero-update
cd .worktrees\hero-update
codex
```

Log the worktree path in `.agents/COORDINATION.md`.

### Jules in parallel

1. Gemini scouts → file list and risks for Codex.
2. Codex implements in worktree A.
3. Jules: scoped task from `.agents/PROMPT_JULES.md` → PR on GitHub.
4. Claude reviews Jules PR while Codex continues.

## 6. COORDINATION.md

Before any agent edits:

1. Add a row to **Active Work** (agent, task, files, status).
2. Set status **Done** when finished.
3. Add a **Handoff note** if stopping mid-task.

## 7. Deploy after merge

See `README.md`. Common paths:

- **Netlify UI** — trigger deploy on site `nedza-capital`
- **CLI** — `npx netlify-cli deploy --prod --dir .` (after link)
- **GitHub Actions** — if `NETLIFY_AUTH_TOKEN` and `NETLIFY_SITE_ID` secrets are set

## 8. Troubleshooting

| Problem | Fix |
| --- | --- |
| Jules can't see repo | Re-authorize GitHub; push `AGENTS.md` to `main` |
| Agents overwrite each other | Claim files in `COORDINATION.md`; use worktrees |
| CI fails on PR | Ensure `index.html` and `thank-you.html` exist; remove `TODO` from `index.html` |
| Wrong Netlify site | Use site ID in `README.md` (`9ee0269f-e76e-40e7-ac8f-7cdeba577f71`) |
