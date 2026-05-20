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

**Production** (`https://www.nedzacapital.com`) is served by **Netlify** (DNS is on Netlify). Pushing to `main` updates GitHub only until Netlify deploys that commit.

| Piece | Purpose |
| --- | --- |
| [`.github/workflows/ci.yml`](.github/workflows/ci.yml) | Validates required pages on push/PR |
| [`.github/workflows/netlify.yml`](.github/workflows/netlify.yml) | Deploys to Netlify when `NETLIFY_AUTH_TOKEN` + `NETLIFY_SITE_ID` secrets are set |
| [`.github/workflows/pages.yml`](.github/workflows/pages.yml) | Optional GitHub Pages deploy (requires repo admin setup) |
| [`netlify.toml`](netlify.toml) | Netlify publish directory (repo root) |
| [`scripts/setup-github.ps1`](scripts/setup-github.ps1) | One-time CLI auth, SSH key upload, Pages enable |

### Update the live site (Netlify)

Pick one:

1. **Netlify UI** — [app.netlify.com](https://app.netlify.com) → your site → **Deploys** → **Trigger deploy** → **Deploy site** (ensure the site is linked to `Nedzanator/nedza-capital-website`, branch `main`).
2. **GitHub Actions** — In Netlify: **User settings → Applications → Personal access tokens**. In GitHub: repo **Settings → Secrets → Actions** → add `NETLIFY_AUTH_TOKEN` and `NETLIFY_SITE_ID` (Site settings → General → Site ID). Push to `main` or run **Deploy to Netlify** workflow manually.

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

