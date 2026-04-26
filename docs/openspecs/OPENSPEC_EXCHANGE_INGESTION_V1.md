# OpenSpec: Exchange Ingestion API (v1.0.0)

## 1. ID & Metadata
- **ID:** SPEC-DATA-001
- **Status:** Draft
- **Owner:** CTO Pod (GHO-Apex)
- **Version:** 1.0.0 (SemVer)

## 2. Technical Schema (Unified Event Format)
Todas las ingestas de exchanges (DEX/CEX) deben normalizarse al siguiente esquema (JSON representation):

```json
{
  "spec_version": "1.0.0",
  "event_id": "uuid-v7",
  "timestamp": "uint64 (nanoseconds)",
  "exchange": "string (e.g., 'uniswap_v3_ethereum')",
  "pair": "string (e.g., 'GHO/USDC')",
  "type": "string (enum: 'tick', 'candle', 'snapshot')",
  "data": {
    "price": "string (decimal)",
    "amount": "string (decimal)",
    "side": "string (enum: 'buy', 'sell')",
    "liquidity_info": {
      "pool_address": "string",
      "sqrtPriceX96": "string (optional, for UniV3)",
      "tick": "int32 (optional, for UniV3)"
    }
  },
  "metadata": {
    "block_number": "uint64",
    "tx_hash": "string",
    "log_index": "uint32"
  }
}
```

## 3. Validation Rules (Invariants)
1. **Timestamp Monotonicity:** Dentro de un mismo `exchange` y `pair`, los timestamps deben ser estrictamente crecientes.
2. **Price Non-Zero:** El precio debe ser siempre > 0.
3. **Decimal Precision:** Todos los campos de precio y cantidad deben manejarse como strings para evitar pérdida de precisión, con un estándar de 18 decimales para GHO.

## 4. Connectivity Requirements
- **WebSocket:** Heartbeat cada 30s. Reconexión exponencial backoff tras fallo.
- **REST Fallback:** Poll cada 12s (tiempo de bloque promedio) si el socket cae.

## 5. Compliance
Este spec es de cumplimiento obligatorio para el módulo `ingestion-engine-v1`. No se permite el flujo de datos hacia el motor de arbitraje que no valide contra este esquema.
