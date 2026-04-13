#!/usr/bin/env bash
# GHO Sprint Context Compacter (FinOps Friendly)
# Usage: ./gho-compact-context.sh [sprint_id]

SPRINT_ID="$1"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_FILE="$REPO_ROOT/memory/sprint-history.psv"

if [ -z "$SPRINT_ID" ]; then
    echo "Usage: $0 <sprint_id>"
    exit 1
fi

echo "Compacting context for Sprint $SPRINT_ID..."
if [ ! -f "$TARGET_FILE" ]; then
    echo "id|date|summary|status" > "$TARGET_FILE"
fi
