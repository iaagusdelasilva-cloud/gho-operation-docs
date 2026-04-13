#!/usr/bin/env bash
# GHO ADR Compliance Auditor (Zero-Token CoS Check)
# Usage: ./gho-audit-adr.sh <path_to_adr.md>

if [ -z "$1" ]; then
    echo "Usage: $0 <path>"
    exit 1
fi
ADR_PATH="$1"
if [ ! -f "$ADR_PATH" ]; then
    echo "[FAIL] File not found: $ADR_PATH"
    exit 1
fi
echo "--- GHO ADR AUDIT: $ADR_PATH ---"
BASENAME=$(basename "$ADR_PATH")
if [[ ! "$BASENAME" =~ ^[a-z0-9-]+(\.[a-z]+)?$ ]]; then
    echo "❌ [FAIL] Non-compliant filename (must be strict kebab-case lowercase)."
else
    echo "✅ [PASS] Kebab-case naming."
fi
if grep -q "Evidencia" "$ADR_PATH" || grep -q "http" "$ADR_PATH" || grep -q "web_search" "$ADR_PATH"; then
    echo "✅ [PASS] Contains empirical evidence/references."
else
    echo "❌ [FAIL] Missing empirical research."
fi
if grep -q "Triangulación" "$ADR_PATH" || grep -q "Peer Review" "$ADR_PATH"; then
    echo "✅ [PASS] Triangulation/Peer Review documented."
else
    echo "❌ [FAIL] Missing Triangulation of Profiles."
fi
echo "-----------------------------------"
