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

## Essential Workflow

1. **Start with context**: Use `@filename` to reference specific files
2. **Be specific**: Provide clear requirements and constraints
3. **Use thinking mode**: Say "think" for complex problems
4. **Leverage todos**: Let Claude manage task lists for complex work
5. **Iterate incrementally**: Break large changes into smaller steps

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