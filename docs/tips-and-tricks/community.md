# Community Tips and Tricks

Advanced techniques and insights from experienced Claude Code practitioners and community leaders.

## Sub-Agent Best Practices

*Contributed by: Community Expert Jason (AI Builder Club)*

Sub-agents are one of Claude Code's most powerful but often misunderstood features. Here are battle-tested strategies for maximizing their effectiveness.

### Understanding Sub-Agent Purpose

::: tip Core Principle: Sub-Agents Are Researchers, Not Implementers
The key insight is to treat sub-agents primarily as specialized researchers rather than direct implementers. They excel at:
- Deep codebase analysis
- Context gathering and synthesis 
- Implementation planning and design
- Domain-specific research with latest documentation

**Avoid:** Having sub-agents do direct implementation that requires iteration and debugging
**Prefer:** Having sub-agents create detailed implementation plans for the main agent to execute
:::

### Context Engineering for Sub-Agents

::: info File System as Context Management
Use the file system as your "ultimate context management system":

```markdown
# Recommended structure:
docs/claude/
├── task/
│   └── context-session.md    # Current project context
├── research/
│   ├── stripe-integration.md # Sub-agent research reports
│   ├── tailwind-design.md   
│   └── vercel-ai-sdk.md
└── plans/
    ├── api-implementation.md  # Implementation plans
    └── ui-components.md
```

**Benefits:**
- Context persists across sessions
- Main agent can reference detailed research
- Avoids token-heavy conversation history
- Enables context sharing between agents
:::

### Token Optimization Strategy

::: warning The 80% Context Problem
Before sub-agents, Claude Code often consumed 80% of context window with file reads before starting implementation, leading to:
- Frequent conversation compaction
- Loss of important context
- Degraded performance

**Solution:** Sub-agents consume tokens in isolated sessions and return condensed summaries.
:::

::: tip Context Compression Pattern
Instead of including massive file contents in main conversation:

```markdown
# Before (Token Heavy):
Main Agent: *reads 15 files, 50,000 tokens*
Main Agent: *implements solution with limited context*

# After (Optimized):
Main Agent: Delegates research to sub-agent
Sub-Agent: *reads files in isolated session*
Sub-Agent: Returns 500-token summary with key insights
Main Agent: Implements with focused, actionable context
```
:::

### Specialized Sub-Agent Design

::: info Create Service-Specific Experts
Design sub-agents as domain experts with embedded knowledge:

**ShadCN Expert:**
- MCP tools for component retrieval
- Latest design patterns and examples
- Embedded best practices documentation

**Vercel AI SDK Expert:**  
- Latest v5 documentation embedded
- Migration guides from v4 to v5
- Common integration patterns

**Stripe Expert:**
- Payment processing best practices
- Webhook handling patterns
- PCI compliance guidelines
:::

### Sub-Agent Configuration Best Practices

::: tip System Prompt Structure
```markdown
# Goal Definition
Goal: Design and propose detailed implementation plan. Never do actual implementation.

# Process Rules
1. Always read context file first: docs/claude/task/context-session.md
2. Use specialized MCP tools for domain research
3. Save research report to: docs/claude/research/{domain}.md
4. Update context file with progress
5. Return structured summary for main agent

# Output Format
Final message should always be:
"I've created plan at {file_path}. Please read that first before proceeding."

# Implementation Rules
- NEVER do direct implementation
- NEVER call claude MCP client (avoid recursion)
- Focus on research and planning only
```
:::

### Context File Management

::: info Context File Pattern
Maintain a living context document that all agents reference:

```markdown
# docs/claude/task/context-session.md

## Project Overview
- Type: ChatGPT replica using ShadCN + Vercel AI SDK
- Current Phase: UI Implementation
- Architecture: Next.js 14, TypeScript, Tailwind

## Completed Tasks
- [x] Initial project setup
- [x] ShadCN UI research (see research/shadcn-design.md)
- [x] Base chat interface implemented

## Current Status
- Working on: Vercel AI SDK integration
- Next: Real-time streaming implementation
- Blockers: None

## Agent Assignments
- ShadCN Expert: UI component research and design patterns
- Vercel Expert: AI SDK integration planning
- Main Agent: Implementation execution based on sub-agent plans
```
:::

### Common Sub-Agent Pitfalls

::: danger Avoid These Mistakes

**Pitfall 1: Direct Implementation**
```markdown
❌ Bad: "Sub-agent, implement the user authentication system"
✅ Good: "Sub-agent, research auth patterns and create implementation plan"
```

**Pitfall 2: Cross-Agent Context Loss**
```markdown  
❌ Bad: Sub-agents working in isolation without shared context
✅ Good: All agents read/update shared context files
```

**Pitfall 3: Recursive Agent Calls**
```markdown
❌ Bad: Sub-agent tries to call other agents via MCP
✅ Good: Sub-agent focuses on its specialized domain only
```
:::

