# GHO-Apex Architecture Axioms

## 1. Independence of Execution (The Core)
The Arbitrage Platform is an **INDEPENDENT** execution entity.
- **Pods are for Management:** Pods (CEO, CTO, COO, Quant, etc.) define strategy, configuration, and monitor performance.
- **Hot-Path Isolation:** Pods are NOT in the runtime execution path. Any failure in the OpenClaw pod infrastructure must not affect the active execution of orders by the platform (which has its own safety gates/panic modes).
- **Asynchronous Governance:** Configuration changes are pushed from Pods to the Platform; Telemetry is pulled from the Platform to Pods.

## 2. Low-Latency Determinism
Performance is a risk metric. The platform runtime (Go-based) is optimized for deterministic response times.

## 3. Governance via Code
All architectural decisions are codified in ADRs. No "shadow architecture" is permitted.
