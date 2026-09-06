param(
    [Parameter(Mandatory=$true)]
    [string]$ProjectPath
)

$ErrorActionPreference = "Stop"
$Target = (Resolve-Path $ProjectPath).Path
if (-not (Test-Path (Join-Path $Target ".git"))) {
    throw "Target is not a Git repository: $Target"
}

$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
New-Item -ItemType Directory -Force -Path (Join-Path $Target ".agents\skills\repository-development") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $Target ".claude\skills\repository-development") | Out-Null

Copy-Item (Join-Path $Root "AGENTS.md") (Join-Path $Target "AGENTS.md") -Force
Copy-Item (Join-Path $Root "CLAUDE.md") (Join-Path $Target "CLAUDE.md") -Force
Copy-Item (Join-Path $Root "AI_SKILLS.md") (Join-Path $Target "AI_SKILLS.md") -Force
Copy-Item (Join-Path $Root ".agents\skills\repository-development\SKILL.md") (Join-Path $Target ".agents\skills\repository-development\SKILL.md") -Force
Copy-Item (Join-Path $Root ".claude\skills\repository-development\SKILL.md") (Join-Path $Target ".claude\skills\repository-development\SKILL.md") -Force

Write-Host "Installed AI repository development skills into: $Target"
Write-Host "Review the files, then commit them to the target repository default branch."
