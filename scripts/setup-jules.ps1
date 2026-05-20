# One-time Jules setup for Nedzanator/nedza-capital-website
# Opens Jules and GitHub in the browser. Complete sign-in / repo access in the UI.

$ErrorActionPreference = "Stop"
$Repo = "Nedzanator/nedza-capital-website"
$Gh = "C:\Program Files\GitHub CLI\gh.exe"

Write-Host "Jules setup for $Repo"
Write-Host ""

if (Test-Path $Gh) {
    $labels = & $Gh label list --repo $Repo --search jules 2>$null
    if ($labels -match "jules") {
        Write-Host "[ok] GitHub label jules exists"
    } else {
        Write-Host "[..] Creating GitHub label jules..."
        & $Gh label create jules --repo $Repo `
            --description "Trigger Jules async coding agent from this issue" `
            --color "5319E7"
        Write-Host "[ok] Label created"
    }
} else {
    Write-Host "[!] GitHub CLI not found - create label jules manually:"
    Write-Host "    https://github.com/$Repo/labels"
}

Write-Host ""
Write-Host "Opening browser tabs (complete sign-in if prompted):"
Write-Host "  1. Jules - connect GitHub and select $Repo"
Write-Host "  2. GitHub - grant Jules app access to this repo"
Write-Host ""

Start-Process "https://jules.google.com"
Start-Sleep -Milliseconds 500
Start-Process "https://github.com/settings/installations"
Start-Sleep -Milliseconds 500
Start-Process "https://github.com/$Repo/labels"

Write-Host "Manual steps:"
Write-Host "  - Jules: sign in, Connect GitHub, enroll $Repo"
Write-Host "  - GitHub: Applications, Google Labs Jules, add $Repo under Repository access"
Write-Host "  - Test: New issue from Jules task template, or add label jules to any issue"
Write-Host ""
