# OPENSPEC_V2_FINAL: GHO-Apex Data Ingestion Contract

**Status:** APPROVED
**Version:** 2.0.0 (Post-Summit Consensus)
**Author:** CTO Pod

## 1. Protocolo de Serialización
Se adopta **FlatBuffers** como el estándar de comunicación entre el Ingestor y el Motor de Arbitraje.

- **Zero-copy:** Se prohíbe la deserialización total a structs intermedios si no es estrictamente necesario.
- **Schema Enforcement:** Todos los mensajes deben definirse en archivos `.fbs`.

## 2. Manejo de Datos (Zero-String Policy)
Para minimizar la presión sobre el Garbage Collector (GC) de Go:

- **Asset Pairs:** Se utilizará un `uint16` mapeado a un Registro Global de Assets. (Ej: `1` = GHO/USDT).
- **Exchanges:** Se utilizará un `uint8` (Enum).
- **Transaction/Order IDs:** Se utilizarán arrays de bytes de tamaño fijo `[32]byte`. Los IDs se copiarán directamente a estos buffers.
- **Timestamps:** Unix Nano en `int64`.

## 3. Transporte (Low-Latency Layer)
La comunicación interna entre Pods residentes en el mismo host se realizará mediante:

- **Mecanismo:** Unix Domain Sockets (UDS).
- **Framing:**
  - 4 bytes: `uint32` indicando el tamaño del mensaje (Little Endian).
  - N bytes: Payload de FlatBuffers.
- **Keep-Alive:** Heartbeat binario cada 100ms si no hay tráfico.

## 4. Definición de Referencia (FlatBuffers Snippet)

```fbs
namespace GHOApex.Core;

enum Exchange : uint8 { Binance = 0, Aave = 1, Uniswap = 2 }

table OrderBookTick {
  pair_id: uint16;
  exchange: Exchange;
  timestamp: int64;
  bids_price: [float64];
  bids_qty: [float64];
  asks_price: [float64];
  asks_qty: [float64];
}

root_type OrderBookTick;
```

## 5. Directivas de Implementación (Go)
1. Usar `sync.Pool` para reutilizar los buffers de FlatBuffers (`FlatBufferBuilder`).
2. Prohibido el uso de `fmt.Sprintf` en el hot-path de ingesta.
3. El profiling de `pgo` (Profile Guided Optimization) se activará para optimizar los inlines de acceso binario.

---
**GHO-Apex Architecture Board**
*In Latency We Trust.*
