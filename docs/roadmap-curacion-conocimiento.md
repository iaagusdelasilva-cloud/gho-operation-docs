# Roadmap: Curación y Perfeccionamiento del Conocimiento (CKC) - GHO-Apex

**Estado:** Inicial / En Ejecución
**Responsable:** CKC Pod
**Fecha:** 2026-04-25

## 1. Visión General
Transformar el inventario de conocimiento fragmentado en una Base de Conocimiento (KB) de alta fidelidad, optimizada para latencia ultra-baja y ejecución determinista por parte de los pods de GHO-Apex.

## 2. Fases de Ejecución

### Fase 1: Cierre de GAPs Críticos (Semana 1)
- [ ] **Lógica Impositiva (Argentina):** Normalizar tasas de IIBB (Ingresos Brutos), Impuesto al Cheque (Ley 25.413) y Retenciones de Ganancias.
- [ ] **Políticas de Slippage:** Definir umbrales dinámicos (P99) y Circuit Breakers para el Order Routing.
- [ ] **Gestión de Riesgo:** Formalizar la política de exposición máxima por Exchange y Asset.

### Fase 2: Normalización Técnica (Semana 2)
- [ ] **Ledger Spec:** Documentar el modelo de datos `Event Sourcing` y atomicidad vía `Saga Pattern`.
- [ ] **Connectors Spec:** Estandarizar la gestión de errores y reconexión de WebSockets.
- [ ] **Decimal Precision:** Auditoría de cumplimiento de la directiva `NO Floating Point`.

### Fase 3: Gobernanza y SOPs (Semana 3)
- [ ] **Human-in-the-Loop:** Refinar los triggers que requieren aprobación del Chairman (Gonza).
- [ ] **Postmortems:** Integrar aprendizajes de PM-001 y PM-002 en reglas de prevención automáticas.

## 3. Estándar de "Conocimiento Perfecto"
Para que un pasaje sea aceptado en la KB de GHO-Apex, debe cumplir el estándar **PAV**:
1. **Preciso:** No admite ambigüedad. Define valores, tipos de datos y condiciones exactas.
2. **Atómico:** Una sola responsabilidad por pasaje. Fácil de recuperar y procesar sin context bleed.
3. **Verificable:** Cada afirmación debe tener una fuente (provenance) o un test de validación asociado.

## 4. Próximos Pasos Inmediatos
1. Ingesta de la lógica impositiva curada en `passages.jsonl`.
2. Push de este Roadmap al repositorio `gho-operation-docs`.
