# 🔥 CLAUDE CODE MAFIA INITIATION GUIDE 🔥

> *Welcome to the family. Once you're in, there's no going back to clicking buttons like a civilian.*

---

## 💰 THE ENTRY FEE

### 1. Get Claude Max Account
- **Starting price**: $100/month
- **Reality check**: You'll be upgrading to $200/month faster than you can say "agentic workflow"
- **Worth it?** Hell yes. This is the best investment in your productivity you'll ever make.

---

## 🚀 THE SETUP

### 2. Enable God Mode with `--dangerously-skip-permissions`
```bash
# The flag that changes everything
claude --dangerously-skip-permissions

# This bypasses ALL permission prompts
# Lets you enter deep agentic flows without interruption
# No more "Are you sure?" - Claude just DOES IT
```

**🔥 PRO TIP: Set up an alias**
```bash
# Add this to your ~/.zshrc or ~/.bashrc
alias claude='claude --dangerously-skip-permissions'

# Now just type 'claude' and you're in God Mode by default
# This is the way
```

### 3. Upgrade to Opus
```bash
# In any Claude Code session, run:
/model

# Select Opus
# This sets it as default for ALL future sessions
# Never settle for less than the best model
```

---

## 🧠 THE KNOWLEDGE

### 1. Master the Claude.md System
```bash
# Global instructions that apply to ALL projects
~/.claude/CLAUDE.md

# Project-specific instructions
/your-project/CLAUDE.md

# Folder-specific instructions (yes, they inherit!)
/your-project/subfolder/CLAUDE.md
```

**Pro tip**: These files cascade. Global → Project → Folder. Each level can override or extend the previous.

### 2. Unlock Autonomous Agents with `claude -p` (Print Mode)
```bash
# The -p flag = NON-INTERACTIVE mode
# Claude executes once and exits - perfect for automation

# Run with direct prompt
claude -p "Generate daily standup notes"

# Run with instruction file
claude -p /path/to/complex_workflow.md

# Pipe data into Claude
cat logs.txt | claude -p "Analyze these logs for errors"

# Get JSON output for programmatic use
claude -p --output-format json "What tasks need attention today?"
```

**🤖 CRON JOB MAGIC**
```bash
# Add to crontab for daily automation
0 9 * * * claude -p /home/user/daily_agent_tasks.md

# Combine with the God Mode flag for zero friction
0 */4 * * * claude --dangerously-skip-permissions -p /home/user/monitor_system.md
```

**The Secret**: Create markdown files with complex instructions. Reference other files within them. Chain multiple operations. This is how the agents-md framework was born - turning Claude into an autonomous workforce.

### 3. Claude as a JSON API 
```bash
# The hidden superpower - Claude can return structured data!

# Ask for specific JSON structure
claude -p "Return JSON: {name: string, score: number, tags: string[]}"

# Fill in templates
echo '{"task": "", "priority": "", "due": ""}' > template.json
claude -p "Fill this template based on my last message: $(cat template.json)"

# Extract clean JSON (no markdown wrapper)
claude -p --output-format json "Return user profile JSON" | jq -r '.result'
```

**🔥 THE GAME CHANGER**
```bash
# Turn Claude into a data transformation pipeline
cat logs.txt | claude -p "Extract errors as JSON array" | jq '.[] | .message'

# Build your own AI-powered APIs
get_metrics() {
  claude -p --output-format json "System metrics as {cpu: number, memory: number}" | 
  jq -r '.result'
}

# Now other scripts can consume structured data from Claude!
METRICS=$(get_metrics)
```

This is how you build AI-native automation - Claude becomes your JSON-speaking backend.

### 4. Forget MCPs - Build Your Own CLIs
- **MCPs = Overengineered garbage**
- **Native gh CLI = Already integrated perfection**
- **The way**: Build your own CLI tools

> "You will never touch GitHub's web interface again. 90% of your life will be in the terminal. This is the way."

---

## 🛠️ THE TOOLS

### Terminal Setup
- **Ghostty**: The terminal of choice
  - Beautiful shortcuts
  - Multiple tabs with multiple sessions
  - Built for speed

### Native GitHub Integration
```bash
# You don't need to know ANY gh commands!
# Just tell Claude what you want:

"Create a PR for this branch"
"What issues are open?"
"Clone that repo I mentioned"
"Merge PR #42"
"Close all stale issues"

# Claude knows all the gh commands so you don't have to
# This is the real magic - GitHub becomes conversational
```

---

## 🎭 THE MINDSET

1. **Terminal is life** - If you're using a GUI, you're doing it wrong
2. **Automate everything** - If you do it twice, write a CLI for it
3. **Claude is your pair** - Not your assistant, your partner in crime
4. **Speed is king** - Every click is wasted time

---

## 🔮 THE FUTURE

Once you understand these fundamentals:
- You'll build tools faster than you can document them
- Your productivity will 10x (not hyperbole)
- You'll look at people using web interfaces with pity
- You'll wonder how you ever lived without this

---

## 🤝 WELCOME TO THE FAMILY

You're not just using a tool. You're joining a movement. A way of thinking. A philosophy of maximum efficiency and minimal friction.

**Remember**: With great power comes great productivity. Use it wisely.

---

*"The terminal is not just where we work. It's where we live."*  
— The Claude Code Mafia
