# @code.md - Implementation Coordinator

The most comprehensive command for feature development, orchestrating four specialized agents to deliver high-quality implementations from design to deployment.

## Usage

```
@code.md <FEATURE_DESCRIPTION>
```

## What It Does

Coordinates a complete development workflow through four specialist agents:

1. **Architect Agent** – designs high-level implementation approach and structure
2. **Implementation Engineer** – writes clean, efficient, and maintainable code
3. **Integration Specialist** – ensures seamless integration with existing codebase
4. **Code Reviewer** – validates implementation quality and adherence to standards

## When to Use

::: tip Perfect For Complex Features
- **New feature development** requiring architectural planning
- **API endpoint creation** with proper error handling and validation
- **Component development** that needs to integrate with existing systems
- **Database schema changes** with migration planning
- **Cross-cutting concerns** like authentication, logging, or caching
:::

::: info Also Great For
- **Refactoring large modules** with modern practices
- **Performance-critical implementations** requiring optimization
- **Security-sensitive features** needing thorough validation
- **Third-party integrations** requiring robust error handling
:::

## Key Benefits

### 🏗️ Architectural Thinking First
- Designs before coding to avoid technical debt
- Considers system boundaries and data flows
- Plans for scalability and maintainability
- Identifies potential integration challenges early

### 🔧 Clean Implementation
- Follows established patterns and conventions
- Includes proper error handling and edge cases
- Writes self-documenting code with clear naming
- Applies SOLID principles and design patterns

### 🔗 Seamless Integration
- Checks compatibility with existing systems
- Validates dependencies and version conflicts
- Ensures consistent coding standards
- Plans for backward compatibility when needed

### ✅ Built-in Quality Assurance
- Includes comprehensive code review
- Validates security and performance considerations
- Ensures test coverage and documentation
- Provides deployment guidance

## Example Scenarios

### User Authentication System
```
@code.md "Implement JWT-based authentication with refresh tokens, 
including login, logout, and protected route middleware. 
Should integrate with our existing PostgreSQL user table."
```

**Why @code.md**: Requires architectural planning (JWT strategy), clean implementation (security best practices), integration (existing database), and thorough review (security validation).

### Real-time Chat Feature
```
@code.md "Add real-time messaging to the application using WebSockets. 
Users should be able to join rooms, send messages, and see online status. 
Must handle connection drops gracefully."
```

**Why @code.md**: Complex feature needing WebSocket architecture, robust error handling, state management, and integration with existing user system.

### Payment Processing Integration
```
@code.md "Integrate Stripe payment processing with subscription management. 
Include webhook handling for payment events and proper error handling 
for failed payments."
```

**Why @code.md**: Security-critical implementation requiring architectural planning, robust error handling, webhook integration, and comprehensive testing.

## Workflow Process

### 1. Requirements Analysis
- Breaks down feature requirements
- Identifies technical constraints
- Analyzes existing codebase patterns

### 2. Implementation Strategy
- **Architect**: API contracts, data models, component structure
- **Engineer**: Core functionality with error handling  
- **Integration**: Compatibility and dependencies
- **Reviewer**: Quality, security, performance validation

### 3. Progressive Development
- Builds incrementally with validation
- Tests integration points early
- Validates against requirements continuously

### 4. Quality Validation
- Code quality and maintainability review
- Security and performance assessment
- Documentation and testing completeness

## Output Structure

1. **Implementation Plan** – technical approach with breakdown and dependencies
2. **Code Implementation** – complete, working code with comprehensive comments
3. **Integration Guide** – steps to integrate with existing systems
4. **Testing Strategy** – unit tests and validation approach
5. **Next Actions** – deployment steps and future enhancements

## Best Practices

### Maximize Value
- **Be specific** about requirements and constraints
- **Mention existing patterns** you want to follow or avoid
- **Include context** about the broader system architecture
- **Specify non-functional requirements** (performance, security, etc.)

### Typical Follow-up Commands
- `@test.md` – comprehensive testing strategy
- `@review.md` – additional security/performance review
- `@deploy-check.md` – deployment readiness validation

## Related Commands

- Use `@ask.md` for **architectural questions** before implementation
- Use `@debug.md` for **troubleshooting** implementation issues  
- Use `@refactor.md` for **improving existing** implementations