#!/usr/bin/env bash

# GHO World-Class PR Creator
# Usage: ./gho-create-pr.sh <branch> <title> <responsible_agents_list> <reviewer_github_user>

BRANCH="$1"
TITLE="$2"
AGENTS="$3"
REVIEWER="$4"
REPO="iaagusdelasilva-cloud/gho-knowledge-base"
TEMPLATE_FILE=".github/pull_request_template.md"

if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "Error: PR template not found."
    exit 1
fi

GH_TOKEN=$(cat ~/.ssh/gh_token)

# Build body from template (injecting metadata)
BODY=$(cat "$TEMPLATE_FILE")
BODY="${BODY//\[Agent Name\]/$AGENTS}"

# 1. Create PR
# Note: Using a temporary file for the body to ensure proper newline handling via curl --data-binary
echo -e "$BODY" > /tmp/gho_pr_body.txt

RESPONSE=$(curl -s -X POST -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_TOKEN" \
  "https://api.github.com/repos/$REPO/pulls" \
  --data-binary @- <<EOF
{
  "title": "$TITLE",
  "body": $(cat /tmp/gho_pr_body.txt | jq -Rs .),
  "head": "$BRANCH",
  "base": "main"
}
EOF
)

PR_NUMBER=$(echo "$RESPONSE" | grep -oP '(?<="number": )\d+')
PR_URL=$(echo "$RESPONSE" | grep -oP '(?<="html_url": ")[^"]*')

if [ ! -z "$PR_NUMBER" ]; then
    # 2. Set default Assignee (iaagusdelasilva-cloud)
    curl -s -X POST -H "Accept: application/vnd.github+json" \
      -H "Authorization: Bearer $GH_TOKEN" \
      "https://api.github.com/repos/$REPO/issues/$PR_NUMBER/assignees" \
      -d "{\"assignees\":[\"iaagusdelasilva-cloud\"]}"
    echo "📌 Assignee iaagusdelasilva-cloud set."

    # 3. Assign Reviewer if provided
    if [ ! -z "$REVIEWER" ]; then
        curl -s -X POST -H "Accept: application/vnd.github+json" \
          -H "Authorization: Bearer $GH_TOKEN" \
          "https://api.github.com/repos/$REPO/pulls/$PR_NUMBER/requested_reviewers" \
          -d "{\"reviewers\":[\"$REVIEWER\"]}"
        echo "👤 Reviewer $REVIEWER assigned."
    fi
    echo "🚀 PR Created successfully: $PR_URL"
else
    echo "Error creating PR. Response: $RESPONSE"
    exit 1
fi
