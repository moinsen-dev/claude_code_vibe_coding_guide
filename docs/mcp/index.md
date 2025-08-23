# MCP - Model Context Protocol

Extend Claude Code's capabilities with powerful MCP servers that provide specialized tools and integrations for enhanced development workflows.

## Overview

Model Context Protocol (MCP) servers extend Claude Code with additional capabilities through standardized interfaces. This section documents the MCP servers configured in your development environment and how to leverage them effectively.

## Configured MCP Servers

Your `.mcp.json` configuration includes three powerful MCP servers:

### [Browser MCP](/mcp/browsermcp) 
Automated browser interaction and visual comparison capabilities for web development and testing workflows.

### [Sequential Thinking](/mcp/sequential-thinking)
Enhanced reasoning and problem-solving through structured, multi-step thinking processes for complex challenges.

### [Time Server](/mcp/time)
Time zone management and conversion utilities for global development coordination and scheduling.

## MCP Benefits for Development

### 🤖 Automation Capabilities
- **Browser automation**: Screenshot capture, visual comparison, interaction testing
- **Process automation**: Multi-step reasoning, complex problem breakdown
- **Time coordination**: Cross-timezone scheduling and time calculations

### 🔧 Enhanced Workflows  
- **Visual testing**: Automated UI comparison and regression detection
- **Complex reasoning**: Systematic problem-solving for architectural decisions
- **Global coordination**: Time-aware development across distributed teams

### 🚀 Productivity Multipliers
- **Reduced manual work**: Automated visual testing and browser interactions
- **Better decision making**: Structured thinking processes for complex problems
- **Streamlined coordination**: Effortless time zone management

## Getting Started with MCP

### Installation
Your MCP servers are configured in `.mcp.json` and ready to use. No additional setup required.

### Usage Patterns
- **Browser MCP**: Use for visual testing, screenshot comparison, and web automation
- **Sequential Thinking**: Invoke for complex problem analysis and step-by-step reasoning  
- **Time Server**: Leverage for scheduling, timezone conversion, and time-aware workflows

### Integration with Commands
Many of your commands leverage MCP capabilities:
- Migration commands use **Browser MCP** for visual comparison
- Architecture decisions benefit from **Sequential Thinking**
- Global team coordination uses **Time Server** utilities

## MCP Best Practices

::: tip Leverage Automation
Use Browser MCP for tedious visual comparison tasks that would take hours manually.
:::

::: info Think Systematically  
Invoke Sequential Thinking for complex architectural decisions requiring structured analysis.
:::

::: warning Time Awareness
Always consider timezone implications when coordinating with global teams using Time Server.
:::

## Configuration Reference

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
    },
    "time": {
      "command": "uvx",
      "args": ["mcp-server-time"]
    }
  }
}
```

This configuration provides a powerful foundation for enhanced Claude Code workflows with automated capabilities and specialized tooling.