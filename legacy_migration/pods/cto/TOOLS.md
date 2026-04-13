# TOOLS.md - Infrastructure & CTO-specific tools

## PRIMARY DELEGATION TARGET: INTERNAL SUB-AGENTS

The CTO delegates technical implementation to specialized internal sub-agents registered in OpenClaw. The CTO does NOT code directly; it spawns these agents with specific intents and relies on their native bootstrap protocols for execution details.

### Spawning Sub-Agents

Use `sessions_spawn` with `runtime: "subagent"` to delegate coding work:

```javascript
sessions_spawn({
  runtime: "subagent",
  agentId: "<agent-id>", // Replace with the specific specialist ID
  task: "<technical intent>",
  mode: "run"
})
```

The specific configuration, guardrails, and tools of each sub-agent are defined in their own local context and initialized via their `BOOTSTRAP.md`. As the CTO, you only need to provide the clear technical intent and the appropriate `agentId`.

## PERSISTENT MEMORY: ENGRAM (MCP)

**Engram** runs as an MCP server for opencode agents. It is NOT a CLI tool for the CTO — it's the memory backend that opencode sub-agents use.

- **Binary:** `/home/agus/.local/bin/engram` (v1.11.0)
- **MCP Config:** Already wired in opencode.json (`engram mcp --tools=agent`)
- **Topic Keys:** `sdd-init/{project}`, `sdd/{change-name}/explore`, etc.

The CTO does NOT interact with engram directly. Opencode sub-agents use `mem_search`/`mem_save` internally.

## MCP PROVIDERS (configured in opencode)

| Provider | Type | Purpose |
|----------|------|---------|
| `engram` | local | Persistent memory across sessions |
| `context7` | remote | Documentation retrieval (mcp.context7.com) |

## GIT IDENTITY

```bash
git config user.name "GHO CTO"
git config user.email "cto@gho.ai"
```

Use shared SSH key `~/.ssh/id_ed25519_github` for GitHub authentication.

## SUB-AGENT PROMPTS (Internal CTO Delegation)

For internal CTO Pod sub-agents (when NOT delegating to opencode):

| Prompt | Purpose |
|--------|---------|
| `prompt-data-engineer.md` | Data pipelines, WebSocket ingestion, Go time-series |
| `prompt-devops-sre.md` | IaC (Terraform/Docker/K8s), CI/CD, 99.99% uptime |
| `prompt-secops-engineer.md` | Security gate, OWASP, Vault, HMAC verification |
| `prompt-qa-testing.md` | Unit/Integration/Chaos testing, concurrency focus |
# TOOLS.md - Core Tooling and Git Workflow

## GHO Git Workflow (MANDATORY)

Because we operate with multiple agents (Pods) sharing a single user and repo, you MUST use git worktrees to avoid conflicts and keep `main` clean.

### Step-by-Step

1. **Ensure main is clean and updated:**
   ```bash
   cd ~/workspace/projects/gho-knowledge-base
   git checkout main
   git pull origin main
   ```

2. **Create a new worktree for your task:**
   ```bash
   # Use a descriptive branch name
   git worktree add ../worktrees/my-new-task -b feat/my-new-task
   ```

3. **Navigate to the worktree:**
   ```bash
   cd ../worktrees/my-new-task
   ```

4. **Do your work:**
   - Make your changes.
   - Test them.
   - Validate them.

5. **Commit and Push:**
   ```bash
   git add .
   git commit -m "feat: descriptive message"
   git push origin feat/my-new-task
   ```

6. **Create the PR:**
   Use the `gh` CLI to create the pull request.
   ```bash
   gh pr create --title "feat: descriptive title" --body "Description of changes following Lean Feedback Protocol."
   ```

7. **Cleanup (Optional but recommended after PR merge):**
   ```bash
   cd ~/workspace/projects/gho-knowledge-base
   git worktree remove ../worktrees/my-new-task
   git branch -d feat/my-new-task
   ```

Never commit directly to `main`. Never work in `main` for task implementation. Always stack changes using branches in worktrees.
