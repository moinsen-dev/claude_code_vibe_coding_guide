# Agents

Harness the power of specialized AI agents to delegate tasks, maintain context, and create sophisticated collaborative workflows.

## Overview

Claude Code agents are specialized AI assistants that can be configured with specific roles, tools, and instructions. They enable delegation, specialization, and sophisticated multi-agent workflows.

## Agent Types

### Task Agents
Specialized agents for specific development tasks.

### Domain Agents
Agents with expertise in particular technologies or domains.

### Workflow Agents
Agents designed for complex, multi-step processes.

## Coming Soon

In-depth coverage of:

- **Agent Architecture** - Understanding agent design and capabilities
- **Custom Agents** - Building specialized agents for your projects
- **Multi-Agent Workflows** - Orchestrating collaborative agent systems
- **Tool Integration** - Configuring agent tool access and permissions
- **Team Collaboration** - Sharing and managing team agent libraries

## Quick Start

Create a custom agent in `.claude/agents/`:

```yaml
name: "code-reviewer"
description: "Specialized code review agent focusing on security and performance"
instructions: |
  You are a senior code reviewer with expertise in security, performance, and best practices.
  
  Always check for:
  - Security vulnerabilities
  - Performance bottlenecks
  - Code maintainability
  - Testing coverage
  
  Provide actionable feedback with specific examples.

tools:
  - name: "Read"
  - name: "Grep"
  - name: "Edit"
```

Invoke with:
```
/agent code-reviewer "Review the authentication module for security issues"
```