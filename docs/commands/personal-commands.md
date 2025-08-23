# Personal Commands Cookbook

Master personal command patterns that enhance your daily development workflow with reusable, customizable automation.

## The Personal Command Philosophy

Personal commands stored in your global `~/.claude/commands/` directory travel with you across all projects, creating consistent workflows regardless of the codebase you're working in.

**Why Personal Commands?**
- **Consistency**: Same workflow patterns across all projects
- **Efficiency**: Skip repeated context-setting and jump to execution
- **Learning**: Codify your best practices into reusable patterns
- **Evolution**: Refine and improve your approach over time

## Core Personal Workflow Commands

### @morning.md - Daily Startup Routine

```markdown
## Usage
`@morning.md`

## Context
Starting a new development day with context awareness and priority setting.

## Your Role
You are a productivity assistant helping establish daily development focus and readiness.

## Process
1. **Check System Status**:
   - Review git status and any uncommitted changes
   - Check for pending updates or security issues
   - Validate development environment health

2. **Analyze Recent Context**:
   - Review recent commits and progress
   - Identify any blocked or incomplete tasks
   - Check for team communications or issues

3. **Plan Today's Focus**:
   - Suggest 2-3 priority tasks based on recent work
   - Identify any dependencies or blockers to address
   - Recommend order of operations for maximum productivity

4. **Setup Optimization**:
   - Verify development tools are current
   - Check for any environment issues
   - Ensure testing and build processes are working

## Output Format
- **Status Summary**: Brief project health overview
- **Today's Priorities**: 3 specific, actionable items
- **Environment Notes**: Any setup issues to address
- **Context Reminder**: Key project details for focused work
```

**Usage Example**:
```bash
@morning
# Provides personalized daily startup routine
# Analyzes your current project state
# Suggests priority tasks and potential blockers
```

### @focus.md - Deep Work Session Preparation

```markdown
## Usage
`@focus.md <TASK_DESCRIPTION>`

## Context
- Task to focus on: $ARGUMENTS
- Entering deep work mode requiring sustained concentration and minimal interruption

## Your Role
You are a focus coach and technical strategist helping optimize for deep work productivity.

## Process
1. **Task Breakdown**:
   - Decompose the task into 25-90 minute focused work blocks
   - Identify all dependencies and prerequisites
   - Plan the optimal sequence for sustained momentum

2. **Context Loading**:
   - Identify all relevant files and documentation needed
   - Prepare quick-access references for the task
   - Set up development environment for the specific work

3. **Distraction Mitigation**:
   - Identify potential interruptions or blockers
   - Prepare solutions or alternatives for common issues
   - Create task-specific notes for context preservation

4. **Success Metrics**:
   - Define clear completion criteria
   - Establish progress checkpoints
   - Plan validation and testing approach

## Output Format
- **Focus Plan**: Structured work blocks with time estimates
- **Context Setup**: Files and resources to have ready
- **Success Criteria**: Clear definition of completion
- **Backup Plans**: Alternative approaches if blocked
```

### @reflect.md - End-of-Day Analysis

```markdown
## Usage
`@reflect.md [WORK_SUMMARY]`

## Context
- Work completed today: $ARGUMENTS (optional)
- Reflecting on development progress, learnings, and planning improvements

## Your Role
You are a development coach helping extract learnings and optimize future productivity.

## Process
1. **Progress Analysis**:
   - Review commits and changes made today
   - Assess quality and completeness of work
   - Identify successful patterns and approaches

2. **Challenge Assessment**:
   - Document problems encountered and solutions found
   - Identify areas where efficiency could be improved
   - Note any technical debt or shortcuts taken

3. **Learning Extraction**:
   - Capture new techniques or insights gained
   - Document useful patterns or code solutions
   - Identify knowledge gaps to address

4. **Tomorrow's Preparation**:
   - Suggest logical next steps based on today's work
   - Identify dependencies or blockers to address
   - Recommend preparatory tasks for tomorrow's focus

## Output Format
- **Today's Achievements**: Concrete accomplishments and progress
- **Challenges & Solutions**: Problems solved and approaches used
- **Key Learnings**: Technical insights and pattern discoveries
- **Tomorrow's Setup**: Recommended next steps and preparation
```

## Domain-Specific Personal Commands

### @api-design.md - API Development Accelerator

```markdown
## Usage
`@api-design.md <API_DESCRIPTION>`

## Context
- API requirements: $ARGUMENTS
- Following RESTful principles and OpenAPI standards
- Focus on developer experience and production readiness

## Your Role
You are a senior API architect with expertise in scalable, maintainable API design.

## Process
1. **Requirements Analysis**:
   - Extract core resources and relationships
   - Identify authentication and authorization needs
   - Plan for versioning and backwards compatibility

2. **OpenAPI Specification**:
   - Create comprehensive OpenAPI 3.0 specification
   - Include detailed request/response schemas
   - Document all error conditions and status codes

3. **Implementation Strategy**:
   - Suggest optimal framework and patterns
   - Plan middleware for common concerns (auth, logging, validation)
   - Design data layer integration approach

4. **Developer Experience**:
   - Create example requests and responses
   - Plan comprehensive documentation
   - Design client SDK generation strategy

## Output Format
- **OpenAPI Specification**: Complete API contract
- **Implementation Plan**: Framework and architecture recommendations
- **Example Usage**: Realistic request/response examples
- **Next Steps**: Development and testing strategy
```

