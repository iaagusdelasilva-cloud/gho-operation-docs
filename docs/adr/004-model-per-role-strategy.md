# ADR-004: GHO Cognitive Classification (Dynamic Model Selection)

**Status:** ACCEPTED
**Author:** CFO (FinOps Pod)
**Context:** GHO operates with a variety of LLMs. Relying on a single default or static Tier-based assignment is inefficient. C-Level Pod Leaders require a clear classification system to choose the best-fit model for their sub-agents based on the specific nature of each task.

## 🎭 The Strategy: Task-Based Classification

Instead of assigning models to *roles*, we classify models by *capabilities*. The system default is `google/gemini-3-flash-preview`.

### 1. 🧠 Reasoning Models (Deep Logic & Problem Solving)
*   **Target Tasks:** Complex debugging, financial strategy, legal/compliance auditing, new architecture design (ADR/RFC creation).
*   **Models:** `deepseek-reasoner`, `openai/o1`, `openai/o3-mini`.
*   **Criterio:** Usar cuando la tarea requiere múltiples pasos de reflexión interna antes de actuar.

### 2. ⚡ Performance Models (Instruction Following & Speed)
*   **Target Tasks:** Orchestration (routing), detailed reporting, standard coding tasks, data normalization.
*   **Models:** `claude-3.7` (High-end), `gemini-flash` (System Default), `gpt-4o`.
*   **Criterio:** Usar para la mayoría de las tareas de Pod Leaders donde la precisión del seguimiento de instrucciones es clave.

### 3. 📉 Simple / Utility Models (Formatting & Low Stakes)
*   **Target Tasks:** JSON formatting, text cleanup, audit logs, routine documentation updates.
*   **Models:** `claude-haiku`, `deepseek-chat`, `gemma-local` (Ollama).
*   **Criterio:** Usar para sub-agentes con tareas atómicas de baja complejidad para maximizar el ROI.

## 🔄 The Initialization Ritual
When a Pod Leader spawns a sub-agent, they must:
1.  **Analyze the Task Complexity:** (Reasoning vs. Performance vs. Simple).
2.  **Select the Model:** Use the classification above to override the default if necessary.
3.  **Document Choice:** Brief mention in the Sprint Log if it deviates from the `gemini-flash` default for high-cost reasons.

## 📈 Role of the CFO (Audit)
The CFO Pod will review these choices periodically to verify that the classification is being applied correctly and to adjust the list of available models based on performance/cost evidence.
