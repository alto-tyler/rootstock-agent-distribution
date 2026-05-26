param(
    [string]$SourceMode = "remote",   # remote | local
    [string]$BaseUrl = "https://raw.githubusercontent.com/your-org/rootstock-agent-distribution/main",
    [string]$LocalPackagePath = "",
    [string]$PromptsRoot = "$env:APPDATA\Code\User\prompts"
)

$ErrorActionPreference = "Stop"

function Ensure-Dir {
    param([string]$Path)
    if (-not (Test-Path $Path)) {
        New-Item -ItemType Directory -Path $Path -Force | Out-Null
    }
}

$agentsDir = Join-Path $PromptsRoot "agents"
$docsDir = Join-Path $PromptsRoot "docs"
Ensure-Dir $PromptsRoot
Ensure-Dir $agentsDir
Ensure-Dir $docsDir

$agentDest = Join-Path $agentsDir "Rootstock Agent.agent.md"
$fieldHelpDest = Join-Path $docsDir "rootstock-field-help-sample.md"
$certSuiteDest = Join-Path $docsDir "rootstock-agent-certification-suite.md"
$testLogDest = Join-Path $docsDir "rootstock-agent-test-log.md"

if ($SourceMode -eq "local") {
    if ([string]::IsNullOrWhiteSpace($LocalPackagePath)) {
        throw "LocalPackagePath is required when SourceMode=local"
    }

    $pkg = (Resolve-Path $LocalPackagePath).Path
    $agentSrc = Join-Path $pkg ".github\agents\Rootstock Agent.agent.md"
    $fieldHelpSrc = Join-Path $pkg "docs\rootstock-field-help-sample.md"
    $certSuiteSrc = Join-Path $pkg "docs\rootstock-agent-certification-suite.md"
    $testLogSrc = Join-Path $pkg "docs\rootstock-agent-test-log.md"

    if (-not (Test-Path $agentSrc)) { throw "Missing agent source: $agentSrc" }
    if (-not (Test-Path $fieldHelpSrc)) { throw "Missing field help source: $fieldHelpSrc" }

    Copy-Item $agentSrc $agentDest -Force
    Copy-Item $fieldHelpSrc $fieldHelpDest -Force
    if (Test-Path $certSuiteSrc) { Copy-Item $certSuiteSrc $certSuiteDest -Force }
    if (Test-Path $testLogSrc) { Copy-Item $testLogSrc $testLogDest -Force }
}
elseif ($SourceMode -eq "remote") {
    $agentUrl = "$BaseUrl/.github/agents/Rootstock%20Agent.agent.md"
    $fieldHelpUrl = "$BaseUrl/docs/rootstock-field-help-sample.md"
    $certSuiteUrl = "$BaseUrl/docs/rootstock-agent-certification-suite.md"
    $testLogUrl = "$BaseUrl/docs/rootstock-agent-test-log.md"

    Invoke-WebRequest -Uri $agentUrl -OutFile $agentDest
    Invoke-WebRequest -Uri $fieldHelpUrl -OutFile $fieldHelpDest

    try { Invoke-WebRequest -Uri $certSuiteUrl -OutFile $certSuiteDest } catch {}
    try { Invoke-WebRequest -Uri $testLogUrl -OutFile $testLogDest } catch {}
}
else {
    throw "Invalid SourceMode '$SourceMode'. Use remote or local."
}

Write-Output "Installed Rootstock Agent to: $agentDest"
Write-Output "Installed field help snapshot to: $fieldHelpDest"
Write-Output "Prompts root: $PromptsRoot"
