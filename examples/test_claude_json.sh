#\!/bin/bash

# Test various ways to get structured data from claude -p

echo "=== Test 1: Basic JSON output ==="
echo "What is the capital of France?" | claude -p --output-format json | jq '.'

echo -e "\n=== Test 2: Extract just the result ==="
echo "What is 5 * 7?" | claude -p --output-format json | jq -r '.result'

echo -e "\n=== Test 3: Generate structured data ==="
echo "Generate a JSON array with 3 fruits" | claude -p --output-format json | jq -r '.result'

echo -e "\n=== Test 4: Check JSON structure fields ==="
echo "Hello" | claude -p --output-format json | jq 'keys'

echo -e "\n=== Test 5: Stream JSON output ==="
echo "Count from 1 to 3" | claude -p --output-format stream-json 2>/dev/null | head -5