### @db-design.md - Database Schema Architect

```markdown
## Usage
`@db-design.md <DATABASE_REQUIREMENTS>`

## Context
- Database requirements: $ARGUMENTS
- Optimizing for performance, scalability, and maintainability
- Following normalization principles with practical performance considerations

## Your Role
You are a database architect specializing in scalable schema design and query optimization.

## Process
1. **Entity Modeling**:
   - Identify core entities and relationships
   - Design normalized schema with appropriate indexes
   - Plan for common query patterns and performance

2. **Migration Strategy**:
   - Create safe, reversible migration scripts
   - Plan for data migration and transformation
   - Consider zero-downtime deployment requirements

3. **Performance Optimization**:
   - Design indexes for common query patterns
   - Plan partitioning strategies for large tables
   - Consider caching layers and read replicas

4. **Data Integrity**:
   - Implement appropriate constraints and validations
   - Design audit trails and soft delete strategies
   - Plan backup and recovery procedures

## Output Format
- **Schema Design**: Complete table structures with relationships
- **Migration Scripts**: Safe, reversible database changes
- **Performance Plan**: Indexing and optimization strategy
- **Maintenance Guide**: Backup, monitoring, and scaling approach
```

### @component.md - React Component Factory

```markdown
## Usage
`@component.md <COMPONENT_DESCRIPTION>`

## Context
- Component requirements: $ARGUMENTS
- Following React best practices and project patterns
- Optimizing for reusability, performance, and accessibility

## Your Role
You are a React expert focused on creating maintainable, accessible, and performant components.

## Process
1. **Component Design**:
   - Analyze requirements and break down into props interface
   - Design component API for maximum reusability
   - Plan state management and lifecycle needs

2. **Implementation**:
   - Create TypeScript component with comprehensive types
   - Implement accessibility features (ARIA, keyboard navigation)
   - Optimize for performance (memoization, lazy loading)

3. **Testing Strategy**:
   - Unit tests for component logic and behavior
   - Accessibility tests with @testing-library
   - Visual regression tests for UI consistency

4. **Documentation**:
   - Storybook stories for all component variants
   - Usage examples and best practices
   - Props documentation with TypeScript types

## Output Format
- **Component Implementation**: Complete TypeScript React component
- **Test Suite**: Comprehensive testing coverage
- **Storybook Stories**: Interactive documentation
- **Usage Guide**: Integration examples and best practices
```

## Advanced Personal Automation

### @commit-assist.md - Intelligent Commit Helper

```markdown
## Usage
`@commit-assist.md [COMMIT_TYPE]`

## Context
- Commit type focus: $ARGUMENTS (optional: feat, fix, refactor, docs, test, etc.)
- Analyzing staged changes for intelligent commit message generation
- Following Conventional Commits specification

## Your Role
You are a git workflow specialist helping create meaningful, searchable commit history.

## Process
1. **Change Analysis**:
   - Analyze all staged changes using git diff
   - Identify the primary purpose and scope of changes
   - Detect any breaking changes or important side effects

2. **Commit Classification**:
   - Determine appropriate conventional commit type
   - Identify affected scope(s) within the project
   - Assess impact level and breaking change potential

3. **Message Generation**:
   - Create descriptive commit subject line (<50 chars)
   - Generate detailed commit body explaining the "why"
   - Include any breaking change notes or migration info

4. **Quality Validation**:
   - Verify all changes are related and belong together
   - Suggest splitting if commit includes unrelated changes
   - Validate commit follows project conventions

## Output Format
- **Proposed Commit Message**: Ready-to-use conventional commit format
- **Change Summary**: Analysis of what was modified and why
- **Recommendations**: Suggestions for commit optimization
- **Split Suggestions**: If commit should be divided
```

### @pr-prep.md - Pull Request Preparation

```markdown
## Usage
`@pr-prep.md <PR_DESCRIPTION>`

## Context
- Pull request scope: $ARGUMENTS
- Preparing comprehensive PR for team review
- Following project contribution guidelines

## Your Role
You are a code review facilitator helping create high-quality pull requests.

## Process
1. **Change Assessment**:
   - Analyze all commits in the feature branch
   - Verify all changes align with stated PR objective
   - Identify any missing or incomplete work

2. **Quality Validation**:
   - Run automated tests and linting
   - Perform self-review for obvious issues
   - Verify documentation is updated if needed

3. **PR Documentation**:
   - Create comprehensive PR description
   - Document testing performed and results
   - Highlight any breaking changes or migration needs

4. **Review Preparation**:
   - Identify reviewers based on code areas touched
   - Create testing instructions for reviewers
   - Anticipate questions and provide context

## Output Format
- **PR Title**: Descriptive, searchable pull request title
- **PR Description**: Comprehensive description with context
- **Testing Instructions**: How to validate the changes
- **Review Notes**: Important context for reviewers
```

