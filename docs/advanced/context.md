# Context Engineering

Advanced techniques for optimizing AI agent context to maximize performance, reduce costs, and achieve consistent results across complex development workflows.

## Overview

Context engineering is the practice of strategically designing, structuring, and optimizing the information provided to AI agents. It's not just about what information you provide, but how you structure it, when you provide it, and how you help the agent maintain and utilize that context effectively.

> **Core Principle**: Context engineering shapes how an AI agent perceives, remembers, and learns from its environment - it's about intelligent information architecture, not just raw model capability.

## Fundamental Concepts

### KV-Cache Optimization

The key-value cache is critical for performance and cost efficiency in modern AI systems.

**Best Practices:**
- **Prioritize stable, deterministic context prefixes** - Place consistent, unchanging information at the beginning of your context
- **Maintain high cache hit rates** - Even a single-token difference can invalidate the entire cache
- **Structure context hierarchically** - Most stable information first, most dynamic information last

```markdown
<!-- Good: Stable prefix structure -->
# Project: E-commerce Platform
## Architecture: Next.js + PostgreSQL
## Current Sprint: User Authentication

<!-- Dynamic content goes here -->
Current task: Implementing OAuth integration...
```

### Action Space Management

Control available actions without disrupting the agent's decision-making process.

**Strategies:**
- **Avoid dynamically adding/removing tools mid-iteration** - This can confuse the agent's understanding
- **Use token logit masking instead of tool removal** - Mask token logits during decoding to prevent/enforce certain actions
- **Maintain consistent tool availability** - If a tool becomes unavailable, explain why rather than silently removing it

### Context as Structured Memory

Treat the file system and external resources as "structured, externalized memory" for the agent.

**Implementation:**
- Design compression strategies that are always restorable
- Allow agents to write/read files dynamically for memory management
- Create persistent context files that survive session boundaries

## Advanced Techniques

### Attention Manipulation

Guide where the agent focuses its attention within the context window.

**Techniques:**
1. **Step-by-step todo lists** - Create explicit task sequences that focus attention
2. **Objective recitation** - Repeat key objectives at the end of context to leverage recency bias
3. **Context anchoring** - Place critical information in both the beginning and end of context

```markdown
<!-- Attention anchoring example -->
# PRIMARY OBJECTIVE: Implement secure user authentication

[... detailed context ...]

## Current Focus
Remember: The PRIMARY OBJECTIVE is implementing secure user authentication
Next immediate step: Configure OAuth providers
```

### Error Learning and Adaptation

Transform failures into learning opportunities within the context.

**Strategies:**
- **Preserve failed actions and observations** - Keep wrong turns in the context as learning examples
- **Document the reasoning behind failures** - Help the agent understand why certain approaches didn't work
- **Create failure pattern recognition** - Build a library of common mistakes and solutions

```markdown
## Previous Attempt Analysis
❌ **Failed Approach**: Direct database query in component
**Why it failed**: Violated separation of concerns
**Learning**: Always use API layer for data access
✅ **Corrected Approach**: Implement API endpoint first
```

### Preventing Repetitive Behavior

Introduce controlled diversity to avoid agent loops and rigid thinking patterns.

**Methods:**
1. **Controlled randomness** - Vary phrasing and examples in templates
2. **Multiple solution paths** - Present alternative approaches for similar problems
3. **Context rotation** - Vary the order of non-critical information
4. **Perspective diversity** - Include multiple viewpoints on complex decisions

## Context Layering Strategies

### Immediate Context
Information directly relevant to the current task.
- Current file being edited
- Immediate error messages
- Active debugging session state

### Session Context
Information spanning the current development session.
- Recent changes and their rationale
- Discovered patterns or insights
- Temporary workarounds or decisions

### Project Context
Long-term project information that persists across sessions.
- Architecture decisions and rationale
- Coding standards and conventions
- Known limitations and constraints
- Team preferences and patterns

### Domain Context
Broader knowledge about the problem domain.
- Industry best practices
- Security considerations
- Performance requirements
- User experience principles

## Context Compression Techniques

### Semantic Compression
Preserve meaning while reducing token count.

```markdown
<!-- Before: Verbose -->
The authentication system needs to handle multiple OAuth providers including Google, GitHub, and Microsoft. Each provider has different callback URLs and requires different scopes. The system should gracefully handle provider-specific errors and provide clear user feedback.

<!-- After: Compressed -->
Auth system: Multi-OAuth (Google/GitHub/MS), provider-specific callbacks/scopes, error handling + UX feedback
```

### Hierarchical Summaries
Create nested levels of detail that can be expanded as needed.

```markdown
## API Integration Status
### ✅ Complete: User Auth (OAuth, JWT, sessions)
### 🔄 In Progress: Payment Processing
  - Stripe integration: API keys configured
  - Webhook handling: 60% complete
  - Error states: needs testing
### ⏳ Pending: Email Notifications, Admin Dashboard
```

### Reference-Based Context
Use pointers to external information instead of inline details.

```markdown
## Configuration References
- Database schema: See `/docs/schema.md` lines 23-45
- API endpoints: Documented in `/api/README.md`
- Deployment config: `.env.example` + Kubernetes manifests
```

## Context Evolution Patterns

### Incremental Learning
Build context progressively as understanding deepens.

