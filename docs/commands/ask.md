# @ask.md - Senior Systems Architect

Strategic architectural consultation command that provides expert guidance on high-level design decisions, technology choices, and system architecture challenges.

## Usage

```
@ask.md <TECHNICAL_QUESTION>
```

## What It Does

Provides senior-level architectural consultation through four specialized advisors:

1. **Systems Designer** – evaluates system boundaries, interfaces, and component interactions
2. **Technology Strategist** – recommends technology stacks, frameworks, and architectural patterns
3. **Scalability Consultant** – assesses performance, reliability, and growth considerations  
4. **Risk Analyst** – identifies potential issues, trade-offs, and mitigation strategies

## When to Use

::: tip Strategic Architecture Decisions
- **System design** for new applications or major features
- **Technology stack selection** for projects or migrations
- **Scalability planning** for anticipated growth
- **Integration architecture** between multiple systems
- **Data architecture** and storage strategy decisions
:::

::: info Technical Evaluation Questions
- **Framework comparisons** (React vs Vue, microservices vs monolith)
- **Database selection** (SQL vs NoSQL, specific database choices)
- **Performance architecture** for high-traffic applications
- **Security architecture** for sensitive applications
- **Cloud strategy** and deployment architecture
:::

::: warning Before Major Investments
- **Technology migrations** requiring significant resources
- **Architectural refactoring** of existing systems
- **Third-party integrations** with long-term implications
- **Compliance requirements** affecting system design
- **Team structure** decisions for complex projects
:::

## Key Benefits

### 🏗️ Strategic Focus
- High-level design thinking, not implementation details
- Business alignment with technical constraints
- Long-term sustainability and maintainability
- Risk assessment for major decisions

### 🎯 Expert Consultation  
- Multiple specialized perspectives on each question
- Industry best practices and proven patterns
- Technology trend awareness and future-proofing
- Trade-off analysis with clear recommendations

### 📋 Comprehensive Analysis
- **System boundaries**: Component relationships and interfaces
- **Technology guidance**: Stack recommendations with rationale
- **Scalability assessment**: Growth planning and bottleneck prevention
- **Risk evaluation**: Potential issues and mitigation strategies

### 🚀 Implementation Strategy
- Phased approach for complex changes
- Architectural decision framework
- Proof-of-concept recommendations
- Validation checkpoints and success metrics

## Example Scenarios

### Microservices vs Monolith Decision
```
@ask.md "We're building a new e-commerce platform expecting 100K users 
in year 1, potentially 1M+ in year 3. Team of 8 developers. 
Should we go microservices or monolith? What are the key considerations?"
```

**Architecture Focus**: System boundaries, team structure, scaling strategy, complexity management.

### Real-time Features Architecture
```
@ask.md "Adding real-time collaboration features to our document editor. 
Need to handle 50+ concurrent users per document, with conflict resolution 
and offline sync. WebSockets vs Server-Sent Events vs WebRTC?"
```

**Technology Strategy**: Real-time architecture patterns, conflict resolution, offline capabilities, performance.

### Data Architecture for Analytics
```
@ask.md "We need to add analytics and reporting to our SaaS app. 
Current PostgreSQL has 10M+ records. Should we keep analytics in the 
main DB, add a data warehouse, or use a separate analytics service?"
```

**Scalability Planning**: Data architecture, query performance, analytical workloads, cost considerations.

### Multi-tenant Architecture Design
```
@ask.md "Designing multi-tenancy for our B2B platform. Need to support 
1000+ tenants with varying data sizes and compliance requirements. 
Database per tenant vs shared tables vs hybrid approach?"
```

**System Design**: Tenant isolation, data security, performance, operational complexity.

## Architecture Decision Areas

### System Architecture
- Component design and boundaries
- Service communication patterns  
- Data flow and state management
- Integration patterns and APIs

### Technology Selection
- Programming languages and frameworks
- Database and storage systems
- Cloud services and deployment
- Third-party tools and services

### Scalability & Performance
- Load balancing and caching strategies
- Database scaling approaches
- Performance monitoring and optimization
- Capacity planning and resource allocation

### Security & Compliance
- Authentication and authorization patterns
- Data encryption and privacy
- Compliance requirements (GDPR, SOC2, etc.)
- Security monitoring and incident response

## Output Structure

1. **Architecture Analysis** – comprehensive breakdown of technical challenge and context
2. **Design Recommendations** – high-level architectural solutions with rationale and alternatives
3. **Technology Guidance** – strategic technology choices with pros/cons analysis
4. **Implementation Strategy** – phased approach and architectural decision framework
5. **Next Actions** – strategic next steps, proof-of-concepts, and validation points

## Best Practices

### Ask Strategic Questions
- Focus on **architecture and design**, not implementation details
- Include **business context** (scale, team size, timeline, constraints)
- Mention **current system** architecture and constraints
- Specify **non-functional requirements** (performance, security, compliance)

### Provide Context
- **Team expertise** and technology preferences
- **Existing systems** that need integration
- **Growth projections** and scalability requirements
- **Budget and timeline** constraints
- **Regulatory or compliance** requirements

## Not For Implementation
@ask.md focuses on strategic guidance. For implementation:
- Use `@code.md` for **feature development**
- Use `@debug.md` for **troubleshooting**
- Use `@optimize.md` for **performance improvements**

## Follow-up Strategy

### After Architecture Decisions
1. **Prototype** key architectural components
2. **Validate** assumptions with proof-of-concepts  
3. **Document** decisions and rationale
4. **Plan** implementation phases
5. **Monitor** architecture effectiveness

## Related Commands

- Use `@code.md` to **implement** architectural decisions
- Use `@goals.md` for **project planning** after architecture decisions
- Use `@review.md` to **validate** implemented architecture