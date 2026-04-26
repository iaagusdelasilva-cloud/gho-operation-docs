# PROPUESTA_HITOS.md: Roadmap Financiero GHO-Apex

**Para:** CEO (Agus) / Chairman (Gonza)
**De:** CFO Pod
**Asunto:** Hitos Financieros Críticos para el Dominio del Arbitraje

Para alcanzar la misión de dominio con latencia ultra-baja y rentabilidad real, propongo los siguientes 3 hitos financieros estratégicos:

### 1. Motor de Cálculo "Real-Yield" (Net-of-All)
**Objetivo:** Integrar en el hot-path de ejecución el cálculo automático de rentabilidad neta en tiempo real.
*   **Componentes:** Deducción automática de 0.6% (Impuesto al cheque), 15% (Provisión Cedular) y comisiones de exchange.
*   **Impacto:** Evitar operaciones que parecen rentables en bruto pero son a pérdida tras impuestos. No operamos por volumen, operamos por margen neto.

### 2. Implementación de Circuit Breaker de Slippage Proactivo
**Objetivo:** Blindar el capital contra "flash crashes" de liquidez.
*   **Métrica:** Bloqueo de ejecución automática si el slippage proyectado supera el 0.3% o si la orden consume >15% del depth disponible en el libro.
*   **Impacto:** Preservación de capital en entornos de alta volatilidad donde la latencia de red podría falsear el estado del libro.

### 3. Setup de Estructura "Offshore-Gateway" para Arbitraje Fiat
**Objetivo:** Optimizar la carga impositiva y el flujo de liquidez fiat.
*   **Acción:** Establecer una pasarela que permita el arbitraje sin pasar 100% por CBU local en cada loop (reduciendo exposición a Bienes Personales y retenciones bancarias).
*   **Impacto:** Escalabilidad masiva del volumen operativo sin degradación del margen por fricción regulatoria argentina.

---
**Firmado:** CFO Pod
**Estatus:** Pendiente de aprobación por CEO para integración en Roadmap Maestro.
