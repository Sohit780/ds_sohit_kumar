# PowerShell script to check git status with error handling
# This script checks if git is available and runs git status

Write-Host "Checking for Git installation..." -ForegroundColor Cyan

# Check if git command exists
$gitCommand = Get-Command git -ErrorAction SilentlyContinue

if ($null -eq $gitCommand) {
    Write-Host "`nERROR: Git is not installed or not in your PATH." -ForegroundColor Red
    Write-Host "`nTo install Git on Windows:" -ForegroundColor Yellow
    Write-Host "1. Download from: https://git-scm.com/download/win" -ForegroundColor White
    Write-Host "2. Or install via winget: winget install --id Git.Git -e --source winget" -ForegroundColor White
    Write-Host "3. Or install via chocolatey: choco install git" -ForegroundColor White
    Write-Host "`nAfter installation, restart your terminal." -ForegroundColor Yellow
    exit 1
}

Write-Host "Git found at: $($gitCommand.Source)" -ForegroundColor Green
Write-Host "`nRunning 'git status'...`n" -ForegroundColor Cyan

# Run git status
try {
    git status
    exit 0
} catch {
    Write-Host "Error running git status: $_" -ForegroundColor Red
    exit 1
}

