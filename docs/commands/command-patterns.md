# Advanced Command Patterns

Master sophisticated command composition patterns that create powerful, flexible workflows for complex development scenarios.

## Command Architecture Patterns

### The Multi-Stage Pipeline Pattern

**Concept**: Commands that orchestrate multi-step processes with validation gates and rollback capabilities.

```markdown
## @feature-pipeline.md - Complete Feature Development Pipeline

## Usage
`@feature-pipeline.md <FEATURE_DESCRIPTION>`

## Context
- Feature specification: $ARGUMENTS
- Following complete SDLC with quality gates
- Automated pipeline with manual approval points

## Process
1. **Analysis & Planning Phase**:
   - Generate PRD using @prd.md command
   - Create phase tracking with @state_tracker.md
   - Validate requirements and get user confirmation

2. **Implementation Phase**:
   - Execute @code.md for initial implementation
   - Run @test.md for comprehensive testing
   - Perform @review.md for quality assurance

3. **Integration Phase**:
   - Execute @integration-test.md for system testing
   - Run @performance-test.md for load validation
   - Perform @security-review.md for vulnerability analysis

4. **Deployment Phase**:
   - Execute @deploy-check.md for readiness validation
   - Create deployment plan with rollback procedures
   - Coordinate with @monitor.md for post-deployment tracking

## Quality Gates
- User approval required after analysis phase
- All tests must pass before integration phase
- Security review must pass before deployment phase
- Performance benchmarks must be met

## Rollback Strategy
- Each phase maintains rollback procedures
- Automated rollback triggers on quality gate failures
- Manual rollback capabilities at any stage
```

### The Context-Aware Command Pattern

**Concept**: Commands that adapt behavior based on project type, current branch, or development environment.

```markdown
## @smart-deploy.md - Context-Aware Deployment

## Usage
`@smart-deploy.md [ENVIRONMENT] [--force]`

## Context
- Target environment: $ARGUMENTS (auto-detected if not specified)
- Branch: $(git rev-parse --abbrev-ref HEAD)
- Project type: Auto-detected from package.json, requirements.txt, etc.

## Dynamic Behavior

### Branch-Based Deployment Strategy
```bash
if [[ $BRANCH == "main" || $BRANCH == "master" ]]; then
  ENVIRONMENT=${1:-production}
  VALIDATION_LEVEL="strict"
elif [[ $BRANCH == "develop" || $BRANCH == "staging" ]]; then
  ENVIRONMENT=${1:-staging}  
  VALIDATION_LEVEL="standard"
else
  ENVIRONMENT=${1:-development}
  VALIDATION_LEVEL="basic"
fi
```

### Project-Type Specific Actions
- **Node.js Projects**: npm run build, package.json validation, dependency audit
- **Python Projects**: requirements check, virtual environment validation, pytest
- **Docker Projects**: Image build, security scan, container health checks
- **Static Sites**: Asset optimization, CDN invalidation, SEO validation

### Environment-Specific Validations
- **Production**: Full security scan, performance testing, backup verification
- **Staging**: Integration testing, data migration dry-run, user acceptance prep
- **Development**: Quick validation, hot-reload setup, debug configuration

## Process
1. **Environment Detection**: Automatically determine deployment context
2. **Validation Selection**: Choose appropriate validation level and tests
3. **Pre-deployment Checks**: Run environment-specific validations
4. **Deployment Execution**: Execute deployment with monitoring
5. **Post-deployment Verification**: Validate deployment success and health
```

### The Intelligent Delegation Pattern

**Concept**: Commands that analyze work and delegate to appropriate specialists or sub-commands.

```markdown
## @intelligent-review.md - Multi-Perspective Code Review

## Usage
`@intelligent-review.md <FILES_OR_CHANGES>`

## Context
- Code to review: $ARGUMENTS
- Performing comprehensive, multi-faceted code analysis
- Delegating to appropriate review specialists

## Intelligence Layer

### Change Analysis
```javascript
// Pseudo-code for change classification
const changeTypes = analyzeChanges(files);
const reviewers = [];

