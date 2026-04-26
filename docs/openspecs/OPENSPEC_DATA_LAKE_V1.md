# OpenSpec: DATA_LAKE_V1

## 1. Interface Overview
**Name:** Apex Data Lake Interface
**Version:** 1.0.0
**Status:** Approved
**Owner:** CTO Pod

## 2. Data Flow Architecture
### 2.1 Ingestion Layer (Real-Time)
- **Sources:** Websockets (Binance, Aave, Curve), RPC Nodes.
- **Data Types:** 
    - `Tick`: {symbol, price, side, size, timestamp_ns}
    - `Candle`: {symbol, interval, open, high, low, close, volume, timestamp}

### 2.2 Persistence Layers
1. **HOT (Redis):** 
    - Últimos 100 ticks por par.
    - Estado actual del Orderbook (L2).
    - TTL: 60 segundos.
2. **WARM (TimescaleDB):**
    - Series temporales de candles (1m, 5m, 15m).
    - Historial de trades ejecutados.
    - Agregaciones en tiempo real via Continuous Aggregates.
3. **COLD (Parquet/Object Storage):**
    - Archivo histórico de todos los ticks diarios.
    - Particionado por `date/symbol`.
    - Formato optimizado para lecturas analíticas masivas.

## 3. Communication Protocols
- **Internal:** gRPC para comunicación entre servicios de alta performance.
- **External/Pods:** Apex-Sync via File-Based Inbox/Outbox para señales asincrónicas.
- **Pub/Sub:** Redis Streams para distribución de ticks en tiempo real.

## 4. Schema Validation
- Formato estricto definido en Protobuf para evitar discrepancias entre el recolector y el consumidor.

---
**Standard:** OpenSpecs Compliance Mandatory.
**Alignment:** Drives PRD_DATA_ONLY_V1 implementation.
