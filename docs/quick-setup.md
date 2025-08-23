# Quick Setup

Get Claude Code working effectively in your project in under 5 minutes.

## 1. Create Essential Files

Copy and customize these three essential files:

### CLAUDE.md
```markdown
# CLAUDE.md

This file provides guidance to Claude Code when working with this repository.

## Project Overview
[Describe your project briefly - what it does, main technology stack]

## Development Commands
- `npm run dev` - Start development server
- `npm test` - Run tests  
- `npm run build` - Build for production

## Key Architecture
[Brief notes about important patterns, file organization, or conventions]
```

### .mcp.json
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

### .claude/settings.local.json
```json
{
  "allowedTools": ["*"],
  "autoAccept": false
}
```

## 2. First Commands to Try

Test your setup with these commands:

```bash
# Start Claude Code in your project directory
claude

# Try referencing a file
@package.json show me the project structure

# Use thinking mode for complex questions
think about the best way to organize this project

# Let Claude create a task list
Help me set up testing for this project
```

## 3. Immediate Workflow Tips

- **Start specific**: "Add a function to validate email addresses" vs "help with validation"
- **Reference files**: Use `@filename` to give Claude context about specific files
- **Use todos**: Let Claude break complex tasks into manageable steps
- **Iterate**: Make small changes, review, then continue

## Done!

You're ready to start using Claude Code effectively. For more detailed guidance, explore the [full best practices](/best-practices/) sections.