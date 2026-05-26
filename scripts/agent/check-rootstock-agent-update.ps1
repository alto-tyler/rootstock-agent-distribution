param(
    [string]$BaseUrl = "https://raw.githubusercontent.com/alto-tyler/rootstock-agent-distribution/main",
    [string]$PromptsRoot = "$env:APPDATA\Code\User\prompts",
    [string]$GitHubToken = "$env:GITHUB_TOKEN"
)

$ErrorActionPreference = "Stop"

$localManifestPath = Join-Path $PromptsRoot "docs\rootstock-agent-version.json"
$remoteVersionUrl = "$BaseUrl/version.json"

if (-not (Test-Path $localManifestPath)) {
    Write-Output "Local version manifest not found: $localManifestPath"
    Write-Output "Run install script first: ./scripts/agent/install-rootstock-agent.ps1 -SourceMode remote"
    exit 2
}

$local = Get-Content -Path $localManifestPath -Raw | ConvertFrom-Json

$tmpFile = [System.IO.Path]::GetTempFileName()
try {
    if ([string]::IsNullOrWhiteSpace($GitHubToken)) {
        Invoke-WebRequest -Uri $remoteVersionUrl -OutFile $tmpFile -UseBasicParsing
    }
    else {
        try {
            Invoke-WebRequest -Uri $remoteVersionUrl -OutFile $tmpFile -Headers @{ Authorization = "token $GitHubToken"; "User-Agent" = "rootstock-agent-update-check" } -UseBasicParsing
        }
        catch {
            $parsed = [Uri]$remoteVersionUrl
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

            Invoke-WebRequest -Uri $apiUri -OutFile $tmpFile -Headers @{
                Authorization = "token $GitHubToken"
                Accept = "application/vnd.github.raw"
                "User-Agent" = "rootstock-agent-update-check"
            } -UseBasicParsing
        }
    }
    $remote = Get-Content -Path $tmpFile -Raw | ConvertFrom-Json
}
catch {
    Write-Output "Could not fetch remote version manifest from: $remoteVersionUrl"
    Write-Output $_.Exception.Message
    exit 3
}
finally {
    if (Test-Path $tmpFile) { Remove-Item $tmpFile -Force }
}

$localVersionString = [string]$local.version
$remoteVersionString = [string]$remote.version

$localVersion = $null
$remoteVersion = $null
try { $localVersion = [Version]$localVersionString } catch {}
try { $remoteVersion = [Version]$remoteVersionString } catch {}

Write-Output "Local version:  $localVersionString"
Write-Output "Remote version: $remoteVersionString"

if ($localVersion -and $remoteVersion) {
    if ($remoteVersion -gt $localVersion) {
        Write-Output "Update available."
        Write-Output "Run: ./scripts/agent/install-rootstock-agent.ps1 -SourceMode remote"
        exit 1
    }

    Write-Output "Up to date."
    exit 0
}

if ($localVersionString -ne $remoteVersionString) {
    Write-Output "Update available (string comparison fallback)."
    Write-Output "Run: ./scripts/agent/install-rootstock-agent.ps1 -SourceMode remote"
    exit 1
}

Write-Output "Up to date."
exit 0
