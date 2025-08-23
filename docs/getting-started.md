# Getting Started

This guide will help you set up Claude Code for maximum effectiveness in your development workflow.

## Prerequisites

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
  "defaultModel": "claude-3-5-sonnet-20241022"
}
```

## Essential Workflow

1. **Start with context**: Use `@filename` to reference specific files
2. **Be specific**: Provide clear requirements and constraints
3. **Use thinking mode**: Say "think" for complex problems
4. **Leverage todos**: Let Claude manage task lists for complex work
5. **Iterate incrementally**: Break large changes into smaller steps

## Next Steps

- [Learn communication best practices](/best-practices/communication)
- [Set up your development workflow](/best-practices/workflow)
- [Explore configuration options](/best-practices/configuration)