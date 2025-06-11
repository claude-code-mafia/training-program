# Lesson 03: Automation with Claude -p

## Understanding Print Mode

The `-p` flag enables **non-interactive mode**:
- Claude executes once and exits
- Perfect for scripts and automation
- No ongoing conversation

## Basic Usage

### Direct Commands
```bash
# Simple prompt
claude -p "List all TODO comments in this codebase"

# With file input
claude -p "$(cat requirements.txt) - explain these dependencies"

# Piped input
echo "error log data" | claude -p "Analyze these errors"
```

### Instruction Files
```bash
# Create an instruction file
cat > daily_tasks.md << 'EOF'
1. Check for any failing tests
2. Review recent commits
3. List any TODO comments
4. Generate a summary report
EOF

# Execute it
claude -p daily_tasks.md
```

## Cron Job Automation

### Daily Reports
```bash
# Add to crontab (crontab -e)
0 9 * * * claude -p /home/user/daily_standup.md >> /var/log/standup.log

# With God Mode for zero friction
0 */4 * * * claude --dangerously-skip-permissions -p /home/user/monitor.md
```

### Complex Workflows
```bash
#!/bin/bash
# automated_review.sh

# Morning review script
claude -p "Check git status and uncommitted changes" > morning_report.txt
claude -p "Review yesterday's commits and summarize" >> morning_report.txt
claude -p "List high-priority TODOs from the codebase" >> morning_report.txt

# Email the report (if you have mail configured)
cat morning_report.txt | mail -s "Morning Review" you@example.com
```

## CLAUDE.md Integration

### Project Automation
```bash
# In your project root, create CLAUDE.md
cat > CLAUDE.md << 'EOF'
# Project Rules
- Always run tests before committing
- Follow existing code style
- Update documentation when changing APIs

# Daily Tasks
When running daily automation:
1. Check test coverage
2. Validate dependencies
3. Report any security issues
EOF

# Now automation respects project rules
claude -p "Perform daily project health check"
```

## Output Formats

### JSON Output for Scripts
```bash
# Get structured data
claude -p --output-format json "List all functions in main.py"

# Parse with jq
claude -p --output-format json "Get project stats" | jq '.result'
```

## Real-World Examples

### 1. Git Commit Automation
```bash
#!/bin/bash
# auto_commit.sh
CHANGES=$(git status --porcelain)
if [ ! -z "$CHANGES" ]; then
    claude -p "Generate a commit message for these changes: $CHANGES" | git commit -F -
fi
```

### 2. Documentation Generator
```bash
# Weekly docs update
claude -p "Update API.md based on changes in src/api/" > API_UPDATE.md
```

### 3. Code Review Assistant
```bash
# Review PRs automatically
PR_DIFF=$(gh pr diff 123)
claude -p "Review this PR and provide feedback: $PR_DIFF"
```

## Pro Tips

1. **Chain Commands**: Use `&&` to chain Claude operations
2. **Error Handling**: Check exit codes in scripts
3. **Logging**: Always log automated runs for debugging
4. **Templates**: Build a library of instruction files

## Next Steps
- Continue to [Lesson 04: JSON API](../04-json-api/README.md)