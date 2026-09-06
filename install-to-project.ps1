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
$AgentSkills = Join-Path $Target ".agents\skills"
$ClaudeSkills = Join-Path $Target ".claude\skills"
New-Item -ItemType Directory -Force -Path $AgentSkills | Out-Null
New-Item -ItemType Directory -Force -Path $ClaudeSkills | Out-Null

Copy-Item (Join-Path $Root "AGENTS.md") (Join-Path $Target "AGENTS.md") -Force
Copy-Item (Join-Path $Root "CLAUDE.md") (Join-Path $Target "CLAUDE.md") -Force
Copy-Item (Join-Path $Root "AI_SKILLS.md") (Join-Path $Target "AI_SKILLS.md") -Force

# Use .agents/skills as the canonical source and create physical copies for both agents.
# This avoids depending on Windows symlink behavior.
Get-ChildItem (Join-Path $Root ".agents\skills") -Directory | ForEach-Object {
    $CodexDest = Join-Path $AgentSkills $_.Name
    $ClaudeDest = Join-Path $ClaudeSkills $_.Name
    New-Item -ItemType Directory -Force -Path $CodexDest | Out-Null
    New-Item -ItemType Directory -Force -Path $ClaudeDest | Out-Null
    Copy-Item (Join-Path $_.FullName "*") $CodexDest -Recurse -Force
    Copy-Item (Join-Path $_.FullName "*") $ClaudeDest -Recurse -Force
}

Write-Host "Installed repository-native AI development rules and skills into: $Target"
Write-Host "Codex:  AGENTS.md + .agents/skills/*/SKILL.md"
Write-Host "Claude: CLAUDE.md + .claude/skills/*/SKILL.md"
Write-Host "Next: review the added files and commit them to the target repository default branch."
