#!/bin/bash
# GHO Agent Sandbox Initialization Script
# Usage: Run this script whenever a new Pod or Specialist Agent is added to the architecture.

REPO_PATH="/home/agus/.openclaw/workspace/projects/gho-knowledge-base"
WORKSPACE_ROOT="/home/agus/.openclaw/workspace"

echo "Initializing GHO Agent Sandboxes..."

# List of persistent agents
AGENTS=("cfo" "coo" "cos" "cpo" "cso" "cto" "cto-arch-back" "cto-arch-front" "cto-data-engineer" "cto-devops-sre" "cto-qa-testing" "cto-secops-engineer")

for AGENT in "${AGENTS[@]}"; do
    AGENT_DIR="$WORKSPACE_ROOT/$AGENT"
    mkdir -p "$AGENT_DIR"
    
    # 1. Symlink the entire repo for context reading
    if [ ! -L "$AGENT_DIR/gho-knowledge-base" ]; then
        ln -s "$REPO_PATH" "$AGENT_DIR/gho-knowledge-base"
    fi
    
    # Determine the specific pod path in the repo
    if [[ $AGENT == cto-* ]]; then
        POD_PATH="pods/cto/${AGENT#cto-}"
    else
        POD_PATH="pods/$AGENT"
    fi
    
    # 2. Symlink core injected files to the root of the sandbox
    for FILE in SOUL.md USER.md AGENTS.md BOOTSTRAP.md; do
        # Remove existing file if it's not a symlink (cleanup)
        if [ -f "$AGENT_DIR/$FILE" ] && [ ! -L "$AGENT_DIR/$FILE" ]; then
            rm -f "$AGENT_DIR/$FILE"
        fi
        
        # Create symlink if the source exists in the repo
        if [ -f "$REPO_PATH/$POD_PATH/$FILE" ] && [ ! -L "$AGENT_DIR/$FILE" ]; then
            ln -s "$REPO_PATH/$POD_PATH/$FILE" "$AGENT_DIR/$FILE"
        fi
    done
done

echo "✅ Sandboxes isolated and symlinked successfully."
