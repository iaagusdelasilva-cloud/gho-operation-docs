#!/usr/bin/env bash

# GHO Knowledge Fetcher (Strategic & Tactical)
# Usage: ./gho-fetch-knowledge.sh [tag|id] [it|strategic|business|etc]

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
AREA="${2:-strategic}"
DB_FILE="$REPO_ROOT/domain-knowledge/$AREA/"

# Resolve DB file name based on area
DB_FILE="${DB_FILE}passages.psv"

if [ ! -f "$DB_FILE" ]; then
    echo "Error: Knowledge base not found at $DB_FILE"
    exit 1
fi

if [ -z "$1" ]; then
    echo "GHO Domain Knowledge Index ($AREA Passages):"
    echo "-----------------------------------------------"
    tail -n +2 "$DB_FILE" | cut -d'|' -f1,4 | sed 's/|/ [/; s/$/]/'
    exit 0
fi

QUERY="$1"

echo "--- GHO ATOMIC KNOWLEDGE PASSAGE ($AREA) ---"
tail -n +2 "$DB_FILE" | grep -i "$QUERY" | while IFS='|' read -r id context passage metadata; do
    echo "ID: $id"
    echo "Context: $context"
    echo "Passage: $passage"
    echo "Metadata: $metadata"
    echo "-----------------------------------"
done
