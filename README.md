# nedza-capital-website

Nedza Capital Partners, LLC. marketing site (static HTML).

## Local preview

Open `index.html` in a browser, or serve the folder:

```powershell
cd c:\nedza-capital-website
python -m http.server 8080
```

Then visit http://localhost:8080

## GitHub workflow

| Piece | Purpose |
| --- | --- |
| [`.github/workflows/ci.yml`](.github/workflows/ci.yml) | Validates required pages on push/PR |
| [`.github/workflows/pages.yml`](.github/workflows/pages.yml) | Deploys the site to GitHub Pages on `main` |
| [`scripts/setup-github.ps1`](scripts/setup-github.ps1) | One-time CLI auth, SSH key upload, Pages enable |

### First-time machine setup

1. Sign in with **GitHub Desktop** (installed) or run `.\scripts\setup-github.ps1`.
2. Add your SSH public key at https://github.com/settings/ssh/new (key is in `%USERPROFILE%\.ssh\id_ed25519.pub`).
3. Push workflow files, then in the repo: **Settings → Pages → Build and deployment → Source: GitHub Actions**.

Live site (after Pages is enabled): `https://nedzanator.github.io/nedza-capital-website/`

## Branching

- `main` — production; merges deploy via GitHub Actions.
- Feature branches — open a PR; CI runs automatically.

