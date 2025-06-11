# Lesson 06: Build Your Own Tools - Forget MCPs

## The Philosophy

MCPs (Model Context Protocol servers) are overengineered. Build simple CLI tools that Claude can use naturally.

## Why Build Your Own?

1. **Full Control** - No mysterious abstractions
2. **Simple** - Just bash scripts or Python
3. **Composable** - Unix philosophy: do one thing well
4. **Fast** - No protocol overhead

## Your First Tool

### Basic Structure
```bash
#!/bin/bash
# my-tool

# Simple tool that Claude can use
case "$1" in
  search)
    grep -r "$2" .
    ;;
  count)
    find . -name "*.$2" | wc -l
    ;;
  *)
    echo "Usage: my-tool [search|count] <pattern>"
    ;;
esac
```

### Make it Executable
```bash
chmod +x my-tool
sudo mv my-tool /usr/local/bin/

# Now Claude can use it
claude "Use my-tool to search for TODO comments"
```

## Python Tool Example

### Weather CLI
```python
#!/usr/bin/env python3
# weather-cli

import sys
import requests
import json

def get_weather(city):
    # Your API call here
    return {"temp": 72, "condition": "sunny"}

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: weather-cli <city>")
        sys.exit(1)
    
    result = get_weather(sys.argv[1])
    print(json.dumps(result))
```

### Install and Use
```bash
chmod +x weather-cli
sudo cp weather-cli /usr/local/bin/

# Claude can now check weather
claude "What's the weather in Tokyo?"
# Claude will discover and use weather-cli
```

## Advanced Tool Patterns

### 1. JSON Output Tools
```bash
#!/bin/bash
# project-stats

echo '{
  "files": '$(find . -type f | wc -l)',
  "lines": '$(find . -type f -exec wc -l {} + | tail -1 | awk '{print $1}')',
  "todos": '$(grep -r "TODO" . 2>/dev/null | wc -l)'
}'
```

### 2. Pipe-Friendly Tools
```bash
#!/bin/bash
# extract-errors

# Reads from stdin, outputs JSON
jq -Rs 'split("\n") | map(select(contains("ERROR"))) | {
  count: length,
  errors: .
}'
```

### 3. Configuration Tools
```bash
#!/bin/bash
# config-tool

CONFIG_FILE="$HOME/.my-app/config.json"

case "$1" in
  get)
    jq -r ".$2" "$CONFIG_FILE"
    ;;
  set)
    jq ".$2 = \"$3\"" "$CONFIG_FILE" > tmp && mv tmp "$CONFIG_FILE"
    ;;
esac
```

## Building Tool Collections

### Directory Structure
```
~/my-tools/
├── README.md
├── install.sh
└── bin/
    ├── code-review
    ├── deploy-tool
    ├── test-runner
    └── backup-tool
```

### Install Script
```bash
#!/bin/bash
# install.sh

TOOLS_DIR="$(dirname "$0")/bin"

for tool in "$TOOLS_DIR"/*; do
  chmod +x "$tool"
  sudo ln -sf "$tool" "/usr/local/bin/$(basename "$tool")"
done

echo "Tools installed! Claude can now use:"
ls -1 "$TOOLS_DIR"
```

## Integration Tips

### 1. Documentation
```bash
# Add to your tool
show_help() {
  cat << EOF
DESCRIPTION:
  This tool does X, Y, and Z
  
USAGE:
  my-tool [command] [options]
  
EXAMPLES:
  my-tool analyze file.py
  my-tool report --json
EOF
}
```

### 2. Claude-Friendly Output
```bash
# Make output Claude can understand
if [ "$OUTPUT_FORMAT" = "json" ]; then
  echo "$RESULT" | jq '.'
else
  echo "$RESULT"
fi
```

### 3. Error Handling
```bash
# Help Claude understand errors
if [ $? -ne 0 ]; then
  echo "ERROR: Operation failed" >&2
  echo "SUGGESTION: Check file permissions" >&2
  exit 1
fi
```

## Real-World Examples

### Screenshot Tool
```bash
#!/bin/bash
# screenshot-tool

FILE="/tmp/screenshot_$(date +%s).png"
screencapture -i "$FILE"
echo "$FILE"

# Claude can now take screenshots
# claude "Take a screenshot and analyze the UI"
```

### Database Query Tool
```python
#!/usr/bin/env python3
# db-query

import sys
import json
import psycopg2

def query(sql):
    conn = psycopg2.connect("your_connection_string")
    cur = conn.cursor()
    cur.execute(sql)
    
    if sql.strip().upper().startswith('SELECT'):
        columns = [desc[0] for desc in cur.description]
        rows = cur.fetchall()
        return [dict(zip(columns, row)) for row in rows]
    else:
        conn.commit()
        return {"affected_rows": cur.rowcount}

if __name__ == "__main__":
    result = query(sys.argv[1])
    print(json.dumps(result, default=str))
```

## The Tool Ecosystem

Once you start building tools, you'll find:
- Every repetitive task becomes a tool
- Tools compose naturally
- Claude becomes exponentially more powerful
- You stop using web interfaces entirely

## Next Steps
- Continue to [Lesson 07: Advanced Patterns](../07-advanced-patterns/README.md)