#\!/bin/bash

# Function to extract JSON from markdown code blocks
extract_json() {
    # Remove markdown code blocks if present
    sed -n '/^```json$/,/^```$/p' | sed '1d;$d' 2>/dev/null || echo "$1"
}

# Test extraction
result=$(echo "Generate valid JSON for a product with name and price" | claude -p --output-format json | jq -r '.result')
echo "Raw result:"
echo "$result"
echo -e "\nExtracted JSON:"
echo "$result" | extract_json
echo -e "\nParsed with jq:"
echo "$result" | sed -n '/^```json$/,/^```$/p' | sed '1d;$d' | jq '.'
