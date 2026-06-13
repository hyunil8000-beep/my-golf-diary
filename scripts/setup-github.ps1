param(
    [string]$RepoName = "my-golf-diary",
    [switch]$Private
)

$git = "C:\Program Files\Git\bin\git.exe"
$gh = "C:\Program Files\GitHub CLI\gh.exe"
$repoRoot = Split-Path $PSScriptRoot -Parent
Set-Location $repoRoot

Write-Host "Checking GitHub login..." -ForegroundColor Cyan
& $gh auth status 2>&1 | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "GitHub login required. Browser will open." -ForegroundColor Yellow
    & $gh auth login -h github.com -p https -w
}

$visibility = if ($Private) { "--private" } else { "--public" }

Write-Host "Creating GitHub repository: $RepoName" -ForegroundColor Cyan
& $gh repo create $RepoName $visibility --source=. --remote=origin --description "My Golf Diary - Flutter golf practice and round tracking app"

& $git branch -M main
& $git push -u origin main

Write-Host "GitHub setup complete." -ForegroundColor Green
& $gh repo view --web