### @debug-session.md - Systematic Debugging

```markdown
## Usage
`@debug-session.md <BUG_DESCRIPTION>`

## Context
- Bug to investigate: $ARGUMENTS
- Following systematic debugging methodology
- Focus on root cause identification, not just symptom fixes

## Your Role
You are a debugging expert using scientific method to identify and resolve issues.

## Process
1. **Problem Definition**:
   - Clearly define the expected vs actual behavior
   - Identify all symptoms and error messages
   - Establish reproduction steps and conditions

2. **Hypothesis Generation**:
   - List potential root causes based on symptoms
   - Prioritize hypotheses by likelihood and impact
   - Plan targeted tests to validate/invalidate each hypothesis

3. **Systematic Investigation**:
   - Execute tests in order of hypothesis priority
   - Gather evidence that supports or refutes each theory
   - Document findings and eliminate possibilities

4. **Solution Implementation**:
   - Implement targeted fix based on confirmed root cause
   - Create regression tests to prevent recurrence
   - Validate fix resolves all related symptoms

## Output Format
- **Problem Statement**: Clear definition of the issue
- **Investigation Plan**: Systematic approach to diagnosis
- **Findings**: Evidence gathered and conclusions drawn
- **Solution**: Root cause fix with validation approach
```

## Personal Productivity Patterns

### Command Chaining for Complex Workflows

```bash
# Morning routine with immediate focus
@morning && @focus "Implement user authentication system"

# Development cycle with quality gates
@api-design "User management API" && @test-first "User API endpoints" && @implement

# End of day routine with tomorrow's prep
@reflect "Completed authentication API, started frontend integration" && @commit-assist
```

### Context-Preserving Session Management

```bash
# Save current context when switching tasks
@context-save "auth-implementation" && @focus "Bug fix: payment processing error"

# Restore context when returning to original task  
@context-restore "auth-implementation" && @continue-work
```

### Learning and Knowledge Management

```bash
# Capture and organize learnings
@learn "Advanced React patterns from today's component refactoring"

# Create personal reference from solution
@bookmark "JWT refresh token implementation pattern" --tags "auth,security,patterns"

# Weekly knowledge review and organization
@knowledge-review --week
```

## Advanced Personal Command Patterns

### Dynamic Command Generation

Create commands that generate other commands based on project patterns:

```markdown
## @scaffold-command.md - Personal Command Generator

## Usage
`@scaffold-command.md <COMMAND_NAME> <COMMAND_PURPOSE>`

## Process
1. Analyze project patterns and conventions
2. Generate command template following personal style
3. Include appropriate context and role definitions
4. Add project-specific customizations
5. Create usage examples and documentation

## Output
Complete command file ready for use in ~/.claude/commands/
```

### Adaptive Personal Workflows

Commands that learn and adapt based on your working patterns:

```markdown
## @optimize-workflow.md - Workflow Analysis and Improvement

## Usage
`@optimize-workflow.md`

## Process
1. Analyze recent command usage patterns
2. Identify frequently repeated task sequences
3. Suggest new commands or command improvements
4. Recommend workflow optimizations
5. Generate metrics on productivity patterns

## Output
- **Usage Patterns**: Analysis of command frequency and combinations
- **Optimization Suggestions**: Recommended improvements
- **New Command Ideas**: Patterns that could be automated
- **Productivity Metrics**: Insights into working patterns
```

These personal commands create a powerful, evolving toolkit that adapts to your development style and continuously improves your productivity across all projects.

## Related Topics

### Foundation
- [Commands Overview](/commands/) - Basic command concepts and structure
- [Getting Started](/getting-started) - Initial Claude Code setup
- [Best Practices: Workflow](/best-practices/workflow) - Effective development patterns

### Advanced Command Development
- [Command Patterns](/commands/command-patterns) - Sophisticated composition techniques
- [Automation Recipes](/hooks/automation-recipes) - Hook-based automation systems
- [Custom Agents](/advanced/custom-agents) - Specialized AI assistants

### Complete Workflows
- [Idea to Production](/advanced/idea-to-production) - End-to-end project development
- [Subagent Patterns](/agents/subagent-patterns) - Multi-agent coordination systems
- [Real-World Examples](/examples/real-world-examples) - Production case studies

### Implementation Support
- [Project Lifecycle Management](/advanced/project-lifecycle) - Systematic project coordination
- [Workflow Automation](/advanced/automation) - Advanced automation techniques