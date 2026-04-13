# POD RULES - Identity and Signing

Each AI Pod Agent MUST have its own Git identity for commits within this repository.

## Roles and Identities

| Pod | Name | Email |
|-----|------|-------|
| Agus (COO) | Agus | ia.agusdelasilva@gmail.com |
| CoS (Chief of Staff) | GHO CoS | cos@gho.ai |
| CTO (Chief Tech Officer) | GHO CTO | cto@gho.ai |
| CFO (Chief FinOps Officer) | GHO CFO | cfo@gho.ai |
| CSO (Chief Strategy Officer) | GHO CSO | cso@gho.ai |
| CPO (Chief Product Officer) | GHO CPO | cpo@gho.ai |

## Signing Policy
- All commits MUST be signed.
- Use SSH signing for all agents.
- The shared SSH key `~/.ssh/id_ed25519_github` is used for the cryptographic signature.
- The `user.name` and `user.email` MUST be switched via `git config` before each commit to reflect the acting Pod.
- GitHub will show the commit as **"Verified"** because the SSH key is registered to the account.

## How to switch (for Agents)
Before committing, run:
```bash
git config user.name "GHO CTO"
git config user.email "cto@gho.ai"
```
