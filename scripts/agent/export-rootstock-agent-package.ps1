param(
    [string]$ProjectRoot = ".",
    [string]$OutputRoot = "dist"
)

$ErrorActionPreference = "Stop"

$projectPath = (Resolve-Path $ProjectRoot).Path
$dateTag = Get-Date -Format "yyyyMMdd-HHmmss"
$packageName = "rootstock-agent-package-$dateTag"
$tempDir = Join-Path $projectPath $OutputRoot
$packageDir = Join-Path $tempDir $packageName

$agentSrc = Join-Path $projectPath ".github/agents/Rootstock Agent.agent.md"
$fieldHelpSrc = Join-Path $projectPath "docs/rootstock-field-help-sample.md"
$certSuiteSrc = Join-Path $projectPath "docs/rootstock-agent-certification-suite.md"
$testLogSrc = Join-Path $projectPath "docs/rootstock-agent-test-log.md"
$readmeSrc = Join-Path $projectPath "docs/rootstock-agent-share-package.md"

if (-not (Test-Path $agentSrc)) { throw "Missing agent file: $agentSrc" }
if (-not (Test-Path $fieldHelpSrc)) { throw "Missing field help file: $fieldHelpSrc" }

New-Item -ItemType Directory -Path $packageDir -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $packageDir ".github/agents") -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $packageDir "docs") -Force | Out-Null

Copy-Item $agentSrc (Join-Path $packageDir ".github/agents/") -Force
Copy-Item $fieldHelpSrc (Join-Path $packageDir "docs/") -Force

if (Test-Path $certSuiteSrc) { Copy-Item $certSuiteSrc (Join-Path $packageDir "docs/") -Force }
if (Test-Path $testLogSrc) { Copy-Item $testLogSrc (Join-Path $packageDir "docs/") -Force }
if (Test-Path $readmeSrc) { Copy-Item $readmeSrc (Join-Path $packageDir "docs/") -Force }

$zipPath = "$packageDir.zip"
if (Test-Path $zipPath) { Remove-Item $zipPath -Force }
Compress-Archive -Path (Join-Path $packageDir "*") -DestinationPath $zipPath -Force

Write-Output "Package folder: $packageDir"
Write-Output "Zip file: $zipPath"
