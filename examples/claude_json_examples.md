# Claude -p JSON Output Examples

## Getting Structured JSON from Claude

### Method 1: Direct JSON Request
```bash
# Ask Claude to return JSON in a specific structure
claude -p "Return a JSON object with fields: name (string), age (number), skills (array of strings). Make up a developer profile."

# Claude will return something like:
# ```json
# {
#   "name": "Alex Chen",
#   "age": 28,
#   "skills": ["Python", "React", "Docker"]
# }
# ```
```

### Method 2: Template-Based Approach
```bash
# Create a template file
cat > user_template.json << 'EOF'
{
  "name": "",
  "email": "",
  "preferences": {
    "theme": "",
    "notifications": true
  },
  "tags": []
}
EOF

# Ask Claude to fill it
claude -p "Fill in this JSON template with realistic data: $(cat user_template.json)"
```

### Method 3: Schema-Driven Generation
```bash
# Define the schema in your prompt
claude -p "Generate a JSON object matching this TypeScript interface:
interface Task {
  id: string;
  title: string;
  priority: 'low' | 'medium' | 'high';
  dueDate: string; // ISO date
  tags: string[];
  completed: boolean;
}
Generate 3 sample tasks."
```

### Method 4: Extract and Parse (Most Reliable)
```bash
# Function to extract JSON from Claude's response
claude_json() {
    local prompt="$1"
    local response=$(claude -p --output-format json "$prompt" | jq -r '.result')
    
    # Extract JSON from markdown code blocks if present
    if echo "$response" | grep -q '```json'; then
        echo "$response" | sed -n '/```json/,/```/p' | sed '1d;$d'
    else
        echo "$response"
    fi
}

# Use it
RESULT=$(claude_json "Return a JSON object with fields: status (string), timestamp (ISO date), metrics (object with cpu and memory as numbers)")
echo "$RESULT" | jq '.'
```

### Method 5: Enforced Structure with Validation
```bash
# Create a strict prompt
cat > get_analysis.sh << 'EOF'
#!/bin/bash
PROMPT="Analyze the current directory and return ONLY a valid JSON object (no markdown, no explanation) with this exact structure:
{
  \"fileCount\": <number>,
  \"totalSize\": \"<human readable size>\",
  \"languages\": [<array of language strings>],
  \"lastModified\": \"<ISO date string>\",
  \"summary\": \"<one line summary>\"
}"

claude -p --output-format json "$PROMPT" | jq -r '.result' | jq '.'
EOF

chmod +x get_analysis.sh
./get_analysis.sh
```

## Pro Tips

### 1. Be Explicit About Format
```bash
# Good
claude -p "Return ONLY a JSON object with no markdown formatting: {name: string, age: number}"

# Better
claude -p "Return a raw JSON object (no backticks, no markdown) with these exact fields: name (string), age (number)"
```

### 2. Use for Automation
```bash
# Get structured data for scripts
METRICS=$(claude -p "Return JSON with current system metrics: {cpu: number, memory: number, disk: number}" | 
         claude_json | 
         jq -r '.')

CPU=$(echo "$METRICS" | jq -r '.cpu')
```

### 3. Complex Nested Structures
```bash
claude -p "Generate a JSON API response for a user profile with:
- user object (id, name, email)
- preferences object (theme, language, notifications object with email/push booleans)
- activity array (last 3 activities with timestamp and action)
Return only valid JSON."
```

### 4. Fill Templates from Files
```bash
# Create a complex template
cat > template.json << 'EOF'
{
  "projectName": "",
  "description": "",
  "techStack": {
    "frontend": [],
    "backend": [],
    "database": ""
  },
  "team": [
    {
      "name": "",
      "role": "",
      "github": ""
    }
  ],
  "timeline": {
    "start": "",
    "end": "",
    "milestones": []
  }
}
EOF

# Have Claude fill it based on context
claude -p "Read the README.md and package.json, then fill in this project template: $(cat template.json)"
```

## The Ultimate Pattern
```bash
# Create a reusable function
get_json() {
    local schema="$1"
    local context="$2"
    claude -p --output-format json "Based on this context: $context
    
    Return ONLY a valid JSON object matching this structure: $schema
    No markdown, no code blocks, just raw JSON." | jq -r '.result'
}

# Use it
SCHEMA='{"analysis": string, "score": number, "issues": array}'
CONTEXT="The latest test results from test.log"
RESULT=$(get_json "$SCHEMA" "$CONTEXT")
```

This way you can programmatically get structured data from Claude that your scripts can consume!