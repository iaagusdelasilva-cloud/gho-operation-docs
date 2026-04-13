# ADR 003: Herramientas y Flujo de Documentación de Dominio (DDD & Event Storming)

**Estado:** PROPOSED (Awaiting CEO Approval)
**Fecha:** 2026-04-05
**Autores:** CTO, CFO, CPO (Auditado por CoS)

## 1. Contexto
GHO requiere una herramienta estandarizada para documentar el dominio del problema (Event Storming, Context Mapping, Strategic Design) que sea altamente legible para el "Human Gate" (CEO) y eficiente para la generación autónoma por parte de agentes LLM. El "GHO Way of Working" exige rigurosidad científica y triangulación de perfiles.

## 2. Triangulación y Evaluación de Alternativas
El Board debatió las siguientes herramientas basadas en investigación de estado del arte en `text-to-diagram`:

- **Excalidraw (Visual/JSON):** 
  - *CTO (Pragmático):* "Archivos JSON masivos. Los LLM alucinan la sintaxis fácilmente."
  - *CFO (FinOps):* "Generar un diagrama quema más de 5,000 tokens en prompt output. VETADO."
- **Structurizr / PlantUML (Académico):**
  - *CTO (Architect):* "PlantUML es excelente para DDD y diagramas de secuencia."
  - *CPO (Product):* "Requiere un servidor Java externo para renderizar. Si Gonza abre el repo en GitHub, va a ver código, no el gráfico. Mucha fricción."
- **D2 (Modern Text-to-Diagram):**
  - *CTO (Pragmático):* "Sintaxis súper limpia, mejor que Mermaid para layouts complejos."
  - *CPO (Product):* "Aún no está renderizado nativamente por default en GitHub Markdown sin actions extra. Introduce fricción."
- **Mermaid.js (Native Markdown):**
  - *CTO (Pragmático):* "Sintaxis declarativa ligera. Los LLMs saben escribirlo muy bien."
  - *CFO (FinOps):* "Consume menos de 200 tokens por diagrama."
  - *CPO (Product):* "Renderiza 100% out-of-the-box en GitHub y VSCode. Zero clics para el CEO."

## 3. Decisión (Propuesta)
Se adopta **Mermaid.js** incrustado en archivos **Markdown** como el estándar único para diagramas de arquitectura, Event Storming y flujos de negocio de GHO.

## 4. Flujo de Trabajo y UX (Workflow)
1. **Ubicación:** Los documentos de análisis (ej. `event-storming-v2.md`) residirán exclusivamente en la carpeta `docs/analysis/`.
2. **Estructura del Archivo (CPO Spec):**
   - Un bloque de código ````mermaid```` con el diagrama renderizable.
   - Una sección de "Executive Summary" (bullet points) traduciendo la complejidad del gráfico a impacto de negocio.
   - Si el diagrama involucra una regla estricta, debe enlazar a los IDs en `domain-knowledge/strategic/passages.psv`.

## 5. Criterios de Aceptación (FinOps & UX)
- **Token Impact:** Reducción drástica de tokens vs payloads JSON o XML. Máximo ROI cognitivo.
- **UX Impact:** Renderizado instantáneo en GitHub para la revisión del CEO. Zero fricción cognitiva.
- **Compliance:** Cumple con la directiva "Scientific Method" (evaluación de alternativas) y "Zero-Waste" de GHO.
