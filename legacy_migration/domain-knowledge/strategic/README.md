# 🧠 GHO Domain Knowledge

Este repositorio centraliza el conocimiento profundo del dominio de **GHO**: Arbitraje, Liquidez, Reglas de Mercado y Estrategias Financieras.

## 🗺️ Estructura del Conocimiento

| Documento | Descripción | Tipo |
|-----------|-------------|------|
| [**`ddd-strategic-design.md`**](./ddd-strategic-design.md) | Bounded Contexts y Ubiquitous Language de GHO. | Blueprint |
| [**`event-storming-v1.md`**](./event-storming-v1.md) | Flujo de eventos transaccionales (Saga). | Blueprint |
| [**`knowledge-passages.md`**](./knowledge-passages.md) | Fragmentos de conocimiento específico con metadata para IA. | Passages |

## 📐 Lineamientos para "Bajar" el Conocimiento

Para asegurar que el conocimiento sea accionable por agentes de IA y humanos, seguimos estas reglas:

1. **Atomicidad:** Cada pasaje en `knowledge-passages.md` debe tratar un solo concepto (ej: "Cálculo de Spread con IIBB").
2. **Metadata Tagging:** Usar tags `#domain`, `#logic`, `#constraint` para facilitar la búsqueda semántica.
3. **Context-Rich:** No escribir solo la regla, sino el *porqué* (ej: "Evitamos X exchange por su slippage histórico en p99").
4. **Consistency:** Cualquier cambio en la lógica de dominio debe actualizar primero el Blueprint antes que el código.

---
*GHO Domain Knowledge Base v1.0*
