# Lesson 07: Advanced Patterns & CLAUDE.md Mastery

## Understanding CLAUDE.md Inheritance

### The Cascade
```
~/.claude/CLAUDE.md          # Global (all projects)
    ↓
/project/CLAUDE.md           # Project-specific
    ↓
/project/feature/CLAUDE.md   # Feature-specific
```

Each level can override or extend the previous level.

## Global CLAUDE.md Setup

### Example Global Configuration
```markdown
# ~/.claude/CLAUDE.md

## Global Preferences
- Always use TypeScript over JavaScript
- Prefer functional programming patterns
- Use async/await over promises
- Never create files without explicit request

## Global Tools
- Use my custom CLI tools in ~/my-tools/bin
- Default to Postgres for database examples
- Use pytest for Python testing

## Security Rules
- Never commit secrets or API keys
- Always use environment variables for sensitive data
- Sanitize user input in all examples
```

## Project-Level CLAUDE.md

### Example Project Configuration
```markdown
# /my-project/CLAUDE.md

## Project Context
This is a React + FastAPI application for task management.

## Project Conventions
- Frontend: React with TypeScript, Tailwind CSS
- Backend: FastAPI with SQLAlchemy
- Testing: Jest for frontend, pytest for backend
- State management: Zustand

## Automated Tasks
When running daily checks:
1. Run both frontend and backend tests
2. Check for TypeScript errors
3. Validate API schema
4. Report bundle size

## Code Patterns
- API endpoints follow REST conventions
- All dates in ISO 8601 format
- Use UUID for all IDs
```

## Advanced CLAUDE.md Patterns

### 1. File References
```markdown
# CLAUDE.md

## Architecture
See architecture details in: ./docs/ARCHITECTURE.md

## API Patterns
Follow patterns defined in: ./api/PATTERNS.md

## When implementing new features
1. Read: ./docs/FEATURE_CHECKLIST.md
2. Follow: ./standards/CODE_STYLE.md
```

### 2. Conditional Instructions
```markdown
# CLAUDE.md

## Context-Aware Behavior

### When working on frontend files (*.tsx, *.ts in /src)
- Use React hooks appropriately
- Follow component structure in /src/components/Example.tsx

### When working on backend files (/api/**)
- Include proper error handling
- Add OpenAPI documentation
- Write integration tests

### When user mentions "production"
- Consider scalability
- Add proper logging
- Include monitoring hooks
```

### 3. Automation Triggers
```markdown
# CLAUDE.md

## Automated Workflows

### On file changes
- If changing API endpoints: update OpenAPI schema
- If changing database models: generate migration
- If changing UI components: update Storybook

### Daily automation tasks
1. Check for unused dependencies
2. Run security audit
3. Generate test coverage report
4. Update CHANGELOG.md
```

## Agent Patterns with CLAUDE.md

### Multi-Stage Agent Workflow
```markdown
# agent-workflow.md

## Stage 1: Analysis
1. Read all test files
2. Identify failing tests
3. Categorize by failure type

## Stage 2: Fix Generation
For each failing test:
1. Understand the failure
2. Locate relevant source code
3. Generate fix
4. Verify fix doesn't break other tests

## Stage 3: Validation
1. Run all tests
2. Check code coverage
3. Ensure no regression
4. Generate report
```

### Cron Job Integration
```bash
# Run complex multi-stage workflow
0 2 * * * claude --dangerously-skip-permissions -p /path/to/agent-workflow.md
```

## CLAUDE.md for Different Scenarios

### 1. Library Development
```markdown
# CLAUDE.md for a library

## Library Standards
- Maintain backward compatibility
- Every public API needs JSDoc
- Include TypeScript definitions
- Update CHANGELOG.md for every change

## Release Process
When user says "release":
1. Run full test suite
2. Update version in package.json
3. Generate changelog from commits
4. Create git tag
5. Build distribution files
```

### 2. DevOps Automation
```markdown
# CLAUDE.md for infrastructure

## Infrastructure Rules
- All resources must be tagged
- Use Terraform for provisioning
- Follow naming convention: env-service-resource

## Deployment Automation
On "deploy to <environment>":
1. Validate terraform plan
2. Check resource costs
3. Run security scan
4. Apply with approval
5. Update deployment tracker
```

### 3. Data Science Projects
```markdown
# CLAUDE.md for ML project

## Data Processing
- Always validate data types before processing
- Use pandas for data manipulation
- Log data quality metrics

## Model Development
- Start with baseline model
- Document all hyperparameters
- Version control model artifacts
- Generate performance reports
```

## Meta Patterns

### Self-Modifying CLAUDE.md
```bash
# Claude can update its own instructions
claude "Add a new rule to CLAUDE.md about error handling"
```

### Dynamic Instructions
```markdown
# CLAUDE.md

## Dynamic Behavior
Check ./config/current-sprint.json for sprint-specific focus areas
```

### Composition Patterns
```markdown
# CLAUDE.md

## Include Other Instructions
- Security: ./docs/SECURITY_RULES.md
- Performance: ./docs/PERFORMANCE_GUIDE.md
- Style: ./docs/STYLE_GUIDE.md
```

## The Ultimate Setup

### Your ~/.claude/CLAUDE.md
```markdown
# Global Claude Configuration

## Identity
You are a senior engineer who values:
- Code quality over speed
- Clarity over cleverness
- Security by default

## Universal Rules
1. Never create unnecessary files
2. Always follow existing patterns
3. Test before claiming completion
4. Explain only when asked

## Tool Preferences
- Editor: Use vim bindings when shown
- Shell: Assume zsh
- Package manager: Prefer npm over yarn

## Communication Style
- Be concise
- Skip preambles
- Get to the point
- Show, don't tell
```

## Next Steps

You now have all the tools to join the Claude Code Mafia:
1. Set up your global CLAUDE.md
2. Create project-specific instructions
3. Build your tool collection
4. Automate everything
5. Never leave the terminal again

Welcome to the family. 🔥