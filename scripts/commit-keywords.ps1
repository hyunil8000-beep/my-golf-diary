param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$Request,

    [switch]$Push
)

$git = "C:\Program Files\Git\bin\git.exe"
$repoRoot = Split-Path $PSScriptRoot -Parent
Set-Location $repoRoot

$stopWords = @(
    '해줘', '해주', '하고', '싶어', '응', '그리고', '이거', '만들', '만들어',
    '디자인', '페이지', '화면', '탭', '나눠', '연동', '커밋', '관리', '싶은',
    '있어', '되지', '않나', '가능', '확인', '지금', '작업', '들', '을', '를',
    '이', '가', '은', '는', '의', '에', '로', '와', '과', '다', '요', '좀', '도',
    '만', '에서', '으로', '까지', '하면', '하면', '있', '없', '주', '줘', '해',
    'the', 'and', 'for', 'with', 'from', 'that', 'this', 'please', 'want'
)

$type = 'chore'
if ($Request -match '디자인|만들|추가|구현|생성|UI|화면|탭') { $type = 'feat' }
elseif ($Request -match '수정|나눠|분리|리팩|정리|변경') { $type = 'refactor' }
elseif ($Request -match '버그|오류|fix|수리|고치') { $type = 'fix' }
elseif ($Request -match '문서|readme|설명') { $type = 'docs' }

$tokens = [regex]::Matches($Request, '[A-Za-z0-9_]+|[가-힣]{2,}') |
    ForEach-Object { $_.Value } |
    Where-Object {
        $word = $_.ToLower()
        $stopWords -notcontains $word -and $word.Length -ge 2
    } |
    Select-Object -Unique

if ($tokens.Count -eq 0) {
    $summary = 'update project'
} else {
    $summary = ($tokens | Select-Object -First 6) -join ', '
}

$commitMessage = "${type}: ${summary}"

Write-Host "Commit message: $commitMessage" -ForegroundColor Cyan

& $git add .

$status = & $git status --porcelain
if ([string]::IsNullOrWhiteSpace($status)) {
    Write-Host "No changes to commit." -ForegroundColor Yellow
    exit 0
}

& $git commit -m $commitMessage
& $git status

if ($Push) {
    & $git push
}

Write-Host "Done." -ForegroundColor Green
