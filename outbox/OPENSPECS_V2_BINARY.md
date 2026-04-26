# OPENSPECS_V2_BINARY: Apex-Sync Communication Standard

## 1. Protocol Definition
**Version:** 2.0.0 (Binary/Protobuf)
**Transport:** IPC / gRPC / High-Speed WebSockets
**Encoding:** Google Protocol Buffers (proto3)

## 2. Message Schema (Core)

```protobuf
syntax = "proto3";

package gho.apex.v2;

message MarketData {
  uint64 timestamp_ns = 1;      // P99 Tracking
  string symbol = 2;            // e.g., "USDC/USDT" (Solo Stables)
  double bid_price = 3;
  double ask_price = 4;
  double vwap_24h = 5;          // VWAP Drift calculation
  GasMetadata gas = 6;          // Gas awareness
}

message GasMetadata {
  uint64 base_fee_gwei = 1;
  uint64 priority_fee_gwei = 2;
  uint64 gas_limit_est = 3;
}

message ExecutionSignal {
  string trade_id = 1;
  double target_price = 2;
  double amount = 3;
  string side = 4;              // BUY/SELL
  uint64 deadline_ns = 5;
}

message TruthValidation {
  string source = 1;            // "DUNE", "THE_GRAPH"
  bool verified = 2;
  double oracle_price = 3;
  double deviation = 4;         // Relative to Execution Price
}
```

## 3. Data Ingestion & Load Balancing
- **Cascaded Ingress:** Raw Data -> Local LB -> Pod-Specific Filter -> Binary Transform.
- **Local LB Policy:** Round-robin with latency-based weighting (P99 optimized).

## 4. CFO Financial Denominators
- **Organization:** GHO-Apex (Corporate Identity)
- **Hard Assets:** USDC, USDT, DAI (Trading, Settlement & Risk)
- **PnL Logic:** All `ExecutionSignal` results must include `Metadata_PnL` denominated in `USDC` (o stable de referencia) para reporte corporativo. GHO no es un par de trading.

## 5. Compliance & Validation
- **Truth Protocol:** No trade is finalized without a successful `TruthValidation` message within the post-trade window (T+100ms for local, T+Block for on-chain).
- **Latency Audit:** Every message header carries `origination_ns`. P99 targets are enforced at the LB level.

---
**Status:** APPROVED FOR IMPLEMENTATION (V2-BINARY)
**Authority:** CTO (Architecture) / CFO (Financial Standards)