### Real-World Sub-Agent Workflow

::: tip Production-Ready Pattern

1. **Main Agent**: Creates context file with project requirements
2. **Domain Expert** (e.g., ShadCN): 
   - Reads context file
   - Uses MCP tools to research components
   - Creates detailed UI plan with component selections
   - Saves research to `docs/claude/research/ui-design.md`
   - Updates context file with progress
3. **Main Agent**: 
   - Reads the research report
   - Executes implementation based on detailed plan
   - Has full context for debugging and iteration

**Result:** High-fidelity implementation on first try, minimal token waste
:::

### Advanced Context Sharing

::: info Context Inheritance Strategy
```markdown
# Parent Context (Always Stable)
Project fundamentals, tech stack, architecture decisions

# Session Context (Updated by agents)  
Current sprint, active features, progress status

# Task Context (Dynamic)
Specific research findings, implementation details

# Agent Context (Specialized)
Domain-specific knowledge, tool configurations
```
:::

### MCP Tool Integration

::: tip Specialized MCP Setup
Configure domain-specific MCP servers for sub-agents:

```json
// .claude/config.json
{
  "agents": {
    "shadcn-expert": {
      "mcp_servers": ["shadcn-components", "tailwind-designs"],
      "tools": ["read", "write", "search"]
    },
    "stripe-expert": {
      "mcp_servers": ["stripe-docs", "payment-patterns"],
      "tools": ["read", "write", "webhook-validator"]
    }
  }
}
```
:::

### Performance Metrics

::: info Success Indicators
Track these metrics to optimize your sub-agent system:

**Efficiency Metrics:**
- First-attempt success rate (target: >80%)
- Token consumption reduction (target: 60% savings)
- Context retention across sessions

**Quality Metrics:**  
- Implementation accuracy from sub-agent plans
- Reduced debugging iterations
- Consistent coding patterns across features
:::

## Advanced Workflow Patterns

### Multi-Provider Research

::: tip Cross-Reference Strategy
When working with multiple services, have sub-agents cross-reference their findings:

```markdown
1. Stripe Expert: Research payment integration patterns
2. Vercel Expert: Research API route best practices
3. Context Merger: Combine insights for unified implementation plan
```
:::

### Context Evolution Tracking

::: info Version Your Context
```markdown
## Context History
v1.0: Initial ChatGPT replica concept
v1.1: Added real-time streaming requirements  
v1.2: Integrated payment processing requirements
v2.0: Migration to microservices architecture

## Current Context: v2.0
[Latest project state and requirements]
```
:::

### Team Collaboration

::: tip Shared Sub-Agent Library
Create reusable sub-agents for team use:

```bash
# Project-specific agents (shared via git)
.claude/agents/
├── frontend-expert.json
├── api-designer.json  
└── deployment-specialist.json

# Personal agents (not shared)
~/.claude/agents/
├── my-debugging-helper.json
└── my-code-reviewer.json
```
:::

## CLI & Terminal Mastery

### Command Line Excellence

::: tip CLI Integration Patterns
**Headless Mode:**
```bash
# Run Claude Code in headless mode for automation
claude -p "analyze codebase and generate report"

# Chain with other CLI tools
git diff | claude "explain these changes"

# Multiple instances for parallel work
claude --session frontend &
claude --session backend &
```

**Advanced CLI Usage:**
- Pass command-line arguments to run on startup
- Chain Claude Code with other CLI tools seamlessly  
- Pipe data into Claude Code for processing
- Run multiple instances simultaneously for different tasks
:::

### Screenshot & Visual Workflow

::: info Visual Development Flow
**macOS Screenshot Integration:**
```bash
# Quick screenshot workflow:
# 1. Shift+Cmd+Ctrl+4 → capture area
# 2. Ctrl+V in Claude terminal → paste image
# 3. Ask Claude to build the interface

# Automated screenshot workflow:
# Use Puppeteer MCP server for programmatic screenshots
```

**Screenshot-Driven Development:**
1. **Mockup Implementation** - Paste mockup → Claude builds interface
2. **Feedback Loops** - Build → Screenshot → Refine → Repeat
3. **Visual Debugging** - Screenshot errors → Claude analyzes and fixes
4. **Documentation** - Auto-generate visual docs from screenshots
:::

## Advanced MCP Integration

### Database & API Connections

::: tip Direct Database Access
```bash
# Connect directly to Postgres via MCP
claude --mcp postgres://user:pass@localhost/db

# Use API wrapper MCP servers
claude --mcp openai-api --mcp stripe-api
```

**Enterprise MCP Patterns:**
- Connect to live documentation systems (like Cloudflare)
- Use domain-specific MCP servers for specialized knowledge
- Fetch URLs for real-time information (e.g., game rules → logic)
:::

### MCP Server Roles

::: info Dual Role Capabilities
Claude Code can function as both:
- **MCP Client** - Consuming external MCP servers
- **MCP Server** - Providing services to other Claude instances

