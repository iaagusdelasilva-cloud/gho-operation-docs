# RFC: Stack Tecnológico para Ledger In-Memory y Exchange Connectors

## 🎭 El Debate Interno

### 🎓 El Arquitecto (Académico/Teórico)
**Postura: Java (GraalVM / Project Loom)**
- **Argumentos:**
    - **Ecosistema:** Java posee las librerías más maduras para conectores financieros (QuickFIX/J, XChange, etc.).
    - **Concurrencia:** Project Loom (Virtual Threads) permite un modelo de programación simple con escalabilidad masiva para miles de conexiones concurrentes sin la complejidad de WebFlux.
    - **Memoria:** El modelo de memoria de Java es robusto y GraalVM permite compilación nativa para reducir el cold start y el footprint.
    - **Observabilidad:** El soporte de OpenTelemetry en el ecosistema Java es el estándar de oro.
- **Riesgos:** Garbage Collection (GC) pauses si no se tunea correctamente (ZGC/Shenandoah). Mayor consumo de RAM inicial.

### 🛠️ El Senior Manager / SRE (Pragmático/Práctico)
**Postura: Go (Golang)**
- **Argumentos:**
    - **Latencia:** Control más granular de la memoria y el GC. Los tiempos de respuesta son más predecibles en el "p99" sin un tuning complejo.
    - **Simplicidad:** Curva de aprendizaje corta para nuevos agentes. El binario estático es ideal para despliegues rápidos y ligeros.
    - **Concurrencia Nativa:** Goroutines y Channels están diseñados para el tipo de flujo de datos de los exchanges (streaming masivo de websockets).
    - **Huella de Token:** El código Go tiende a ser más compacto que el boilerplate de Java, optimizando la ventana de contexto de los LLMs.
- **Riesgos:** Ecosistema de librerías financieras menos "enterprise" que Java. Menor soporte de metaprogramación (aunque los Generics ayudaron).

---

## ⚖️ Consenso de IT Pod

**Propuesta Final:** **Go (Golang)** para la capa de **Exchange Connectors** y el **Ledger In-Memory**.

**Racionales de la Decisión:**
1. **Latencia Determinista:** En Arbitraje, el p99 es la vida o la muerte. Go ofrece mejores garantías con menos esfuerzo de tuning.
2. **FinOps Alignment:** Menor consumo de recursos en la nube y prompts de implementación más cortos (menos tokens).
3. **Mantenibilidad:** El código imperativo y explícito de Go reduce errores sutiles en la lógica del Ledger.

**Próximos Pasos:**
- Definir el Benchmark oficial comparando una goroutine vs un virtual thread para el procesamiento de ticks.
- Validar librerías de Websockets de alta performance en Go.
