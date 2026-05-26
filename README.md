# Rootstock Agent Distribution

Central distribution repository for the VS Code Rootstock Agent and supporting docs.

## Contents

- .github/agents/Rootstock Agent.agent.md
- docs/rootstock-field-help-sample.md
- docs/rootstock-agent-certification-suite.md
- docs/rootstock-agent-test-log.md
- docs/rootstock-agent-deployment.md
- docs/rootstock-agent-share-package.md
- scripts/agent/install-rootstock-agent.ps1
- scripts/agent/export-rootstock-agent-package.ps1

## Install (remote)

```powershell
./scripts/agent/install-rootstock-agent.ps1 -SourceMode remote -BaseUrl "https://raw.githubusercontent.com/alto-tyler/rootstock-agent-distribution/main"
```

If this repo is private, set a token first:

```powershell
$env:GITHUB_TOKEN = "<token-with-repo-read>"
```

## Check for updates

```powershell
./scripts/agent/check-rootstock-agent-update.ps1
```
