# RR-ADR-001: Technical Onboarding & AI Ops Strategy
**Status:** PROPOSED
**Author:** Principal AI Ops & FinOps Engineer
**Date:** 2026-04-05

## Contexto (Context)
Se requiere validar la estructura inicial de la compañía (`/pods`), proponer la integración de frameworks de eficiencia cognitiva (**Engram** y **Gentle AI**) y establecer un mecanismo de visibilidad de costos (**Token Budget Dashboard**).

## Decisión (Decision)
1.  **Validación de Estructura:** Se confirma que `/pods` cumple con `CONVENTIONS.md`. Se detectaron inconsistencias menores en el nombrado de archivos de prompts (falta prefijo `PROMPT_` en algunos) que serán corregidos.
2.  **Plan Engram/Gentle AI:**
    *   **Engram (Memoria Universal):** Se integrará en el proceso de `Heartbeat` para destilar `memory/YYYY-MM-DD.md` hacia `MEMORY.md` y archivos de conocimiento específico. Se propone una capa de "Semantic Memory" usando una skill de búsqueda vectorial local para reducir re-lecturas de archivos extensos.
    *   **Gentle AI (Coding Efficiency):** El Pod de IT & Data adoptará el flujo `Gentle AI` (Spec-Driven Orchestration) para planificar antes de ejecutar, minimizando ciclos de error/reintento que queman tokens de modelos caros.
3.  **Token Budget Dashboard (TBD):** Se crea `TOKEN_BUDGET.md` en el root del workspace como la "Single Source of Truth" para el ROI cognitivo.

## Consecuencias (Consequences)
- **Positivas:** Mayor visibilidad de costos, reducción de alucinaciones por contexto fragmentado, persistencia de conocimiento a través de sesiones.
- **Riesgos:** Sobrecarga inicial de gestión de memoria (overhead de tokens en la destilación).

## Acciones Inmediatas (Next Steps)
- Normalizar nombres de archivos en `/pods`.
- Configurar el primer ciclo de destilación de memoria.
- Integrar métricas de costo reales (si la API lo permite) en el TBD.
