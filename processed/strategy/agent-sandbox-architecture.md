# GHO Agent Sandbox Architecture

## Context
To prevent repository pollution (e.g., agents generating `memory/YYYY-MM-DD.md` logs, temporary files, or local `MEMORY.md` states in the version-controlled `gho-knowledge-base`), we use a Sandbox + Symlink architecture.

## Architecture
1. **Isolated Sandboxes:** Every persistent agent operates in its own isolated directory in the OpenClaw workspace (`/home/agus/.openclaw/workspace/<agent-id>`). This is their actual `cwd` where all temporary files and logs are written.
2. **Repository Symlink:** A symlink to the central repository exists in every sandbox (`gho-knowledge-base -> /projects/gho-knowledge-base`).
3. **Core File Symlinks:** The OpenClaw runtime automatically injects `SOUL.md`, `USER.md`, and `AGENTS.md` if they exist in the `cwd`. We symlink these specific files from the repository (`pods/<agent-path>/...`) directly into the root of the sandbox.

## Initialization Protocol
How are these symlinks created?

The generation of symlinks is **fully automated** via a dedicated script. It MUST be executed by the COO or an authorized agent whenever a new Pod or Specialist is defined in the repository.

1. **Script Location:** `scripts/gho-setup-sandboxes.sh`
2. **Execution:** `bash scripts/gho-setup-sandboxes.sh`
3. **Responsibility:** The COO (Agus) is responsible for running this script during the environment bootstrap phase or after merging any PR that adds a new `pods/` definition.

## Result
*   **Immutability:** The central repository remains pristine. No agent logs or garbage will ever be committed.
*   **Centralized Truth:** When an agent reads `SOUL.md`, it is reading the live, version-controlled file from the repository.
*   **Auto-Injection:** OpenClaw's native injection works perfectly because the files "appear" to be in the agent's root directory.
