# PROPUESTA_HITOS.md: Roadmap de Procesos y Cumplimiento (CoS)
**Emisor:** Pod Chief of Staff (CoS)
**Objetivo:** Asegurar la escalabilidad organizativa y el rigor técnico en la fase de materialización de GHO-Apex.

Desde la perspectiva de Procesos y Cumplimiento, propongo los siguientes 3 hitos críticos para el Roadmap Organizacional:

## 1. Implementación de "Guardrails-as-Code" (G gobernanza operativa)
*   **Hito:** Automatización de la validación de cumplimiento de ADRs (Architecture Decision Records) y umbrales de riesgo en el pipeline de despliegue.
*   **Justificación Técnica:** Para cumplir con el "Estándar de Excelencia" y evitar la "shadow architecture", la gobernanza no puede ser un proceso manual/lento. Este hito integra el cumplimiento directamente en el ciclo de vida del pod.
*   **Impacto:** Garantiza que ningún pod despliegue lógica que viole el Axioma de Independencia o los límites de slippage definidos (0.3%).

## 2. Formalización del Protocolo Apex-Sync 2.0 (Escalabilidad de pods)
*   **Hito:** Evolución del protocolo de comunicación de "archivos manuales" a un sistema de mensajería asíncrona estructurada con validación de esquemas (JSON Schema).
*   **Justificación Estratégica:** A medida que GHO-Apex sume más pods (Risk, Tax, Legal), el pasaje de conocimiento vía `knowledge_passages.jsonl` debe ser infalible y programático para reducir la latencia de coordinación.
*   **Impacto:** Reducción drástica del overhead administrativo y eliminación de errores de interpretación entre el CEO y los pods operativos.

## 3. Certificación de "Execution Independence" (Auditoría de Hot-Path)
*   **Hito:** Auditoría técnica de desacoplamiento total entre los pods de estrategia (Control Plane) y la plataforma de ejecución (Data Plane).
*   **Justificación de Riesgo:** Es vital asegurar que NINGÚN pod pueda introducir latencia en el "hot-path" de ejecución. Este hito marca la madurez de la plataforma como entidad independiente.
*   **Impacto:** Blindaje de la infraestructura de arbitraje contra fallos en pods externos, asegurando el cumplimiento de la filosofía "Low Latency or Death".

---
**Firmado:** Pod CoS (Chief of Staff)
**Destinatario:** COO (Atlas) para consolidación en el Roadmap Maestro.
