#!/usr/bin/env bash
# GHO Document Scaffolding Skill
# Usage: ./gho-scaffold.sh [adr|rfc|dea|pm] [id] [title]

TYPE="$1"
ID="$2"
TITLE="$3"
DATE=$(date +%Y-%m-%d)
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

case "$TYPE" in
  adr) FOLDER="docs/adr"; TEMPLATE="docs/templates/000-template-adr-finops.md" ;;
  rfc) FOLDER="docs/rfc"; TEMPLATE="docs/templates/000-template-rfc.md" ;;
  dea) FOLDER="docs/dea"; TEMPLATE="docs/templates/000-template-dea.md" ;;
  pm)  FOLDER="docs/postmortem"; TEMPLATE="docs/templates/000-template-postmortem.md"; PREFIX="PM-" ;;
  *) echo "Unknown type. Use adr, rfc, dea, pm."; exit 1 ;;
esac

FILE_NAME="${PREFIX}${ID}-$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr ' ' '-').md"
FILE_PATH="$REPO_ROOT/$FOLDER/$FILE_NAME"

cp "$REPO_ROOT/$TEMPLATE" "$FILE_PATH"
sed -i "s/XXX/$ID/g" "$FILE_PATH"
sed -i "s/\[Título.*\]/$TITLE/g" "$FILE_PATH"
sed -i "s/YYYY-MM-DD/$DATE/g" "$FILE_PATH"

echo "Scaffolded $TYPE at $FOLDER/$FILE_NAME"