if (changeTypes.includes('authentication') || changeTypes.includes('security')) {
  reviewers.push('security-specialist');
}

if (changeTypes.includes('database') || changeTypes.includes('migration')) {
  reviewers.push('database-specialist');  
}

if (changeTypes.includes('performance') || changeTypes.includes('optimization')) {
  reviewers.push('performance-specialist');
}

if (changeTypes.includes('ui') || changeTypes.includes('frontend')) {
  reviewers.push('frontend-specialist');
}
```

### Delegation Strategy
1. **Security Changes** → @security-review.md specialist
2. **Performance Code** → @performance-review.md specialist  
3. **Database Changes** → @database-review.md specialist
4. **Frontend Updates** → @accessibility-review.md + @ux-review.md
5. **API Changes** → @api-review.md + @documentation-review.md
6. **Infrastructure** → @devops-review.md + @security-review.md

### Aggregation & Synthesis
- Combine insights from all specialist reviews
- Identify conflicting recommendations and resolve
- Prioritize feedback by impact and effort
- Create unified action plan with clear priorities

## Process
1. **Change Classification**: Analyze files and determine review types needed
2. **Specialist Delegation**: Route to appropriate review specialists
3. **Parallel Review Execution**: Run all specialist reviews concurrently
4. **Results Aggregation**: Combine and synthesize all specialist feedback
5. **Prioritized Recommendations**: Present unified, prioritized feedback
```

## Dynamic Command Generation

### The Template Engine Pattern

**Concept**: Commands that generate other commands based on patterns and project conventions.

```markdown
## @generate-crud.md - CRUD Command Generator

## Usage
`@generate-crud.md <ENTITY_NAME> [OPTIONS]`

## Context
- Entity: $ARGUMENTS
- Generate complete CRUD operations following project patterns
- Create commands for entity-specific operations

## Generated Commands Structure

### @${ENTITY}-create.md
```markdown
## Usage
`@${ENTITY}-create.md <${ENTITY}_DATA>`

## Context
- ${ENTITY} data: $ARGUMENTS
- Following ${ENTITY} validation rules and business logic

## Process
1. Validate input data against ${ENTITY} schema
2. Check business rules and constraints
3. Create database record with proper relationships
4. Generate appropriate API response
5. Update related entities if needed
```

### @${ENTITY}-update.md
```markdown
## Usage
`@${ENTITY}-update.md <${ENTITY}_ID> <UPDATE_DATA>`

## Process
1. Validate ${ENTITY} exists and user has permissions
2. Validate update data against schema
3. Check business rules for update constraints
4. Perform optimistic locking if configured
5. Update record and related entities
6. Generate appropriate audit trail entry
```

### @${ENTITY}-query.md
```markdown
## Usage
`@${ENTITY}-query.md <QUERY_PARAMS>`

## Process
1. Parse and validate query parameters
2. Apply security filters and permissions
3. Optimize query for performance
4. Execute query with appropriate pagination
5. Format response according to API specifications
```

## Intelligence Features
- **Schema Detection**: Auto-discover entity relationships and constraints
- **Permission Integration**: Include RBAC and security patterns
- **Performance Optimization**: Generate appropriate indexes and query patterns
- **Audit Trail**: Include change tracking and history patterns
- **Testing Generation**: Create comprehensive test suites for all operations
```

### The Adaptive Learning Pattern

**Concept**: Commands that learn from usage patterns and improve over time.

