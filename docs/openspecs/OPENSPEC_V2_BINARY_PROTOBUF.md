# OpenSpecs V2: Binary Protocol Definition

## 1. Overview
Standardized binary communication protocol for the GHO-Apex ecosystem, utilizing Protobuf for maximum efficiency.

## 2. Protobuf Definitions (Schema)

```protobuf
syntax = "proto3";

package gho_apex.v2;

message ExecutionIntent {
  string intent_id = 1;
  uint64 timestamp_ns = 2; // For P99 Tracking
  
  message GasMetadata {
    uint256 max_fee_per_gas = 1;
    uint256 max_priority_fee_per_gas = 2;
    uint32 block_deadline = 3;
  }
  
  GasMetadata gas_info = 3;
  
  message TradePair {
    string source_asset = 1; // e.g., "GHO"
    string target_asset = 2; // "Stables Duras"
    uint256 amount = 3;
  }
  
  TradePair pair = 4;
}

message TruthPacket {
  string source_id = 1;
  bytes state_hash = 2;
  map<string, string> truth_metadata = 3; // Multi-source consensus data
}
```

## 3. Implementation Rules
- **Binary Only**: No plain-text JSON permitted in production IPC.
- **Header Injection**: Every packet must include a `Truth Protocol` signature.
- **Latency Benchmarking**: Continuous P99 monitoring integrated into the message transport layer.

---
**Standard**: OpenSpecs V2 Binary
**Owner**: CTO Pod