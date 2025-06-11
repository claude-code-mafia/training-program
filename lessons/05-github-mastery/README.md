# Lesson 05: GitHub Mastery - Never Leave the Terminal

## The Key Insight

You don't need to know ANY `gh` commands. Just tell Claude what you want in plain English.

## Natural Language GitHub

### Instead of Learning Commands
```bash
# ❌ OLD WAY: Memorize commands
gh pr create --title "Fix bug" --body "Description"
gh pr merge 123 --squash
gh issue close 456

# ✅ NEW WAY: Just talk to Claude
claude "Create a PR for this branch"
claude "Merge PR 42"
claude "Close all issues labeled as wontfix"
```

## Common Workflows

### Pull Request Management
```bash
# Creating PRs
claude "Create a PR for my current branch with a good description"
claude "Make a draft PR and request review from Sarah"

# Reviewing PRs
claude "Show me all open PRs that need my review"
claude "Add comments to PR 123 about the security concerns"

# Merging
claude "Squash and merge PR 456 after CI passes"
```

### Issue Management
```bash
# Creating issues
claude "Create an issue about the login bug we discussed"
claude "Open a feature request for dark mode"

# Searching issues
claude "What issues are assigned to me?"
claude "Find all bugs related to authentication"

# Bulk operations
claude "Label all issues older than 6 months as stale"
claude "Close all issues that have been inactive for a year"
```

### Repository Operations
```bash
# Cloning and forking
claude "Clone the React repo"
claude "Fork and clone kubernetes/kubernetes"

# Repository management
claude "Create a new private repo called my-secret-project"
claude "Add Jane as a collaborator with write access"
claude "Set up branch protection for main branch"
```

## Advanced Workflows

### Release Management
```bash
claude "Create a new release v2.0.0 with changelog from recent commits"
claude "Draft release notes based on PRs since last release"
```

### CI/CD Integration
```bash
claude "Show me failing GitHub Actions"
claude "Rerun the failed CI job"
claude "Why did the deployment workflow fail?"
```

### Project Management
```bash
claude "Create a project board for Q1 features"
claude "Move issue 789 to In Progress column"
claude "Generate a burndown chart for current sprint"
```

## The Real Magic

### Complex Multi-Step Operations
```bash
# One command instead of many
claude "Update all my PRs to fix merge conflicts with main"

# Automated workflows
claude "Every Friday, create an issue summarizing the week's merged PRs"

# Smart operations
claude "Find and fix all broken links in our documentation"
```

### Integration with Code Changes
```bash
# Claude handles the entire flow
claude "I fixed the bug in auth.js, create a PR"
# Claude will:
# 1. Commit your changes
# 2. Push to a new branch
# 3. Create a PR with proper description
# 4. Even suggest reviewers
```

## Pro Tips

1. **Be Descriptive**: "Create a PR" vs "Create a PR explaining the performance improvements"
2. **Chain Operations**: "Merge PR 123 and then delete the branch"
3. **Use Context**: Claude remembers your conversation, so you can reference "that PR we just discussed"

## Automation Examples

### Daily Standup
```bash
#!/bin/bash
claude -p "Generate my standup notes from yesterday's GitHub activity"
```

### PR Auto-Reviewer
```bash
# In your CI/CD
claude -p "Review this PR diff and comment on any potential issues: $(gh pr diff)"
```

### Issue Triage
```bash
# Weekly cron job
claude -p "Triage new issues: add labels, assign to team members based on expertise"
```

## The Bottom Line

> "If you're clicking around GitHub.com, you're doing it wrong."

Everything happens in the terminal. Claude is your interface. GitHub becomes conversational.

## Next Steps
- Continue to [Lesson 06: Build Your Own Tools](../06-build-your-own-tools/README.md)