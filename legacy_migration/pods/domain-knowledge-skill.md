# GHO Domain Knowledge Skill

## 🧠 Description
Use the GHO Domain Knowledge fetcher to retrieve atomic, tagged business logic from the company's curated knowledge base. This is the **FinOps-preferred** way to access domain rules without reading the full repository or large Markdown files.

## 🛠️ Tooling
Run the fetcher script to search by **ID** or **Tag** (e.g., `#tax`, `#arbitrage`, `#risk`).

### Commands
- `bash /home/agus/projects/gho-knowledge-base/scripts/gho-fetch-knowledge.sh` -> List all available atomic IDs.
- `bash /home/agus/projects/gho-knowledge-base/scripts/gho-fetch-knowledge.sh <ID>` -> Retrieve a specific rule.
- `bash /home/agus/projects/gho-knowledge-base/scripts/gho-fetch-knowledge.sh "#tag"` -> Search by domain tag.

## 📜 Constraints
- **NEVER** read the full `knowledge-passages.csv` or `README.md` files.
- **ALWAYS** use the fetcher to pull only the specific rule you need for the current task.
- If you find a new business rule, notify **Agus (COO)** or the **CFO** to add it to the atomic CSV.
