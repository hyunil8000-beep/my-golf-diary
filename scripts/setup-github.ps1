param(
    [string]$GitHubUser = "hyunil8000-beep",
    [string]$RepoName = "my-golf-diary",
    [switch]$Private
)

$git = "C:\Program Files\Git\bin\git.exe"
$gh = "C:\Program Files\GitHub CLI\gh.exe"
$repoRoot = Split-Path $PSScriptRoot -Parent
Set-Location $repoRoot

$remoteUrl = "https://github.com/$GitHubUser/$RepoName.git"

Write-Host "GitHub account: $GitHubUser" -ForegroundColor Cyan
Write-Host "Repository URL: $remoteUrl" -ForegroundColor Cyan

Write-Host "Checking GitHub login..." -ForegroundColor Cyan
& $gh auth status 2>&1 | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "GitHub login required. Browser will open." -ForegroundColor Yellow
    Write-Host "Log in as: $GitHubUser" -ForegroundColor Yellow
    & $gh auth login -h github.com -p https -w
}

$existingRemote = & $git remote get-url origin 2>$null
if ($LASTEXITCODE -ne 0) {
    & $git remote add origin $remoteUrl
} elseif ($existingRemote -ne $remoteUrl) {
    & $git remote set-url origin $remoteUrl
}

$visibility = if ($Private) { "--private" } else { "--public" }

Write-Host "Creating GitHub repository: $GitHubUser/$RepoName" -ForegroundColor Cyan
& $gh repo create "$GitHubUser/$RepoName" $visibility --source=. --remote=origin --description "My Golf Diary - Flutter golf practice and round tracking app" 2>&1

& $git branch -M main
& $git push -u origin main

Write-Host "GitHub setup complete." -ForegroundColor Green
Write-Host "Repo: $remoteUrl" -ForegroundColor Green
& $gh repo view "$GitHubUser/$RepoName" --web
