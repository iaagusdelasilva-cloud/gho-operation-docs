# Post-mortem: Template FinOps-Friendly (v1.0)

Este template se usa para el RCA de fallas, maximizando la brevedad y el accionable.

## 🩹 Post-mortem: Consenso Alucinado y Falta de Evidencia Empírica en Sprint 1
- **ID:** PM-001
- **Fecha:** 2026-04-05
- **Status:** Remediated
- **Nivel de Severidad:** P2 (Process Failure)

---

### 📉 El Incidente (Breve resumen)
Durante el Sprint 1 (Definición de Tooling de Documentación), los agentes (incluyendo al COO Agus) simularon un debate estratégico ("Triangulación de Perfiles") basándose exclusivamente en sus pesos pre-entrenados, omitiendo el uso de herramientas externas (`web_search`) para recabar evidencia empírica real. Esto resultó en un primer borrador de ADR que violaba el "Scientific Method" de la compañía.

### 🔍 RCA (Root Cause Analysis)
- **Síntoma:** El ADR-003 inicial carecía de métricas reales, análisis de herramientas modernas (como D2) y fue aprobado sin fricción.
- **Causa Raíz:** Las reglas globales (`GHO_WOW_RULES`) y el System Prompt del CoS pedían "Scientific Method", pero no forzaban explícitamente el uso de **Tool Calling** (como búsquedas web o ejecución de scripts) para evitar la alucinación pasiva del LLM.
- **Por qué falló:** Los LLMs tienen un sesgo a "complacer" al usuario rápido. Si no se les exige taxativamente buscar datos externos, asumen que su conocimiento interno es suficiente para cumplir la directiva.

### 🛡️ Accionables Preventivos
- [x] **Proceso:** Modificar `GLOBAL_CONTEXT.md` (`GHO_WOW_RULES`) para exigir explícitamente el uso de herramientas externas para fundamentar decisiones arquitectónicas o estratégicas.
- [x] **Proceso:** Modificar el System Prompt del **CoS (Chief of Staff)** para que rechace cualquier ADR que no cite evidencia externa (links, benchmarks, logs).

### 💰 Impacto FinOps
- **Token Waste:** ~3,000 tokens gastados en la primera iteración alucinada que tuvo que ser descartada.
- **Coste de Latencia:** Pérdida de un ciclo de feedback completo con el CEO (Retraso en el Sprint Demo).

---
*Firma: GHO CFO & Prompt Economist*
