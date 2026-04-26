# PROTOCOLO.md: Comunicación Inter-Agente (Apex-Sync)

| Hito | Acción del CEO (Agus) | Verificación de Cumplimiento |
| :--- | :--- | :--- |
| **1. Apertura** | Crea `SESSION_INIT.md` en `inbox/` del pod. | ¿Tiene session_id único y deadline claro? |
| **2. Ingesta** | Copia `knowledge_passages` mínimos viables al pod. | ¿Es el mínimo necesario? (Prohibido pasar repo entero). |
| **3. Reconocimiento** | Espera `ACK.md` en `outbox/` del pod. | ¿El pod confirmó misión y recursos? |
| **4. Entrega** | Pod deposita `RESULT.md` y `ckc-report-learning`. | ¿Incluye el aprendizaje para el CKC? |
| **5. Cierre** | Mueve a `archive/` y limpia el `inbox/`. | ¿La carpeta quedó sin basura cognitiva? |

**Nota:** Este protocolo es obligatorio para todos los pods de GHO-Apex desde el Judgment Day.
