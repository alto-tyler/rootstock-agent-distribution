param(
    [string]$SourceMode = "remote",   # remote | local
    [string]$BaseUrl = "https://raw.githubusercontent.com/alto-tyler/rootstock-agent-distribution/main",
    [string]$LocalPackagePath = "",
    [string]$PromptsRoot = "$env:APPDATA\Code\User\prompts",
    [string]$GitHubToken = "$env:GITHUB_TOKEN"
)

$ErrorActionPreference = "Stop"

function Ensure-Dir {
    param([string]$Path)
    if (-not (Test-Path $Path)) {
        New-Item -ItemType Directory -Path $Path -Force | Out-Null
    }
}

function Download-File {
    param(
        [string]$Uri,
        [string]$OutFile
    )

    try {
        if ([string]::IsNullOrWhiteSpace($GitHubToken)) {
            Invoke-WebRequest -Uri $Uri -OutFile $OutFile -UseBasicParsing
        }
        else {
            Invoke-WebRequest -Uri $Uri -OutFile $OutFile -Headers @{ Authorization = "token $GitHubToken"; "User-Agent" = "rootstock-agent-installer" } -UseBasicParsing
        }
    }
    catch {
        if ([string]::IsNullOrWhiteSpace($GitHubToken)) {
            throw
        }

        $parsed = [Uri]$Uri
        if ($parsed.Host -ne "raw.githubusercontent.com") {
            throw
        }

        $parts = $parsed.AbsolutePath.Trim("/").Split("/")
        if ($parts.Count -lt 4) {
            throw
        }

        $owner = $parts[0]
        $repo = $parts[1]
        $branch = $parts[2]
        $path = [string]::Join("/", $parts[3..($parts.Count - 1)])
        $apiUri = "https://api.github.com/repos/$owner/$repo/contents/$path?ref=$branch"

        Invoke-WebRequest -Uri $apiUri -OutFile $OutFile -Headers @{
            Authorization = "token $GitHubToken"
            Accept = "application/vnd.github.raw"
            "User-Agent" = "rootstock-agent-installer"
        } -UseBasicParsing
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
$versionManifestDest = Join-Path $docsDir "rootstock-agent-version.json"

if ($SourceMode -eq "local") {
    if ([string]::IsNullOrWhiteSpace($LocalPackagePath)) {
        throw "LocalPackagePath is required when SourceMode=local"
    }

    $pkg = (Resolve-Path $LocalPackagePath).Path
    $agentSrc = Join-Path $pkg ".github\agents\Rootstock Agent.agent.md"
    $fieldHelpSrc = Join-Path $pkg "docs\rootstock-field-help-sample.md"
    $certSuiteSrc = Join-Path $pkg "docs\rootstock-agent-certification-suite.md"
    $testLogSrc = Join-Path $pkg "docs\rootstock-agent-test-log.md"
    $versionManifestSrc = Join-Path $pkg "version.json"

    if (-not (Test-Path $agentSrc)) { throw "Missing agent source: $agentSrc" }
    if (-not (Test-Path $fieldHelpSrc)) { throw "Missing field help source: $fieldHelpSrc" }

    Copy-Item $agentSrc $agentDest -Force
    Copy-Item $fieldHelpSrc $fieldHelpDest -Force
    if (Test-Path $certSuiteSrc) { Copy-Item $certSuiteSrc $certSuiteDest -Force }
    if (Test-Path $testLogSrc) { Copy-Item $testLogSrc $testLogDest -Force }
    if (Test-Path $versionManifestSrc) {
        Copy-Item $versionManifestSrc $versionManifestDest -Force
    }
}
elseif ($SourceMode -eq "remote") {
    $agentUrl = "$BaseUrl/.github/agents/Rootstock%20Agent.agent.md"
    $fieldHelpUrl = "$BaseUrl/docs/rootstock-field-help-sample.md"
    $certSuiteUrl = "$BaseUrl/docs/rootstock-agent-certification-suite.md"
    $testLogUrl = "$BaseUrl/docs/rootstock-agent-test-log.md"
    $versionManifestUrl = "$BaseUrl/version.json"

    Download-File -Uri $agentUrl -OutFile $agentDest
    Download-File -Uri $fieldHelpUrl -OutFile $fieldHelpDest

    try { Download-File -Uri $certSuiteUrl -OutFile $certSuiteDest } catch {}
    try { Download-File -Uri $testLogUrl -OutFile $testLogDest } catch {}
    try { Download-File -Uri $versionManifestUrl -OutFile $versionManifestDest } catch {}
}
else {
    throw "Invalid SourceMode '$SourceMode'. Use remote or local."
}

$versionData = $null
if (Test-Path $versionManifestDest) {
    try {
        $versionData = Get-Content -Path $versionManifestDest -Raw | ConvertFrom-Json
    }
    catch {
        $versionData = $null
    }
}

if (-not $versionData) {
    $versionData = [PSCustomObject]@{
        version = "0.0.0-unknown"
        channel = "manual"
        notes = "No version manifest was found in source package."
    }
}

$versionData | Add-Member -NotePropertyName installedAtUtc -NotePropertyValue ([DateTime]::UtcNow.ToString("s") + "Z") -Force
$versionData | Add-Member -NotePropertyName sourceMode -NotePropertyValue $SourceMode -Force
$versionData | Add-Member -NotePropertyName baseUrl -NotePropertyValue $BaseUrl -Force

$versionData | ConvertTo-Json -Depth 8 | Set-Content -Path $versionManifestDest -Encoding UTF8

Write-Output "Installed Rootstock Agent to: $agentDest"
Write-Output "Installed field help snapshot to: $fieldHelpDest"
Write-Output "Installed version manifest to: $versionManifestDest"
Write-Output "Installed Rootstock Agent version: $($versionData.version)"
Write-Output "Prompts root: $PromptsRoot"
