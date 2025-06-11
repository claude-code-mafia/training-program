# Lesson 04: Claude as a JSON API

## The Hidden Superpower

Claude can return structured JSON data, turning it into a programmable API for your scripts.

## Basic JSON Requests

### Simple Structure
```bash
# Ask for specific JSON structure
claude -p "Return JSON: {name: string, score: number, tags: string[]}"

# Response will be:
# {
#   "name": "Example",
#   "score": 95,
#   "tags": ["important", "reviewed"]
# }
```

### Template Filling
```bash
# Create a template
echo '{"task": "", "priority": "", "due": ""}' > template.json

# Have Claude fill it
claude -p "Fill this template with a task for refactoring: $(cat template.json)"
```

## Extracting Clean JSON

### The Challenge
Claude often wraps JSON in markdown code blocks. Here's how to handle it:

```bash
# Helper function to extract JSON
claude_json() {
    local prompt="$1"
    local response=$(claude -p --output-format json "$prompt" | jq -r '.result')
    
    # Extract JSON from markdown if present
    if echo "$response" | grep -q '```json'; then
        echo "$response" | sed -n '/```json/,/```/p' | sed '1d;$d'
    else
        echo "$response"
    fi
}

# Use it
RESULT=$(claude_json "Return system metrics as JSON")
echo "$RESULT" | jq '.'
```

## Real-World Applications

### 1. Log Analysis Pipeline
```bash
# Extract errors as structured data
cat app.log | claude -p "Extract errors as JSON array with {timestamp, level, message}" | \
  jq -r '.[] | select(.level == "ERROR") | .message'
```

### 2. Data Transformation
```bash
# Convert unstructured data to JSON
cat customer_feedback.txt | \
  claude -p "Structure as JSON: {sentiment: positive|negative|neutral, topics: string[], summary: string}"
```

### 3. API Mock Generator
```bash
# Generate test data
claude -p "Generate 5 user objects with realistic data: {id: uuid, name: string, email: string, created: ISO date}"
```

## Advanced Patterns

### Schema Validation
```bash
# TypeScript interface approach
claude -p "Generate JSON matching this TypeScript interface:
interface Config {
  apiUrl: string;
  timeout: number;
  retries: number;
  features: {
    enabled: string[];
    experimental: string[];
  };
}"
```

### Batch Processing
```bash
#!/bin/bash
# Process multiple files
for file in *.log; do
    echo "Processing $file..."
    cat "$file" | claude -p "Summarize as JSON: {file: string, errors: number, warnings: number}" >> summary.json
done
```

### Building AI-Powered CLIs
```bash
#!/bin/bash
# my-ai-tool.sh

analyze_code() {
    local file="$1"
    claude -p --output-format json "Analyze $file and return JSON: {
        complexity: number,
        issues: string[],
        suggestions: string[]
    }" | jq -r '.result'
}

# Usage
ANALYSIS=$(analyze_code "main.py")
COMPLEXITY=$(echo "$ANALYSIS" | jq -r '.complexity')

if [ "$COMPLEXITY" -gt 10 ]; then
    echo "Warning: High complexity detected!"
    echo "$ANALYSIS" | jq -r '.suggestions[]'
fi
```

## Integration Examples

### With Other Tools
```bash
# Feed Claude output to other programs
claude -p "List project dependencies as JSON" | \
  jq -r '.[] | .name' | \
  xargs npm info
```

### Database Seeding
```bash
# Generate test data for database
claude -p "Generate 10 product records as JSON" | \
  jq -c '.[]' | \
  while read product; do
    echo "INSERT INTO products VALUES ('$product');"
  done | psql mydb
```

## Best Practices

1. **Be Explicit**: Always specify "return ONLY valid JSON"
2. **Use Templates**: Define structure upfront
3. **Validate Output**: Always parse with `jq` to ensure valid JSON
4. **Error Handling**: Check if JSON parsing succeeds

## Next Steps
- Continue to [Lesson 05: GitHub Mastery](../05-github-mastery/README.md)