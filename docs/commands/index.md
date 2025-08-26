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
- **@prd.md** - Product Requirements Document generation with strategic analysis
- **@state_tracker.md** - Visual phase-based progress tracking with emoji states

## Why Use Commands?

### Consistency & Quality
Every command applies proven patterns and best practices consistently across projects.

### Efficiency & Speed  
Skip context-setting and jump straight into high-quality execution with the right mindset.

### Team Alignment
Shared commands ensure everyone follows the same processes and maintains quality standards.

### Continuous Improvement
Commands can be refined and improved over time, benefiting the entire team.

## Command Design Principles

### 1. **Fail-Fast Design** ⚡
- Validate inputs immediately and provide clear error messages
- Check prerequisites before starting execution
- Stop early on validation failures with actionable guidance

### 2. **Context Preservation** 🔄
- Maintain conversation context throughout execution
- Pass relevant context to agents and sub-processes
- Preserve project state and configuration

### 3. **Agent Delegation** 🤖
- Use agents for heavy processing and analysis tasks
- Keep command logic focused on orchestration
- Return concise results from agent processing

### 4. **Consistent Structure** 📋
- Follow standardized command templates
- Use clear naming conventions
- Provide predictable output formats

## Command Creation Template

Create commands using this standardized structure in `.claude/commands/`:

```markdown
---
# Frontmatter: Define allowed tools and configuration
tools:
  - Read
  - Write
  - Bash
  - Task
description: "Brief description of command purpose"
category: "development" # or testing, deployment, etc.
---

## Usage
`@command-name.md <REQUIRED_PARAM> [OPTIONAL_PARAM]`

## When to Use
- Specific scenario 1 when this command is appropriate
- Specific scenario 2 when this command adds value
- Clear indicators that this command should be chosen

## Context
- Primary input: $ARGUMENTS
- Project-specific context and constraints
- Dependencies and prerequisites

## Your Role
You are a [specific specialist role] focused on [domain expertise].

## Process
1. **Input Validation**: Verify all required parameters and prerequisites
2. **Planning**: [Specific planning steps for this command]
3. **Execution**: [Core execution logic]
4. **Validation**: [Quality checks and verification]
5. **Output**: [Standardized output format]

## Error Handling
- Invalid input: [Specific error message and guidance]
- Missing prerequisites: [Clear instructions to resolve]
- Execution failures: [Rollback procedures and next steps]

## Output Format
- **Primary Result**: [Main deliverable description]
- **Status Information**: [Progress and completion indicators]  
- **Next Steps**: [Clear actionable follow-up items]
```

## Naming Conventions

### Recommended Patterns
- **@category-action.md** - General pattern for clear categorization
- **@deploy-check.md** - Action-focused commands
- **@code-review.md** - Process-focused commands  
- **@project-init.md** - Lifecycle commands

### Category Guidelines
- **code-*** - Implementation and development
- **test-*** - Testing and quality assurance
- **deploy-*** - Deployment and operations
- **review-*** - Analysis and validation
- **debug-*** - Troubleshooting and diagnosis

## Advanced Command Development

Once you've mastered the basics, explore these advanced patterns:

- **[Personal Commands](/commands/personal-commands)** - Build portable workflows that work across all projects
- **[Command Patterns](/commands/command-patterns)** - Master sophisticated composition and orchestration techniques

## Quick Setup Tools

For rapid command development and standardization:

- **[Claude Code Templates](https://github.com/davila7/claude-code-templates)** - 100+ ready-to-use command configurations and workflow patterns
- **[CCPM](/resources/tools#ccpm---claude-code-project-management)** - Advanced workflow system with GitHub Issues integration for complex command orchestration