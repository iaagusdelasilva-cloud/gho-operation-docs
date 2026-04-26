# Inventario Maestro de Conocimiento - GHO-Apex

**Fecha de Generación:** 2026-04-25
**Estado:** Auditado y Consolidado
**Fuente de Verdad (SSOT):** KB-Runtime + `gho-operation-docs`

---

## 1. Mapeo de Pasajes de la Knowledge Base (KB)
Se han auditado los 19 pasajes fundamentales que componen el núcleo de la inteligencia operativa y cultural de la organización.

| ID | Dominio | Resumen del Contenido |
| :--- | :--- | :--- |
| `scientific-method-steps` | Cultura | Proceso de 5 pasos (Hipótesis -> Evidencia) para toda decisión. |
| `human-gate-risk-actions` | Gobernanza | Acciones críticas requieren aprobación manual del Chairman (Gonza). |
| `lean-feedback-protocol-header`| Comunicación | Protocolo [FINDINGS]/[ACTION ITEMS]. Cero saludos/relleno. |
| `zero-tolerance-repetition` | Cultura | Regla de la 3ra ejecución: si se hace 2 veces, se automatiza. |
| `triangulation-peer-review` | Cultura | Ninguna decisión se aprueba sin debate de expertos opuestos. |
| `cos-governance-audit` | Gobernanza | El CoS audita que cada agente opere en su área sin context bleed. |
| `naming-convention-kebab` | IT | Todos los archivos deben usar estrictamente `kebab-case` lowercase. |
| `mermaid-diagram-standard` | IT | Mermaid.js como estándar único para diagramas en Markdown. |
| `model-selection-strategy` | IT | Selección dinámica de modelos (Reasoning vs Performance vs Utility). |
| `domain-knowledge-normalization`| Knowledge | Estructura obligatoria: blueprint.md, passages.psv, README.md. |
| `automation-first-rule` | IT | Protocolo GHO-Guard para automatización basada en ROI de tokens. |
| `openclaw-file-responsibilities`| Infraestructura| Respeto a la inyección nativa (SOUL, USER, AGENTS, MEMORY). |
| `event-sourcing-ledger-resilience`| IT | Uso de Event Sourcing para resiliencia y auditabilidad del Ledger. |
| `saga-pattern-atomicity` | IT | Implementación de Saga Pattern para atomicidad en la ejecución. |
| `modular-monolith-latency` | IT | Arquitectura de Monolito Modular para minimizar latencia in-memory. |
| `it-strategic-tactical-split` | Knowledge | Separación estricta entre reglas de negocio y detalles técnicos. |
| `agent-sandbox-location` | Infraestructura| Aislamiento de agentes en directorios `/workspace/<agent-id>`. |
| `sandbox-symlink-setup` | Infraestructura| Responsabilidad del COO de hidratar sandboxes vía scripts. |
| `gho-adr-002-go-choice` | Arquitectura | Elección de Go para conectores y Ledger por latencia determinista. |

---

## 2. Inventario de Documentación Estratégica

### 📂 `docs/` (Repositorio Activo)
- **`gho-way-of-working.md`**: El "Norte" de la organización. Define cultura, alma y protocolos.
- **`architecture-axioms.md`**: Principios de diseño (Independencia de ejecución, latencia).
- **`adr/`**: Registro de Decisiones Arquitectónicas (001-007).
  - `001-onboarding-strategy.md`
  - `002-stack-ledger-connectors.md` (Go Choice)
  - `003-domain-documentation-tooling.md` (Mermaid/Markdown)
  - `004-model-per-role-strategy.md` (Task-based models)
  - `005-knowledge-audit-and-normalization.md` (KB Structure)
  - `006-automation-first-protocol.md` (GHO-Guard)
  - `007-openclaw-native-brain-architecture.md` (Brain Sync)
- **`strategy/`**: `adr-protocol.md`, `culture-stack.md`, `agent-sandbox-architecture.md`.
- **`postmortem/`**: `PM-001` (Alucinación), `PM-002` (Falla de Gobernanza en PRs).
- **`templates/`**: Estándares para ADR, RFC, Postmortem, DEA y Sprints.

### 📂 `legacy_migration/` (Patrimonio Intelectual)
- **`domain-knowledge/`**: Lógica de negocio cruda y normalizada.
- **`pods/`**: Definiciones históricas de CFO, COO, CoS, CTO (incluyendo roles específicos como `prompt-economist`).
- **`scripts/`**: Caja de herramientas operativa (`gho-scaffold`, `gho-setup-sandboxes`, `gho-audit-adr`).
- **`src/ckc/`**: Pipeline de procesamiento de conocimiento (`distiller.py`, `batcher.py`).

---

## 3. Mapeo de GAPs en Lógica de Negocio
Auditoría de archivos críticos con lógica pendiente de migración o consolidación:

### A. Fricción Impositiva (Argentina)
- **Ubicación:** `legacy_migration/domain-knowledge/strategic/passages.psv`
- **ID:** `spread-calculation-friction`
- **GAP:** La lógica de cálculo de IIBB, Impuesto al Cheque y Retención de Ganancias está descrita pero no implementada como una función determinista en los conectores de Go.

### B. Riesgo de Slippage y Liquidez
- **Ubicación:** `legacy_migration/domain-knowledge/strategic/passages.psv`
- **ID:** `exchange-slippage-p99`
- **GAP:** El umbral del 15% del depth y 0.3% de slippage es una directriz. Falta validación en tiempo real (Circuit Breaker) en el `Order Routing`.

### C. Precisión Financiera (Anti-Floating Point)
- **Ubicación:** `legacy_migration/pods/cto/rules.md`
- **Directiva:** `NO Floating Point for Financials`
- **GAP:** Auditoría pendiente en el código fuente para asegurar el uso exclusivo de `shopspring/decimal`.

### D. Reconexión de WebSockets
- **Ubicación:** `legacy_migration/domain-knowledge/strategic/passages.psv`
- **ID:** `websocket-reconnection-policy`
- **GAP:** Falta el monitoreo del Pod AI Ops tras 3 intentos fallidos (actualmente es un log local).

---
**Generado por:** CKC Pod (Subagente)
**Estado del Commit:** Pendiente de Push al Repositorio Central.