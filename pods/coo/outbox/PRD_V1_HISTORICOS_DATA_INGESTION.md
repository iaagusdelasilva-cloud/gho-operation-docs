# PRD: Ingestión de Datos e Históricos - V1

## 1. Executive Summary
**Context:** Para dominar el arbitraje de GHO, necesitamos una base de datos histórica impecable para backtesting y un sistema de ingesta en tiempo real de baja latencia.
**Goal:** Desarrollar el módulo core de ingestión (Data Ingestion Engine) que capture ticks y genere candles para el motor de arbitraje GHO-Apex.
**Success Metrics:**
- **Latencia de Ingesta:** < 50ms desde la recepción del evento hasta la persistencia/distribución.
- **Backtesting Fidelity:** 100% de precisión en la reconstrucción del libro de órdenes basado en ticks.
- **Uptime:** 99.99% para el stream de datos en tiempo real.

## 2. Product Requirements
### 2.1 Functional Requirements
- **[FR1] Captura de Ticks:** Ingesta de eventos `Swap`, `Sync`, `Mint`, `Burn` de DEXes seleccionados vía WebSockets/RPC.
- **[FR2] Agregador de Candles:** Generación de velas (OHLCV) en resoluciones de 1m, 5m y 1h a partir de ticks.
- **[FR3] Historical Archiver:** Almacenamiento eficiente (Parquet/TimescaleDB) de datos históricos para backtesting.
- **[FR4] Unified API:** Interfaz única para consultar datos de múltiples exchanges.

### 2.2 Non-Functional Requirements
- **Latency:** Ingesta en el "hot-path" debe estar optimizada para evitar GC pauses.
- **Reliability:** Mecanismo de reconexión automática y llenado de gaps en históricos.
- **Security:** Firmado de payloads para asegurar la integridad de la data de backtesting.

## 3. Technical Constraints
- Debe ser compatible con el protocolo Apex-Sync.
- El almacenamiento histórico debe permitir queries de alto throughput para simulaciones de Monte Carlo.
- Obligatorio usar OpenSpecs para todas las interfaces de datos.

## 4. User Stories
- **As a Quant Researcher,** I want to access tick-level historical data, so that I can validate arbitrage strategies with high fidelity.
- **As a Risk Manager,** I want real-time liquidity depth monitoring, so that I can trigger circuit breakers if slippage exceeds 0.3%.

## 5. Risk & Mitigations
- **Data Gaps:** Mitigado mediante el uso de múltiples proveedores de RPC y reconciliación post-block.
- **RPC Rate Limits:** Implementar load balancing y caching agresivo.

---
**Standard:** OpenSpecs Compliance Required.
**Architecture:** Must align with SDD (System Design Document).
**Policy:** No se acepta código sin validación de backtesting previa.
