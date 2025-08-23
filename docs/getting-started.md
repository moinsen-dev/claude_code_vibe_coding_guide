# Getting Started

Welcome to Claude Code! Whether you're a complete beginner or experienced developer, this guide will help you start building amazing software with AI assistance.

## Choose Your Starting Point

### 🌱 **Complete Beginner** (No coding experience)
**Perfect for:** Entrepreneurs, business owners, creative professionals, or anyone with great ideas

👉 **[Start Here: Beginner's Guide to Building Your First App](/getting-started/absolute-beginner)**

Learn to transform your ideas into working software using simple, conversational English. No coding knowledge required!

### 👩‍💻 **Developer** (Some coding experience)
**Perfect for:** Programmers, web developers, software engineers

Continue with the developer setup below to configure Claude Code for your existing workflow.

---

## Developer Setup

This section helps you set up Claude Code for maximum effectiveness in your development workflow.

### Prerequisites

- [Claude Code installed](https://docs.anthropic.com/en/docs/claude-code/installation)
- Active Claude subscription (Pro or Max recommended for best experience)
- Git repository for your project

## Initial Setup

### 1. Create CLAUDE.md

Every project should have a `CLAUDE.md` file in the root directory:

```markdown
# CLAUDE.md

This file provides guidance to Claude Code when working with code in this repository.

## Project Overview
Brief description of what this project does and its main components.

## Development Commands
- `npm run dev` - Start development server
- `npm test` - Run tests
- `npm run build` - Build for production
- `npm run lint` - Run linting

## Architecture Notes
Key architectural decisions, patterns, and conventions used in this codebase.
```

### 2. Configure MCP Servers

Create `.mcp.json` in your project root to enable additional capabilities:

```json
{
  "mcpServers": {
    "browsermcp": {
      "command": "npx",
      "args": ["@browsermcp/mcp@latest"]
    },
    "sequential-thinking": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sequential-thinking"]
    }
  }
}
```

### 3. Set Local Settings

Create `.claude/settings.local.json` for project-specific preferences:

```json
{
  "allowedTools": ["*"],
  "autoAccept": false,
  "defaultModel": "claude-3-5-sonnet-20251022"
}
```

## Two Proven Workflows

Choose the approach that matches your working style:

### 🚀 **Quick Start Workflow** (Recommended for experienced developers)

1. **Start with context**: Use `@filename` to reference specific files
2. **Be specific**: Provide clear requirements and constraints
3. **Use thinking mode**: Say "think" for complex problems
4. **Leverage todos**: Let Claude manage task lists for complex work
5. **Iterate incrementally**: Break large changes into smaller steps

### 📋 **7-Stage Structured Workflow** (Recommended for new projects)

This comprehensive approach ensures thorough planning and successful execution:

#### Stage 1: Define Vision & Purpose
```
"I want to build [your project idea]. Let's start by clarifying the core purpose and main features."
```
- Clarify the problem you're solving
- Define target users and their needs
- Identify core features vs. nice-to-haves

#### Stage 2: Research & Validate
```
"Help me research existing solutions and validate this approach before we start building."
```
- Study similar projects and competitors
- Identify potential technical challenges
- Validate assumptions with market research

#### Stage 3: Plan Architecture
```
"Based on our research, let's design the technical architecture and choose our tech stack."
```
- Choose appropriate technologies and frameworks
- Design database schema and API structure
- Plan component hierarchy and data flow

#### Stage 4: Create Project Context
Update your `CLAUDE.md` with:
```markdown
## Project Vision
[Brief description of what you're building and why]

## Tech Stack
- Frontend: [e.g., React + TypeScript + Tailwind]
- Backend: [e.g., Node.js + Express + PostgreSQL]
- Deployment: [e.g., Vercel + Railway]

## Architecture Decisions
- [Key patterns and conventions to follow]
- [Security considerations]
- [Performance requirements]
```

#### Stage 5: Iterative Build Loop
```
"Let's implement [specific feature] following our established patterns."
```
- Build one feature at a time
- Test each feature before moving to the next
- Commit working code frequently

#### Stage 6: Test & Refine
```
"Let's review what we built and identify areas for improvement."
```
- Run comprehensive tests
- Check performance and security
- Refine user experience based on testing

#### Stage 7: Deploy & Monitor
```
"Help me deploy this to production and set up monitoring."
```
- Set up CI/CD pipeline
- Configure production environment
- Implement monitoring and analytics

### 💡 **Success Tips for Both Workflows**

- **Start fresh for major features**: Use `/clear` or start new sessions
- **Be explicit about scope**: Tell Claude exactly what to change and what to leave alone
- **Iterate, don't perfect**: Accept good solutions and refine them later
- **Use version control aggressively**: Commit working changes frequently
- **Cost-conscious prompting**: Focus on one file/component at a time to manage token usage

## Next Steps

### Essential Learning Path
- [Learn communication best practices](/best-practices/communication)
- [Set up your development workflow](/best-practices/workflow)
- [Explore configuration options](/best-practices/configuration)

### Power User Features
- [Personal commands for consistent workflows](/commands/personal-commands)
- [Intelligent automation with hooks](/hooks/)
- [Multi-agent collaboration with subagents](/agents/subagent-patterns)

### Complete Project Workflows
- [From idea to production deployment](/advanced/idea-to-production)
- [Real-world examples and case studies](/examples/real-world-examples)

### For Business Leaders
- [Business case for AI-assisted development](/business/) - ROI analysis and executive summary
- [Enterprise deployment strategies](/business/enterprise-solutions) - Vendor comparison and risk management