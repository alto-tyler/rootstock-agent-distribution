# Rootstock Agent Deployment Model

Use this model to push Rootstock Agent updates to all developers from one central source.

## Recommended architecture

1. Create a dedicated distribution repository (private is fine).
2. Keep this structure in that repo:
   - .github/agents/Rootstock Agent.agent.md
   - docs/rootstock-field-help-sample.md
   - docs/rootstock-agent-certification-suite.md
   - docs/rootstock-agent-test-log.md
3. Developers install/update from that repository into their user-level prompts folder.

## Developer install and update

Use the installer script in this repo:

- scripts/agent/install-rootstock-agent.ps1

### Remote install (recommended)

```powershell
./scripts/agent/install-rootstock-agent.ps1 -SourceMode remote -BaseUrl "https://raw.githubusercontent.com/<org>/<repo>/<branch>"
```

### Local install (from extracted package)

```powershell
./scripts/agent/install-rootstock-agent.ps1 -SourceMode local -LocalPackagePath "C:\path\to\rootstock-agent-package"
```

## Team rollout workflow

1. Update source agent in your main repo.
2. Export package using scripts/agent/export-rootstock-agent-package.ps1.
3. Sync exported contents into distribution repo.
4. Commit and push distribution repo.
5. Developers run installer script again (same command) to pull latest.

## Optional automation

- Add a scheduled task in developer environments to run the installer weekly.
- Add CI in distribution repo to validate that agent file parses and required files exist.

## Verification in VS Code

After install:

1. Open chat agent picker.
2. Select Rootstock Agent.
3. Run a smoke test from docs/rootstock-agent-certification-suite.md.
