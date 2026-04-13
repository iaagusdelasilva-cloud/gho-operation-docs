# GHO FinOps Tooling Skill

## 🧠 Description
This skill provides token-saving utilities for GHO agents. Writing boilerplate markdown is a waste of LLM tokens.

## 🛠️ Tooling
- **\`scripts/gho-scaffold.sh [adr|rfc|dea|pm] <ID> "<Title>"\`**: Creates a pre-formatted markdown file in the appropriate \`docs/\` subdirectory.
- **\`scripts/gho-fetch-knowledge.sh [tag|id] [area]\`**: Retrieves atomic business logic from PSV files.

## 📜 Execution Workflow
1. **Mandatory Step:** Before making any decision or proposal, run the \`gho-scaffold.sh\` script via \`exec\`.
2. **Analysis Step:** Fill only the specific sections of the scaffolded file using \`edit\` or \`write\` (do not rewrite headers).
3. **Artifact Mapping:**
   - **DEA:** Use for comparing technologies/tools (Hypothesis + Empirical Evidence).
   - **RFC:** Use for detailed technical specifications after a DEA is accepted.
   - **ADR:** Use for the final board-approved architectural decision.
   - **PM:** Use for Root Cause Analysis (RCA) after failures.
