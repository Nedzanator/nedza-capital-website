# nedza-capital-website

Nedza Capital Partners, LLC. marketing site (static HTML).

## Local preview

Open `index.html` in a browser, or serve the folder:

```powershell
cd c:\nedza-capital-website
python -m http.server 8080
```

Then visit http://localhost:8080

## Deployment

**Production** (`https://www.nedzacapital.com`) is served by **Netlify** on team slug **`chris-o1desba`** (Netlify UI: **Nedza Capital Pro**). Pushing to `main` updates GitHub only until that site deploys.

| Netlify | Value |
| --- | --- |
| Team slug | `chris-o1desba` ([team builds](https://app.netlify.com/teams/chris-o1desba/builds)) |
| Site name | `nedza-capital` |
| Site ID | `9ee0269f-e76e-40e7-ac8f-7cdeba577f71` |
| Custom domain | `www.nedzacapital.com` |
| GitHub repo | `Nedzanator/nedza-capital-website` (`main`) |

**Wrong site (do not use for production):** free-team project `statuesque-axolotl-fb22b5` (`92340366-6e0e-4b88-9bd4-6cfdae97ca28`) — not connected to `www.nedzacapital.com`.

| Piece | Purpose |
| --- | --- |
| [`.github/workflows/ci.yml`](.github/workflows/ci.yml) | Validates required pages on push/PR |
| [`.github/workflows/netlify.yml`](.github/workflows/netlify.yml) | Deploys to Netlify when `NETLIFY_AUTH_TOKEN` + `NETLIFY_SITE_ID` secrets are set |
| [`.github/workflows/pages.yml`](.github/workflows/pages.yml) | Optional GitHub Pages deploy (requires repo admin setup) |
| [`netlify.toml`](netlify.toml) | Netlify publish directory (repo root) |
| [`scripts/setup-github.ps1`](scripts/setup-github.ps1) | One-time CLI auth, SSH key upload, Pages enable |

### Update the live site (Netlify)

Pick one:

1. **Netlify UI** — [nedza-capital deploys](https://app.netlify.com/projects/nedza-capital/deploys) on team **chris-o1desba** → **Trigger deploy** → **Deploy site** (linked to `Nedzanator/nedza-capital-website`, branch `main`). Approve pending production deploys from Git contributors if builds are stuck in review.
2. **CLI** — `npx netlify-cli link --id 9ee0269f-e76e-40e7-ac8f-7cdeba577f71` then `npx netlify-cli deploy --prod --dir .`
3. **GitHub Actions** — Repo **Settings → Secrets → Actions**: `NETLIFY_AUTH_TOKEN` (Netlify personal access token) and `NETLIFY_SITE_ID` = `9ee0269f-e76e-40e7-ac8f-7cdeba577f71`. Push to `main` or run **Deploy to Netlify** manually.

### GitHub Pages (optional alternate host)

Repo admin (not write collaborators) must enable once: **Settings → Pages → Build and deployment → Source: GitHub Actions**. Then `pages.yml` runs on push. To use a custom domain on Pages instead of Netlify, update DNS away from Netlify and add a `CNAME` for `www`.

Preview URL (after Pages is enabled): `https://nedzanator.github.io/nedza-capital-website/`

### First-time machine setup

1. Sign in with **GitHub Desktop** (installed) or run `.\scripts\setup-github.ps1`.
2. Add your SSH public key at https://github.com/settings/ssh/new (key is in `%USERPROFILE%\.ssh\id_ed25519.pub`).
3. For Pages (optional): repo admin → **Settings → Pages → Source: GitHub Actions**.

## Branching

- `main` — production; merges deploy via GitHub Actions.
- Feature branches — open a PR; CI runs automatically.

## Multi-agent coordination

Parallel AI agents (Codex, Gemini, Claude, Jules, Cursor) use:

- [`AGENTS.md`](AGENTS.md) — roles and rules
- [`.agents/COORDINATION.md`](.agents/COORDINATION.md) — claim tasks before editing
- [`.agents/SETUP.md`](.agents/SETUP.md) — one-time Jules/GitHub setup

New parallel worktree: `.\scripts\new-agent-worktree.ps1 -Name <name>`

