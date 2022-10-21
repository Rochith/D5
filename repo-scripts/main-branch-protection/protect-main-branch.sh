#!/bin/bash
set -e

export org="Rochith"
export user="Rochith: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"
export branch="main" 

declare -a repositories=(
    "D5"
)

JSON=$(cat << 'EOF'
    {
        "required_status_checks": null,
        "enforce_admins": true,
        "required_pull_request_reviews": {
            "required_approving_review_count": 0,
	    "require_code_owner_reviews": true
        },
        "restrictions": null
    }
EOF
)

for repository_name in "${repositories[@]}"; do
    echo "========"
    echo "=======> $repository_name"
    echo "========"
        
    curl \
        --silent \
        --user $user \
        --header "Accept: application/vnd.github.v3+json" \
        --request PUT \
        https://api.github.com/repos/$org/$repository_name/branches/$branch/protection \
        --data "$JSON"

done

