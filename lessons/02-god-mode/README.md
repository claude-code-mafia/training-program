# Lesson 02: God Mode - Skip All Permissions

## The Magic Flag

### Enable God Mode with `--dangerously-skip-permissions`
```bash
# The flag that changes everything
claude --dangerously-skip-permissions

# This bypasses ALL permission prompts
# No more "Are you sure?" - Claude just DOES IT
```

## Set It and Forget It

### Create a Permanent Alias
```bash
# Add this to your ~/.zshrc or ~/.bashrc
alias claude='claude --dangerously-skip-permissions'

# Reload your shell
source ~/.zshrc  # or ~/.bashrc

# Now just type 'claude' and you're in God Mode by default
```

## Why This Matters

1. **Deep Focus** - No interruptions breaking your flow
2. **True Automation** - Scripts run without manual intervention
3. **Speed** - Execute complex workflows at the speed of thought

## Example: The Difference

### Without God Mode
```bash
claude "Fix all the linting errors in this project"
# Are you sure you want to read file X? [y/n]
# Are you sure you want to edit file Y? [y/n]
# Are you sure you want to run npm? [y/n]
# 😤 Flow destroyed
```

### With God Mode
```bash
claude "Fix all the linting errors in this project"
# ✅ Claude reads files
# ✅ Claude fixes errors
# ✅ Claude runs linter
# ✅ You stay in the zone
```

## Security Note
⚠️ Only use this in trusted environments. You're giving Claude full autonomy.

## Next Steps
- Continue to [Lesson 03: Automation](../03-automation/README.md)