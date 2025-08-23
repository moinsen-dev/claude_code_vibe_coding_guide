# @deploy-check.md - Deployment Readiness Coordinator

Comprehensive deployment validation command that assesses quality, security, operations, and risk factors to provide clear go/no-go decisions with detailed action plans.

## Usage

```
@deploy-check.md <DEPLOYMENT_TARGET>
```

## What It Does

Coordinates deployment readiness assessment through four specialists:

1. **Quality Assurance Agent** – validates code quality and test coverage
2. **Security Auditor** – ensures security compliance and vulnerability mitigation
3. **Operations Engineer** – verifies infrastructure readiness and configuration
4. **Risk Assessor** – evaluates deployment risks and rollback strategies

## When to Use

::: danger Critical Production Deployments
- **Major feature releases** with significant user impact
- **Infrastructure changes** affecting system stability
- **Security updates** requiring careful validation
- **Database migrations** with data transformation risks
- **Third-party integrations** affecting external dependencies
:::

::: warning High-Stakes Deployments
- **Payment system changes** with financial implications
- **Authentication updates** affecting user access
- **Performance optimizations** that could impact stability
- **API changes** affecting external integrators
- **Compliance-related updates** requiring audit trails
:::

## Key Benefits

### ✅ Go/No-Go Decision Framework
- Clear deployment recommendation with objective criteria
- Risk assessment with mitigation strategies
- Detailed readiness report with pass/fail validation
- Actionable next steps for addressing blockers

### 🛡️ Risk Mitigation
- Identifies potential deployment risks before they occur
- Prepares rollback procedures and contingency plans
- Validates monitoring and alerting capabilities
- Ensures proper backup and recovery procedures

## Example Scenarios

### E-commerce Payment Integration
```
@deploy-check.md "New Stripe payment processing with subscription 
management deploying to production. Affects checkout flow, billing, 
and user accounts. High transaction volume expected during launch."
```

### Database Schema Migration
```
@deploy-check.md "User table migration adding new columns and indexes. 
50M+ records, 24/7 uptime requirement. Migration affects authentication 
and user profile features across web and mobile apps."
```

## Related Commands

- Use `@review.md` for **final code quality validation**
- Use `@test.md` to **verify comprehensive test coverage**
- Use `@debug.md` to **investigate deployment blockers**