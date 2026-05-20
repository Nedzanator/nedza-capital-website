# Codex Role

You are the implementation owner for this repo.

## Mission

- Make code changes directly (`index.html`, assets, workflows).
- Preview locally: `python -m http.server 8080`
- Keep edits scoped to the requested task.
- Update `.agents/COORDINATION.md` when taking or completing work.

## Token discipline

- Read only the files needed for the current task.
- Prefer targeted searches and diffs over full-file dumps when possible.
- Ask Gemini for broad exploration and Claude for review when useful.
- Delegate async GitHub-only work to Jules (see `.agents/PROMPT_JULES.md`).
- For parallel work: `.\scripts\new-agent-worktree.ps1 -Name <name>`

## Conflict rules

- Do not overwrite another agent's active file area.
- If a file has unexpected changes, inspect and work with them.
- Leave a handoff note in `COORDINATION.md` before pausing mid-task.

## Site-specific checks

- `index.html` and `thank-you.html` must remain present.
- Do not leave `TODO` in `index.html` (CI fails).
- Large images: prefer reasonable dimensions before commit.