```markdown
## Understanding Evolution
**Initial**: "Simple CRUD app"
**Iteration 1**: "CRUD app with real-time features"
**Iteration 2**: "Event-driven CRUD with WebSocket notifications"
**Current**: "Event-sourced system with CQRS pattern, real-time projections"
```

### Context Branching
Handle multiple development streams with shared context.

```markdown
## Development Branches
**Main Context**: Core user management system
├── **Branch A**: OAuth integration (focuses on security)
├── **Branch B**: Role-based permissions (focuses on authorization)
└── **Branch C**: User profile features (focuses on UX)

**Shared Understanding**: All branches use the same User model and database schema
```

## Implementation Guidelines

### Context File Organization

```
project-root/
├── CLAUDE.md              # Primary project context
├── .claude/
│   ├── architecture.md    # System design decisions
│   ├── patterns.md        # Coding patterns and conventions
│   ├── session-notes.md   # Current session context
│   └── lessons-learned.md # Accumulated insights
```

### Context Validation
Regularly verify that context remains accurate and helpful.

**Validation Checklist:**
- [ ] Information is current and accurate
- [ ] Context supports the agent's decision-making
- [ ] No contradictory information exists
- [ ] Critical information is easily accessible
- [ ] Context size is manageable

### Context Maintenance
Keep context fresh and relevant through regular maintenance.

**Maintenance Tasks:**
1. **Archive outdated information** - Move completed tasks to history
2. **Promote important discoveries** - Elevate insights from session to project context
3. **Resolve contradictions** - Update conflicting information
4. **Optimize for performance** - Compress verbose sections

## Measuring Context Effectiveness

### Performance Metrics
- **First-attempt success rate** - How often the agent gets it right initially
- **Context utilization** - Whether the agent references provided context
- **Task completion efficiency** - Time and iterations to complete tasks
- **Error reduction** - Decrease in repeated mistakes

### Quality Indicators
- **Consistency across sessions** - Similar problems receive similar solutions
- **Progressive improvement** - Agent builds on previous learnings
- **Context relevance** - Agent focuses on pertinent information
- **Decision rationale** - Agent can explain reasoning based on context

## Common Pitfalls and Solutions

### Pitfall: Information Overload
**Problem**: Too much context overwhelms the agent's decision-making.
**Solution**: Use hierarchical context and progressive disclosure.

### Pitfall: Stale Context
**Problem**: Outdated information leads to incorrect decisions.
**Solution**: Implement context versioning and regular validation.

### Pitfall: Context Fragmentation
**Problem**: Related information scattered across multiple locations.
**Solution**: Use cross-references and maintain context maps.

### Pitfall: Cache Invalidation
**Problem**: Minor context changes destroy cache efficiency.
**Solution**: Structure context with stable prefixes and variable suffixes.

## Real-World Examples

### E-commerce Platform Context Structure
```markdown
# Project: ShopFlow E-commerce Platform

## Stable Context (Cache-Friendly)
- Tech Stack: Next.js 14, PostgreSQL, Redis, Stripe
- Architecture: Microservices with API Gateway
- Deployment: Docker + Kubernetes on AWS

## Current Sprint Context
- Sprint 3: Payment Integration
- Key User Story: "As a customer, I want to securely checkout with multiple payment methods"
- Technical Focus: PCI compliance, error handling, UX optimization

## Session Context
- Last session: Implemented Stripe webhook handling
- Current issue: Testing payment failure scenarios
- Next priority: Apple Pay integration
```

### API Development Context Pattern
```markdown
# API Context Engineering Pattern

## Request Analysis
- Endpoint: `POST /api/orders`
- Requirements: Create order with inventory validation
- Dependencies: User auth, inventory service, payment processing

## Implementation Context
- Previous similar endpoints: `/api/products`, `/api/users` (reference patterns)
- Error handling strategy: Structured error responses with user-friendly messages
- Testing approach: Unit tests + integration tests with test database

## Decision Context
- **Why async processing**: Order creation involves multiple services
- **Why event-driven**: Need to notify inventory, email, analytics services
- **Why optimistic locking**: Handle concurrent order creation safely
```

## Integration with Claude Code

### CLAUDE.md Context Engineering
Structure your project's CLAUDE.md file using context engineering principles:

```markdown
# Project Context (Stable - High Cache Priority)
[Project fundamentals, tech stack, architecture decisions]

# Current Development Context (Session - Medium Priority)
[Current sprint, active features, immediate goals]

# Task-Specific Context (Dynamic - Low Cache Priority)
[Current task details, specific requirements, immediate context]
```

### Context-Aware Commands
Design custom commands that leverage engineered context:

```markdown
@context-review - Analyze current context for gaps or inconsistencies
@context-compress - Summarize verbose context sections
@context-branch - Create focused context for specific development stream
@context-merge - Integrate learnings back into main project context
```

## Advanced Context Patterns

### Context Inheritance
Child contexts inherit from parent contexts with override capabilities.

### Context Composition
Combine multiple context sources dynamically based on current needs.

### Context Streaming
Update context incrementally as new information becomes available.

### Context Versioning
Track context evolution and enable rollback to previous states.

## Related Topics

- [Communication Best Practices](/best-practices/communication) - Effective interaction patterns
- [Project Setup](/best-practices/project-setup) - Initial context establishment
- [Multi-Agent Patterns](/advanced/multi-agent-patterns) - Context sharing between agents
- [Custom Agents](/advanced/custom-agents) - Context-specific agent design