```markdown
## @learn-and-adapt.md - Self-Improving Command System

## Usage
`@learn-and-adapt.md <COMMAND_NAME> [--analyze|--improve|--report]`

## Context
- Target command: $ARGUMENTS
- Analyzing usage patterns and improving command effectiveness
- Building knowledge base of successful patterns

## Learning Mechanisms

### Usage Pattern Analysis
```javascript
// Track command usage and effectiveness
const commandStats = {
  usage_frequency: trackUsageFrequency(command),
  success_rate: calculateSuccessRate(command),
  common_failures: identifyFailurePatterns(command),
  user_modifications: trackUserModifications(command),
  context_patterns: analyzeContextPatterns(command)
};
```

### Improvement Generation
1. **Frequency-Based Optimization**: Prioritize frequently-used commands
2. **Failure Pattern Resolution**: Address common failure modes
3. **Context Enhancement**: Improve context awareness based on usage
4. **User Preference Integration**: Adapt to user modification patterns
5. **Performance Optimization**: Improve execution speed and reliability

### Knowledge Base Building
- **Successful Pattern Library**: Catalog proven patterns and solutions
- **Failure Resolution Database**: Document failure modes and solutions
- **Context Association Rules**: Build context-awareness rules
- **User Preference Profiles**: Maintain user-specific optimizations

## Adaptation Process
1. **Data Collection**: Gather usage, performance, and outcome data
2. **Pattern Analysis**: Identify trends and optimization opportunities
3. **Improvement Generation**: Create enhanced command versions
4. **A/B Testing**: Test improvements against current versions
5. **Gradual Rollout**: Deploy improvements with rollback capability
```

## Advanced Integration Patterns

### The Workflow Orchestration Pattern

**Concept**: Commands that coordinate complex multi-tool workflows with dependencies and parallel execution.

```markdown
## @workflow-orchestrator.md - Complex Workflow Management

## Usage
`@workflow-orchestrator.md <WORKFLOW_DEFINITION>`

## Context
- Workflow specification: $ARGUMENTS
- Managing complex multi-step workflows with dependencies
- Supporting parallel execution and error recovery

## Workflow Definition Format
```yaml
workflow:
  name: "feature-development"
  stages:
    - name: "analysis"
      parallel: false
      tasks:
        - command: "@prd.md"
          args: "${FEATURE_DESCRIPTION}"
          required: true
        - command: "@architecture.md" 
          args: "${FEATURE_DESCRIPTION}"
          depends_on: ["@prd.md"]
          
    - name: "implementation"
      parallel: true
      tasks:
        - command: "@frontend.md"
          args: "${FEATURE_DESCRIPTION}"
          depends_on: ["analysis"]
        - command: "@backend.md"
          args: "${FEATURE_DESCRIPTION}" 
          depends_on: ["analysis"]
        - command: "@database.md"
          args: "${FEATURE_DESCRIPTION}"
          depends_on: ["analysis"]
          
    - name: "integration"
      parallel: false
      tasks:
        - command: "@integration-test.md"
          depends_on: ["implementation"]
          retry_count: 3
        - command: "@performance-test.md"
          depends_on: ["@integration-test.md"]
          optional: true
```

## Orchestration Features
- **Dependency Resolution**: Automatically resolve and execute dependencies
- **Parallel Execution**: Run independent tasks concurrently
- **Error Recovery**: Retry strategies and failure handling
- **Progress Tracking**: Real-time workflow progress and status
- **Resource Management**: Coordinate shared resources and rate limiting
- **Conditional Execution**: Skip or modify tasks based on conditions
```

### The Event-Driven Command Pattern

**Concept**: Commands that respond to events and trigger cascading actions.

