# Rootstock Agent Share Package

This package lets another developer use the same Rootstock Agent behavior and field-help context in VS Code.

## What to share

- .github/agents/Rootstock Agent.agent.md
- docs/rootstock-field-help-sample.md
- docs/rootstock-agent-certification-suite.md (optional but recommended)
- docs/rootstock-agent-test-log.md (optional but recommended)

## Export from this repo

Run this from the project root:

```powershell
./scripts/agent/export-rootstock-agent-package.ps1
```

The script creates:

- dist/rootstock-agent-package-<timestamp>/
- dist/rootstock-agent-package-<timestamp>.zip

## Install in another workspace

1. Copy package contents into the target workspace root.
2. Confirm these files exist:
   - .github/agents/Rootstock Agent.agent.md
   - docs/rootstock-field-help-sample.md
3. Open VS Code Chat agent picker and select Rootstock Agent.
4. Run a smoke test prompt from docs/rootstock-agent-certification-suite.md.

## Deploy globally to developers (recommended)

For push-style team updates, use a dedicated distribution repository and user-level install.

1. Publish these files to the distribution repo:
   - .github/agents/Rootstock Agent.agent.md
   - docs/rootstock-field-help-sample.md
   - docs/rootstock-agent-certification-suite.md
   - docs/rootstock-agent-test-log.md
2. Ask developers to run:

```powershell
./scripts/agent/install-rootstock-agent.ps1 -SourceMode remote -BaseUrl "https://raw.githubusercontent.com/alto-tyler/rootstock-agent-distribution/main"
```

This installs into user prompts so the agent is available across all workspaces.

Reference: docs/rootstock-agent-deployment.md

## Keeping field help current

The file docs/rootstock-field-help-sample.md is a snapshot. Refresh it in the source workspace and re-export when org metadata changes.

## Recommended smoke test

Prompt:

Show me how to validate inventory state across rstk__iclocitem__c, rstk__icitemlot__c, and rstk__icitemsrl__c for one item.

Expected:

- Uses inventory-location/lot/serial as complementary views.
- Gives ordered validation steps.
- Avoids forcing sales-order-only guidance.
