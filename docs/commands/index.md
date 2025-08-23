# Commands

Master Claude Code's command system to create reusable workflows, automate repetitive tasks, and build powerful project-specific tools.

## Overview

Claude Code commands are reusable prompts that can be invoked with simple slash commands. They enable you to standardize workflows, share team practices, and build sophisticated automation.

This guide showcases a comprehensive command library that demonstrates the power of well-designed commands for development workflows.

## Command Categories

### Development Commands
Core development workflow commands for coding, debugging, testing, and deployment.

- **@code.md** - Implementation with multi-agent coordination
- **@debug.md** - Systematic debugging and root cause analysis  
- **@test.md** - Comprehensive testing strategy and coverage
- **@optimize.md** - Performance optimization with measurement
- **@refactor.md** - Strategic code improvement and modernization
- **@review.md** - Multi-dimensional code quality review
- **@deploy-check.md** - Deployment readiness validation

### Specialized Commands
Advanced commands for specific domains and complex workflows.

- **@ask.md** - Senior systems architect consultation
- **@goals.md** - Project coordination with team management

## Why Use Commands?

### Consistency & Quality
Every command applies proven patterns and best practices consistently across projects.

### Efficiency & Speed  
Skip context-setting and jump straight into high-quality execution with the right mindset.

### Team Alignment
Shared commands ensure everyone follows the same processes and maintains quality standards.

### Continuous Improvement
Commands can be refined and improved over time, benefiting the entire team.

## Quick Start

Create your first command in `.claude/commands/`:

```markdown
## Usage
`@my-command.md <DESCRIPTION>`

## Context
- Task description: $ARGUMENTS
- Project patterns and conventions will be followed

## Your Role
You are a specialist focused on [specific task area].

## Process
1. Analyze the requirements
2. Plan the implementation
3. Execute with best practices
4. Provide clear documentation

## Output Format
- Clear implementation
- Documentation
- Testing guidance
- Next steps
```