```markdown
## @event-driven-command.md - Event-Responsive Automation

## Usage
`@event-driven-command.md <EVENT_TYPE> <EVENT_DATA>`

## Context
- Event type: First argument
- Event data: Remaining arguments
- Responding to development environment events automatically

## Event Response Mapping

### Git Events
- **pre-commit**: Trigger @lint.md, @test.md, @security-scan.md
- **post-commit**: Update @documentation.md, notify team if major change
- **pre-push**: Execute @integration-test.md, @deploy-check.md
- **branch-created**: Setup @branch-workflow.md, initialize tracking

### File System Events
- **package.json modified**: Execute @dependency-audit.md, @security-scan.md
- **migration files added**: Trigger @migration-review.md, @backup-check.md
- **test files modified**: Run @related-tests.md, update coverage reports
- **config files changed**: Validate @config-syntax.md, restart services

### CI/CD Events
- **build-failure**: Execute @debug-build.md, notify developers
- **deployment-success**: Trigger @smoke-test.md, @monitor.md
- **security-alert**: Run @security-review.md, create incident ticket
- **performance-degradation**: Execute @performance-analysis.md

## Event Processing Pipeline
1. **Event Classification**: Determine event type and extract metadata
2. **Handler Selection**: Choose appropriate response handlers
3. **Context Preparation**: Gather relevant context for handlers
4. **Parallel Execution**: Execute multiple handlers concurrently
5. **Result Aggregation**: Combine results and trigger follow-up actions
6. **Notification**: Alert relevant stakeholders of actions taken
```

## Meta-Command Patterns

### The Command Composition Engine

**Concept**: Commands that create workflows by composing other commands dynamically.

```markdown
## @compose-workflow.md - Dynamic Command Composition

## Usage
`@compose-workflow.md <WORKFLOW_DESCRIPTION>`

## Context
- Workflow requirements: $ARGUMENTS  
- Dynamically composing optimal command sequences
- Learning from successful composition patterns

## Composition Intelligence
1. **Requirement Analysis**: Parse workflow description into atomic tasks
2. **Command Mapping**: Map tasks to available commands and capabilities  
3. **Dependency Resolution**: Determine optimal execution order
4. **Optimization**: Minimize execution time and resource usage
5. **Validation**: Verify composition completeness and correctness

## Example Compositions

### "Deploy hotfix for payment processing bug"
```bash
# Generated workflow:
@create-hotfix-branch "payment-processing-bug" &&
@debug-session "Payment processing timeout in checkout" &&
@implement-fix "Apply timeout handling and retry logic" &&
@test-hotfix "payment processing" &&
@security-review "payment processing changes" &&
@deploy-hotfix "production" &&
@monitor-deployment "payment processing metrics"
```

### "Add user preferences feature with full testing"
```bash
# Generated workflow:
@prd.md "User preferences and settings management" &&
@state_tracker.md create "User Preferences Feature" &&
@database-design "user preferences schema" &&  
@api-design "user preferences endpoints" &&
@frontend-component "user preferences UI" &&
@integration-test "user preferences workflow" &&
@documentation "user preferences feature" &&
@deploy-check "user preferences feature"
```

## Learning and Optimization
- **Success Pattern Recognition**: Learn from successful workflow compositions
- **Failure Analysis**: Understand why certain compositions fail
- **Performance Optimization**: Minimize execution time through better ordering
- **Context Awareness**: Adapt compositions based on project and user context
```

These advanced patterns transform Claude Code commands from simple automation scripts into intelligent, adaptive development orchestration systems that learn and evolve with your workflows.

## Related Topics

### Prerequisites
- [Commands Overview](/commands/) - Basic command concepts
- [Personal Commands](/commands/personal-commands) - Foundation patterns for advanced techniques
- [Getting Started](/getting-started) - Essential setup and configuration

### Advanced Techniques
- [Subagent Patterns](/agents/subagent-patterns) - Multi-agent coordination systems
- [Automation Recipes](/hooks/automation-recipes) - Event-driven automation systems
- [Custom Agents](/advanced/custom-agents) - Specialized AI assistant development

### Complete Systems
- [Idea to Production](/advanced/idea-to-production) - Full development workflow orchestration
- [Project Lifecycle Management](/advanced/project-lifecycle) - Systematic project coordination
- [Real-World Examples](/examples/real-world-examples) - Production implementations

### Implementation
- [Workflow Automation](/advanced/automation) - Advanced automation frameworks
- [Best Practices: Configuration](/best-practices/configuration) - Optimal setup patterns