# SUMMIT LOG: CP-001 DATA INGESTION CONSENSUS
**Fecha:** 2026-04-26
**Participantes:** CTO Pod (Líder), Auditor Teórico (HFT Specialist), Auditor Pragmático (Backend Lead)

---

### [01:45] Apertura: El Conflicto de la Latencia vs. Mantenibilidad

**Auditor Teórico:** "Gente, si vamos a competir en arbitraje de GHO, no podemos mandar JSONs por Websockets como si fuera una app de delivery. Necesitamos SBE (Simple Binary Encoding). Los strings son veneno para el GC de Go. Si queremos latencia sub-microsegundo en la ingesta, cada byte cuenta. Propongo eliminar strings y usar fixed-length byte arrays."

**Auditor Pragmático:** "Pará un poco, loco. SBE es una pesadilla para iterar. Si Binance cambia un campo, tenemos que recompilar medio mundo y re-mapear offsets. Estamos en un VPS, no en una FPGA en New Jersey. Necesitamos algo que funcione *hoy*. Go maneja bien los strings si usamos `string(byte_slice)` con cuidado o `unsafe`. Propongo Protobuf o FlatBuffers si te ponés pesado, pero SBE es overkill ahora."

### [01:52] El Punto de Quiebre: Strings y Garbage Collection

**CTO Pod:** "Bajen un cambio. Teórico tiene razón en que el GC nos va a matar si generamos miles de strings por segundo en el orderbook. Pragmático tiene razón en que la agilidad es clave para el MVP. Busquemos el punto medio."

**Auditor Teórico:** "El compromiso es: **FlatBuffers**. Es zero-copy, más flexible que SBE pero evita las asignaciones de memoria de Protobuf/JSON. Y para los IDs de los assets, usamos Enums o `uint32`, nada de 'GHO-USDT' como string."

**Auditor Pragmático:** "FlatBuffers me sirve. Es tipado, genera código Go limpio y no rompe todo si agregamos un campo al final. Compro lo de los Enums para los pares, pero para los IDs de transacción de los CEXs, ¿qué hacemos? Algunos son alfanuméricos largos."

**Auditor Teórico:** "Fixed-size arrays de `[32]byte`. Si el ID es más corto, se rellena con ceros. Cero allocations. Cero piedad."

### [02:10] La Arquitectura de Transporte

**CTO Pod:** "¿Transporte? ¿ZeroMQ, NATS, o IPC directo?"

**Auditor Pragmático:** "NATS JetStream es robusto, pero para el core de arbitraje, prefiero algo más directo. Si los pods están en la misma máquina, usemos Unix Domain Sockets (UDS) con un protocolo simple de frames."

**Auditor Teórico:** "Coincido. UDS nos da la latencia más baja sin la complejidad de compartir memoria (Shared Memory) que en Go puede ser un dolor de cabeza por la sincronización. Pero el frame tiene que ser binario: `[Size(4 bytes)][Payload(FlatBuffers)]`."

### [02:25] Resolución y Consenso

**CTO Pod:** "Listo. El acuerdo es:
1. **Formato:** FlatBuffers para la serialización.
2. **Strings:** Reemplazados por Enums (`uint16`) para constantes y `[N]byte` para IDs variables.
3. **Transporte:** Unix Domain Sockets (UDS) para comunicación entre pods en el mismo host.
4. **Tooling:** Generación automática de código vía `flatc` integrada en el CI.

¿Están de acuerdo?"

**Auditor Teórico:** "Aceptable para una V1. Al menos no hay basura de GC."
**Auditor Pragmático:** "Dale, con FlatBuffers puedo vivir. Mañana tengo el prototipo en Go."

---
**Firmas:**
- 🛡️ CTO Pod
- 🏎️ Auditor Teórico
- 🛠️ Auditor Pragmático
