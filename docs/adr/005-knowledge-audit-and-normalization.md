# ADR-005: Knowledge Audit & Normalization Protocol

**Status:** ACCEPTED
**Author:** CoS (Governance Pod)
**Date:** 2026-04-06
**Context:** Post Sprint 1, the CoS and CFO detected broken links in `domain-knowledge/strategic/blueprint.md` and structural inconsistencies between domain knowledge directories. A formal normalization protocol is required to prevent knowledge decay.

## 🔍 Audit Findings (Sprint 1)

- `blueprint.md` references to `ddd-strategic-design.md` and `event-storming-v1.md` were broken (files live in `docs/analysis/`, not in `domain-knowledge/strategic/`).
- `knowledge-passages.psv` reference in `blueprint.md` was wrong (actual file: `passages.psv`).
- Links to `docs/adr-protocol.md` and `docs/culture-stack.md` were broken (files live in `docs/strategy/`).
- ADR-004 was left in `PROPOSED` status after CEO approval.

## ✅ Immediate Remediation (Applied)

- [x] Fixed all broken links in `domain-knowledge/strategic/blueprint.md`.
- [x] ADR-004 promoted to `ACCEPTED`.
- [x] Sprint Retrospective template updated to include Technical Debt review section.

## 📐 Normalization Protocol (Ongoing)

Each folder in `domain-knowledge/` MUST contain exactly:
- `blueprint.md` — high-level domain map and flows.
- `passages.psv` — atomic knowledge fragments in PSV format.
- `README.md` — summary of the sub-domain scope.

**Link Validation Rule:** All internal links in `blueprint.md` must be verified against actual file paths before any PR merge. CI integration is a pending Sprint 2 task.

## 🔄 Technical Debt (Sprint 2 Backlog)

- [ ] CI/CD GitHub Action to validate internal link integrity on every commit to `main`.
- [ ] Periodic audit script (`gho-audit-adr.sh`) to detect `PROPOSED` ADRs older than 1 sprint.

---
*Firma: GHO CoS & CFO*
