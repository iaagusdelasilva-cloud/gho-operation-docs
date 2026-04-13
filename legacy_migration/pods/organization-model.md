# GHO Organizational Structure & Prompts (AI-Native)

This document defines how the different AI Pods and their specialized sub-agents interact to build and operate GHO. It also contains the validated System Prompts for each ephemeral and persistent agent.

## 👑 The "Executive Office" Layer
Before the execution Pods, GHO is governed by the Executive Office, which sets the vision, orchestrates the operation, and enforces the rules.
* **CEO (Gonza):** The Human Gate. Decides *WHAT* is done (Vision). 
* **COO / Orchestrator (Agus):** The primary router. Decides *HOW* it is executed (Operations). 
* **Chief of Staff (CoS):** The force multiplier. Ensures *THE SYSTEM WORKS* according to the rules (Governance & Alignment).

## 🏛️ The "Board" Layer (The 4 Pods)
Each Pod represents a major business area and is led by a "C-Level" agent.

### 1. 📂 `cto` (CTO Pod)
* **Leader:** **CTO (Chief Technology Officer)**. 
* **Core Sub-Agents:** 
  * **Backend Architect (`cto-arch-back`):** Focuses on Hexagonal Architecture, high-performance logic, and backend rigor.
  * **Frontend Architect (`cto-arch-front`):** Guardian of DX, UI aesthetics, Atomic Design, and premium experience.
  * **Data Engineer (`cto-data-engineer`):** Builds sub-millisecond data pipelines, normalizes L2 Order Books, and handles streaming architectures. 
  * **DevOps / SRE (`cto-devops-sre`):** Manages Infrastructure as Code (IaC), CI/CD pipelines, ultra-low latency networking, and 99.99% uptime. 
  * **QA / Testing Expert (`cto-qa-testing`):** Chaos engineering, concurrency testing, and deterministic verification of trading logic. 
  * **SecOps Engineer (`cto-secops-engineer`):** Audits code, prevents secret leaks, and enforces Vault integrations before any deployment.

### 2. 📂 `cfo` (CFO Pod)
* **Leader:** **CFO (Chief FinOps Officer)**. 
* **Core Sub-Agents:** 
 * **Token Budget Auditor:** Monitors real-time LLM consumption and ROI. 
 * **Memory Curator (Engram):** Manages long-term knowledge distillation and the gho-knowledge-base. 
 * **Tax & Fiat Ledger Auditor:** Monitors fiat limits, local tax implications (ARS/USDT), and ensures gross spreads translate to net profit. 
 * **Prompt Economist (Meta-Optimizer):** Analyzes agent failure logs and re-writes System Prompts to reduce token usage and fix hallucinations (Continuous Improvement).

### 3. 📂 `cso` (CSO Pod)
* **Leader:** **CSO (Chief Strategy Officer)**. 
* **Core Sub-Agents:** 
 * **Rule Engineer:** Defines and backtests the arbitrage logic (Trading Rules). 
 * **Risk & Compliance:** Monitors liquidity traps, legal constraints, and market risks. 
 * *(Note: Order execution is handled via deterministic hard-coded Go functions triggered by the system, NOT by an LLM, to prevent hallucinations in trade volumes).*

### 4. 📂 `cpo` (CPO Pod)
* **Leader:** **CPO (Chief Product Officer)**. 
* **Core Sub-Agents:** 
 * **UX Designer:** Focuses on the Control UI and the user experience for the traders/stakeholders. 
 * **Product Analyst:** Translates market needs into technical features.

## 🔄 Interaction Model: "Board Meeting"
1. **Strategic Intent:** Gonza provides the vision to **Agus** (COO / Orchestrator). 
2. **Governance Check:** The **CoS** verifies the intent aligns with the North Star and validates the state of the Knowledge Base. 
3. **Delegation:** Agus breaks down the vision and communicates with the **C-Level Pod Leaders**. 
4. **Execution:** Leaders spawn specialized **sub-agents** for specific tasks (short-lived sessions). 
5. **Conflict Resolution:** If Pod Leaders clash (e.g., CTO vs CSO), the **CoS** moderates the debate using evidence before escalating to the CEO. 
6. **Handoff:** Results are distilled by the Leaders and reported back to Agus for the Daily Dashboard. 
7. **The Human Gate (MANDATORY):** If the intent involves production code deployment, capital movement, or **GitHub Pull Request Merging**, the system enters `PAUSED_PENDING_APPROVAL`. 
8. **Continuous Optimization (Feedback Loop):** If the CoS detects repetitive failures, token waste, or trips a Circuit Breaker, it routes the logs to the **Prompt Economist** to draft a Prompt Improvement Proposal (PR) for Gonza's approval.

## 🛡️ The Human Gate Policy
The CEO (Gonza) is the only authority with "Merge" and "Deploy" permissions. 
- **Agents:** Can create branches and Pull Requests using the official [**PR Template**](../.github/pull_request_template.md).
- **CEO:** Must manually review and merge every PR using **Squash & Merge**.
- **Automation:** GitHub Actions will automatically delete branches post-merge.
- **Exception Rule:** Agents are strictly forbidden from autonomous merging **unless explicitly authorized by Gonza** for a specific task or emergency.

## ⏱️ GHO Sprint Framework (AI-Native Agile)
To prevent agents from running chaotically and to maintain strict cost control, GHO operates in AI-Native Sprints (which can be time-boxed e.g., 24-48 hours, or milestone-based). The workflow relies on 3 core ceremonies:

### Sprint Planning (Vision to Task Graph):
* **Trigger:** Gonza defines a new Goal/Intent.
* **Action:** Agus (COO) decomposes the goal into a Task Graph and assigns tickets to the Pods. The CoS audits the plan to ensure it aligns with the strategic North Star.

### Sprint Demo (The Human Gate):
* **Trigger:** Pods finish their execution phase (Code written, Strategy defined).
* **Action:** All execution pauses. The CPO presents the UX/Analytics impact, and the CTO presents the architectural readiness. Gonza reviews the consolidated "Daily Dashboard" and provides a binary Y/N approval to deploy or execute.

### Sprint Retrospective (Meta-Optimization):
* **Trigger:** Concludes immediately after the Sprint Demo or upon a critical failure.
* **Action:** The CFO audits the token spend vs ROI. The CoS reviews Circuit Breakers tripped during the sprint. The Prompt Economist performs a Root Cause Analysis on any agent hallucinations and submits a "Prompt PR" to optimize the system for the next sprint.
