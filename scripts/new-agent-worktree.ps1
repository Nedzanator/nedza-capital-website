param(
    [Parameter(Mandatory = $true)]
    [string]$Name,

    [string]$Branch = "main",

    [switch]$OpenInCode
)

$ErrorActionPreference = "Stop"

function Invoke-Git {
    param(
        [string]$Repo,
        [Parameter(ValueFromRemainingArguments = $true)]
        [string[]]$Args
    )
    $prev = $ErrorActionPreference
    $ErrorActionPreference = "Continue"
    try {
        & git -C $Repo @Args 2>&1 | ForEach-Object { $_ }
        if ($LASTEXITCODE -ne 0) {
            throw "git $($Args -join ' ') failed (exit $LASTEXITCODE)"
        }
    } finally {
        $ErrorActionPreference = $prev
    }
}

$Root = (Invoke-Git -Repo $PSScriptRoot rev-parse --show-toplevel | Select-Object -Last 1).Trim()
$SafeName = $Name -replace '[^\w\-]', '-'
$WorktreesRoot = Join-Path $Root ".worktrees"
$Path = Join-Path $WorktreesRoot $SafeName
$NewBranch = "agent/$SafeName"

if (Test-Path $Path) {
    Write-Host "Worktree already exists: $Path"
} else {
    New-Item -ItemType Directory -Force -Path $WorktreesRoot | Out-Null
    Invoke-Git -Repo $Root fetch origin $Branch | Out-Null
    try {
        Invoke-Git -Repo $Root worktree add -b $NewBranch $Path "origin/$Branch" | Out-Null
    } catch {
        Invoke-Git -Repo $Root worktree add -b $NewBranch $Path $Branch | Out-Null
    }
    Write-Host "Created worktree: $Path (branch $NewBranch)"
}

Write-Host ""
Write-Host "Next steps:"
Write-Host "  cd `"$Path`""
Write-Host "  codex    # or claude / gemini"
Write-Host "  Log this path in .agents/COORDINATION.md"
Write-Host ""

if ($OpenInCode) {
    code $Path
}
