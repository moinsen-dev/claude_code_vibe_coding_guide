# @review.md - Code Review Coordinator

Multi-dimensional code review command that orchestrates four specialists to provide comprehensive quality, security, performance, and architectural validation.

## Usage

```
@review.md <CODE_SCOPE>
```

## What It Does

Coordinates comprehensive code review through four specialists:

1. **Quality Auditor** – examines code quality, readability, and maintainability
2. **Security Analyst** – identifies vulnerabilities and security best practices
3. **Performance Reviewer** – evaluates efficiency and optimization opportunities
4. **Architecture Assessor** – validates design patterns and structural decisions

## When to Use

::: danger Pre-Production Reviews
- **Critical production deployments** requiring thorough validation
- **Security-sensitive features** (authentication, payments, data handling)
- **Performance-critical code** affecting user experience
- **API endpoints** exposed to external systems
- **Database schema changes** with data migration impact
:::

::: warning High-Risk Changes
- **Legacy code modifications** in complex systems
- **Third-party integrations** with security implications
- **Concurrent programming** with race condition risks
- **Financial calculations** requiring accuracy validation
- **Compliance-related code** (GDPR, HIPAA, SOC2)
:::

::: info Regular Quality Assurance
- **Team onboarding** code for learning and standards validation
- **Complex algorithms** requiring optimization review
- **Large refactoring** efforts affecting multiple components
- **Open source contributions** requiring community standards
- **Technical debt** assessment and prioritization
:::

## Key Benefits

### 🔍 Multi-Dimensional Analysis
- **Quality**: Code clarity, maintainability, and best practices
- **Security**: Vulnerability scanning and attack vector analysis
- **Performance**: Bottleneck identification and optimization opportunities
- **Architecture**: Design pattern validation and structural assessment

### 📊 Actionable Feedback
- Specific issues with code examples and explanations
- Concrete refactoring suggestions with implementation guidance
- Priority classification for addressing findings
- Best practice recommendations with rationale

### 🎯 Risk Assessment
- Critical issues requiring immediate attention
- Medium-priority improvements for technical debt
- Future considerations for system evolution
- Trade-off analysis for competing solutions

### 📈 Continuous Improvement
- Team learning opportunities from review findings
- Process improvements based on common issues
- Standards refinement and documentation updates
- Mentoring guidance for less experienced developers

## Example Scenarios

### Payment Processing Integration
```
@review.md "New Stripe payment integration including webhook handling, 
subscription management, and failed payment retry logic. Files: 
@payment-service.js @webhook-handler.js @subscription-model.js"
```

**Multi-dimensional Review**: Security (PCI compliance, data handling), Performance (webhook processing), Quality (error handling), Architecture (service boundaries).

### User Authentication Refactor
```
@review.md "Refactored authentication system from sessions to JWT tokens 
with refresh token rotation and role-based permissions. 
@auth-middleware.js @user-controller.js @auth-service.js"
```

**Security Focus**: Token security, session management, permission validation, attack prevention (XSS, CSRF, replay attacks).

### Database Query Optimization
```
@review.md "Optimized complex reporting queries for dashboard performance. 
Added caching layer and database indexes. 
@report-service.js @database-queries.sql @cache-manager.js"
```

**Performance Focus**: Query efficiency, caching strategy, database design, scalability considerations.

## Review Scope Areas

### Code Quality
- **Readability**: Naming, structure, documentation
- **Maintainability**: Modularity, coupling, cohesion  
- **Testability**: Test coverage, mockability, isolation
- **Standards**: Coding conventions, best practices

### Security Analysis
- **Input validation**: SQL injection, XSS prevention
- **Authentication**: Session management, token security
- **Authorization**: Permission checks, privilege escalation
- **Data protection**: Encryption, sensitive data handling

### Performance Review
- **Algorithm efficiency**: Time/space complexity analysis
- **Resource usage**: Memory, CPU, I/O optimization
- **Scalability**: Load handling, bottleneck identification
- **Caching**: Strategy effectiveness and invalidation

### Architecture Assessment
- **Design patterns**: Appropriate pattern usage and implementation
- **SOLID principles**: Single responsibility, open/closed, etc.
- **Coupling**: Dependencies and module boundaries
- **Scalability**: Future growth accommodation

## Output Structure

1. **Review Summary** – high-level assessment with priority classification
2. **Detailed Findings** – specific issues with code examples and explanations
3. **Improvement Recommendations** – concrete refactoring suggestions with samples
4. **Action Plan** – prioritized tasks with effort estimates and impact assessment
5. **Next Actions** – follow-up reviews and monitoring requirements

## Review Findings Classification

### 🚨 Critical Issues
- Security vulnerabilities
- Data corruption risks
- Performance bottlenecks
- Logic errors in critical paths

### ⚠️ High Priority
- Code quality issues affecting maintainability
- Scalability concerns
- Test coverage gaps
- Standards violations

### 💡 Improvements  
- Optimization opportunities
- Refactoring suggestions
- Documentation enhancements
- Best practice recommendations

### 📚 Learning Opportunities
- Alternative approaches
- Industry patterns
- Technology suggestions
- Skill development areas

## Best Practices

### Maximize Review Value
- **Specify review focus** (security, performance, quality, architecture)
- **Include related files** using @ syntax for context
- **Mention constraints** (performance requirements, security standards)
- **Describe business impact** to help prioritize findings

### Effective Code Review
- **Reference specific lines** and functions in feedback
- **Provide code examples** for suggested improvements
- **Explain the "why"** behind recommendations
- **Balance criticism** with positive recognition

## Review Patterns by Focus

### Security Review Checklist
- Input validation and sanitization
- Authentication and session management
- Authorization and permission checks
- Data encryption and secure storage
- Error handling and information disclosure

### Performance Review Areas
- Database query optimization
- Caching strategy effectiveness
- Algorithm complexity analysis
- Resource usage efficiency
- Scalability bottlenecks

### Quality Assessment Points
- Code readability and documentation
- Test coverage and quality
- Error handling completeness
- Module organization and coupling
- Standards compliance

## Follow-up Commands

- `@debug.md` – investigate **critical issues** found in review
- `@optimize.md` – address **performance concerns** identified  
- `@refactor.md` – implement **structural improvements**
- `@test.md` – add **missing test coverage**

## Related Commands

- Use `@code.md` after review to **implement improvements**
- Use `@deploy-check.md` to validate **fixes before deployment**
- Use `@ask.md` for **architectural questions** raised in review