**Use Cases:**
- Team knowledge sharing through custom MCP servers
- Cross-project context sharing
- Specialized tool integrations
:::

## Workflow Optimization

### File & Directory Management

::: tip Smart File Handling
**Tab Completion:**
- Use tab completion for files and directories
- Be specific with naming (helps Claude understand context)

**Context Strategy:**
```bash
# Drag images directly into terminal (macOS)
# Use specific, descriptive file/directory names
# Leverage @ references for better context
```
:::

### Version Control Integration

::: info Git Workflow Excellence
**Aggressive Version Control:**
```bash
# Let Claude handle commits
claude "implement user auth, then commit with descriptive message"

# Frequent commits after every change
git add . && claude "review changes and commit"

# Let Claude write commit messages (they're excellent)
git add . && git commit -m "$(claude 'write commit message for staged changes')"
```

**Recovery Strategies:**
- Use version control more aggressively than normal
- Revert more often when things go wrong
- Clear conversation history and retry if things break badly
:::

### GitHub Integration

::: tip Seamless GitHub Workflow
**Two Approaches:**
1. **GitHub CLI Integration:**
```bash
# Install GitHub CLI for smooth interactions
gh auth login
claude "create PR for current branch"
```

2. **GitHub MCP Server:**
```bash
# Use MCP server for GitHub operations
claude --mcp github "review PR #123"
```

**Automated Workflows:**
- Let Claude file PRs for you with proper descriptions
- Let Claude review PRs and provide feedback
- Automate issue resolution workflows
:::

## Memory & Context Management

### Context Window Optimization

::: warning Context Management Strategy
**Monitor Auto-Compacting:**
- Watch for auto-compacting indicator during tasks
- Compact at natural breakpoints (after commits)
- Sometimes clear instead of compacting for fresh memory

**Best Practices:**
```markdown
# Use scratchpads to plan work
## Current Task
- [ ] Implement user authentication
- [ ] Add error handling  
- [ ] Write tests

# Alternative: Use GitHub issues for task tracking
# Benefit: Persistent across sessions
```
:::

### External Memory Systems

::: info Memory Augmentation
**File System as Memory:**
```bash
# Use claude.md strategically
echo "Current architecture decisions" >> CLAUDE.md
echo "Known issues and workarounds" >> CLAUDE.md

# Subdirectory-specific context
mkdir features/auth && echo "Auth module guidelines" > features/auth/CLAUDE.md
```

**Global vs Project Context:**
- Global: `~/.claude/CLAUDE.md` for personal preferences
- Project: `./CLAUDE.md` for team-shared context
- Feature: `./features/*/CLAUDE.md` for specific context
:::

## Cost & Performance Management

### Cost Optimization

::: tip Cost Control Strategies
**Token Monitoring:**
```bash
# Monitor context usage if paying per token
# Use external memory to reduce token consumption
# Leverage OpenTelemetry for team cost tracking

# Hook up to Datadog for usage dashboards
claude --telemetry datadog://api-key
```

**Best Cost Control:**
- Upgrade to Claude Max plan ($100–$200) for heavy usage
- Use MCP servers to reduce repetitive context loading
- Implement smart context compression strategies
:::

### Performance Patterns

::: info Slash Commands Excellence
**Template System:**
```bash
# Define in .claude/commands/
mkdir -p .claude/commands

# Example: GitHub issue solver
echo "Analyze issue #$ARGUMENTS and propose solution" > .claude/commands/issue.md

# Example: Code review template  
echo "Review $ARGUMENTS for: security, performance, maintainability" > .claude/commands/review.md
```

**Advanced Interpolation:**
- Pass command-line args into slash commands
- Use for refactoring, linting, PR reviews
- Create project-specific workflows
:::

## Emergency Recovery

### Failure State Management

::: warning When Things Go Wrong
**Recovery Hierarchy:**
1. **Hit Escape** - Stop Claude if it's drifting off course
2. **Use Undo** - Revert Claude's last action
3. **Revert Commits** - Use aggressive version control
4. **Clear History** - Start fresh if conversation is corrupted
5. **Fresh Session** - Sometimes a clean slate is best

**Prevention:**
- Save work frequently
- Use descriptive commit messages
- Maintain clean conversation context
:::

### CLAUDE.md Maintenance

::: tip Living Documentation
**Refactoring Strategy:**
```bash
# Regular maintenance
claude "review and optimize our CLAUDE.md file"

# Use Anthropic's Prompt Optimizer
claude "analyze CLAUDE.md and suggest improvements using prompt optimization"
```

**Content Strategy:**
- Include bash commands, style guides, linting rules
- Add etiquette and team preferences
- Keep it clean and specific (refactor often)
- Use `/init` to auto-generate initial version
:::

---

*Tips contributed by the Claude Code community and power users. Test thoroughly in your environment and adapt to your specific needs.*