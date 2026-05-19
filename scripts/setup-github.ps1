# One-time GitHub workplace setup for nedza-capital-website
# Run in PowerShell: .\scripts\setup-github.ps1

$ErrorActionPreference = "Stop"

$gh = "C:\Program Files\GitHub CLI\gh.exe"
if (-not (Test-Path $gh)) {
    $gh = (Get-Command gh -ErrorAction SilentlyContinue).Source
}
if (-not $gh) {
    Write-Error "GitHub CLI (gh) not found. Install with: winget install GitHub.cli"
}

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")

Set-Location $repoRoot
Write-Host "Repo: $repoRoot" -ForegroundColor Cyan

Write-Host "`n1) Sign in to GitHub (browser will open)..." -ForegroundColor Yellow
& $gh auth login -h github.com -p https -w -s "repo,read:org,workflow,admin:public_key"

Write-Host "`n2) Upload SSH key to your account..." -ForegroundColor Yellow
& $gh ssh-key add "$env:USERPROFILE\.ssh\id_ed25519.pub" -t "nedza-capital-website-$(hostname)"

Write-Host "`n3) Point origin at SSH (optional, recommended)..." -ForegroundColor Yellow
$useSsh = Read-Host "Switch remote origin to git@github.com:Nedzanator/nedza-capital-website.git? [Y/n]"
if ($useSsh -ne "n" -and $useSsh -ne "N") {
    git remote set-url origin git@github.com:Nedzanator/nedza-capital-website.git
    git remote -v
}

Write-Host "`n4) Enable GitHub Pages (Actions source)..." -ForegroundColor Yellow
& $gh api repos/Nedzanator/nedza-capital-website/pages -X POST -f "build_type=workflow" -f "source[branch]=main" -f "source[path]=/" 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "Pages may already be enabled, or need repo admin. Enable manually: Settings -> Pages -> GitHub Actions" -ForegroundColor DarkYellow
}

Write-Host "`n5) Verify SSH to GitHub..." -ForegroundColor Yellow
ssh -T git@github.com

Write-Host "`nDone. Push workflow files if needed: git push origin main" -ForegroundColor Green
