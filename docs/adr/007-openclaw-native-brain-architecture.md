# ADR-007: OpenClaw Native Brain Architecture & File Responsibilities

## Status
Accepted

## Context
We experienced context amnesia and architectural drift because we mixed OpenClaw's native auto-injected files with GHO's custom conceptual files (e.g., `spawn-contract.md`). Agents were failing to understand delegation, escalation, and the Human Gate because critical rules were placed in non-injected files.

## Decision
We align strictly with OpenClaw's native file injection behavior and define exact boundaries for GHO custom files.

### 1. OpenClaw Native Auto-Injected Files
These are injected automatically by the OpenClaw runtime into the system context.
*   **`SOUL.md`**: Core identity, persona, primary directive, and unbreakable guardrails.
*   **`USER.md`**: The hierarchical superior. Establishes the chain of command (e.g., COO -> Gonza; CTO -> COO; Specialist -> CTO).
*   **`AGENTS.md`**: Runtime instructions. ALL delegation logic (`sessions_spawn`), inter-pod communication, escalation protocols, and Human Gate enforcement rules live here.
*   **`MEMORY.md`**: Curated long-term memory (Sprint state, key facts).

### 2. GHO Custom Files (Require Explicit Read via BOOTSTRAP)
*   **`BOOTSTRAP.md`**: The startup checklist enforcing the reading of the files below.
*   **`GLOBAL_CONTEXT.md`**: Root-level culture, WoW, and firm-wide definitions.
*   **`BRAIN.md`**: The master knowledge index mapping to `domain-knowledge/`, `docs/strategy/`, and `docs/adr/`.
*   **`TOOLS.md`**: Operational manuals (e.g., Git Worktree workflow, bash scripts).

## Consequences
*   `spawn-contract.md` is deprecated and deleted. Logic moved to `AGENTS.md`.
*   `USER.md` strictly reflects the chain of command.
*   Agents natively understand how to spawn sub-agents without relying on custom, non-injected files.
*   `BRAIN.md` is expanded to cover all domain knowledge, not just ADRs.
