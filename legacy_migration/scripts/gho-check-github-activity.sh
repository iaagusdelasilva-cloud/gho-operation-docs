#!/usr/bin/env bash

# GHO GitHub Activity Monitor (FinOps Polling)
# Usage: ./gho-check-github-activity.sh

REPO="iaagusdelasilva-cloud/gho-knowledge-base"
GH_TOKEN=$(cat ~/.ssh/gh_token)
STATE_FILE="/tmp/gho_gh_activity_state.txt"

# Get last 5 notifications/events
EVENTS=$(curl -s -H "Authorization: Bearer $GH_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  "https://api.github.com/repos/$REPO/issues/comments?sort=created&direction=desc&per_page=5")

# Extract the latest comment ID to see if it's new
LATEST_ID=$(echo "$EVENTS" | grep -oP '(?<="id": )\d+' | head -n 1)

if [ -z "$LATEST_ID" ]; then
    exit 0
fi

LAST_SEEN=$(cat "$STATE_FILE" 2>/dev/null)

if [ "$LATEST_ID" != "$LAST_SEEN" ]; then
    # New activity detected!
    COMMENT=$(echo "$EVENTS" | grep -oP '(?<="body": ")[^"]*' | head -n 1)
    USER=$(echo "$EVENTS" | grep -oP '(?<="login": ")[^"]*' | head -n 1)
    URL=$(echo "$EVENTS" | grep -oP '(?<="html_url": ")[^"]*' | head -n 1)
    
    echo "🔔 GHO GITHUB NOTIFICATION: New comment from $USER on $URL: '$COMMENT'"
    echo "$LATEST_ID" > "$STATE_FILE"
else
    # Nothing new, exit silently (Zero Token Waste)
    exit 0
fi
