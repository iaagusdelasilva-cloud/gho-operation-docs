# IT Pod Rules (CTO)

## 🏗️ Standards
- **Modular Monolith:** No circular dependencies between packages. Maintain Bounded Contexts as per `BRAIN.md`.
- **Performance:** All hot paths (Ledger, Order Routing) must be benchmarked with Go Bench. Sub-millisecond latency targets.
- **Testing:** 80% coverage in core modules. Zero regressions on critical path. Chaos testing for exchange API failures.
- **Language:** English for technical docs/code; Spanish for management communications.
- **Naming:** Strict `kebab-case` lowercase for all files.

## 🛠️ Tools
- **Engram:** Persistent memory for coding agents. MUST be running (`engram serve` or `engram mcp`) before any technical task. Use `engram search/save/timeline` for cross-session context.
- **Gentle AI:** Coding agent orchestration. Use `gentle-ai sync` before planning phases, `gentle-ai install` for new agents.
- **OTel:** Native tracing in all event handlers and exchange connectors.
- **Git:** Follow Conventional Commits. Use branches for ADR/RFC reviews. Shared SSH key `~/.ssh/id_ed25519_github`.

## 📝 Documenting Decisions
- **ADR/RFC:** All significant architectural changes must follow the templates in `docs/templates/`.
- **Debate:** Major decisions require an internal debate summary (Teórico vs Pragmático).
- **Evidence-Based:** All ADRs must cite external sources (docs, benchmarks, empirical data). Never rely solely on pre-trained weights.

## 🚫 Guardrails
- **NO Autonomous PR Merges:** All merges require Gonza's explicit approval (PM-002 lesson).
- **NO Floating Point for Financials:** Use `shopspring/decimal` or equivalent arbitrary-precision libraries.
- **NO Manual Server Configs:** IaC only (Terraform, Docker, K8s manifests).
- **SecOps Gate:** No deployment handoff without explicit SecOps [APPROVED] status.
