# @refactor.md - Code Refactoring Coordinator

Strategic refactoring command that improves code quality while maintaining functionality and ensuring backward compatibility through incremental, testable changes.

## Usage

```
@refactor.md <REFACTORING_SCOPE>
```

## What It Does

Coordinates strategic refactoring with focus on maintainability, modern practices, and risk mitigation through incremental improvements.

## When to Use

::: tip Technical Debt Reduction  
- **Legacy code modernization** with outdated patterns
- **Duplicated code elimination** across multiple modules
- **Complex functions** that violate single responsibility
- **Tightly coupled modules** requiring better separation
- **Code smells** identified through reviews or analysis
:::

::: info Preparation for Changes
- **Before adding features** to complex legacy code
- **Performance improvements** requiring structural changes
- **Framework upgrades** requiring pattern updates
- **Security improvements** needing architectural changes
- **Maintainability improvements** for team productivity
:::

## Key Benefits

### 🔄 Incremental Approach
- Small, testable changes that reduce risk
- Maintains functionality throughout the process
- Allows for continuous validation and rollback
- Enables gradual team learning and adoption

### 🛡️ Risk Mitigation
- Maintains backward compatibility when needed
- Comprehensive testing before and after changes
- Clear rollback strategies for each step
- Documentation of decisions and trade-offs

### 🏗️ Modern Practices
- Applies current best practices and patterns
- Improves code maintainability and readability
- Reduces future development and maintenance costs
- Enhances team productivity and code quality

## Example Scenarios

### Legacy Authentication System
```
@refactor.md "Modernize legacy session-based auth to JWT tokens 
while maintaining backward compatibility for existing users. 
Current system uses PHP sessions, moving to Node.js with proper 
token management and refresh rotation."
```

### Monolithic API Breakdown  
```
@refactor.md "Extract user management functionality from monolithic 
API into separate service. Need to maintain existing API contracts 
while introducing service boundaries and proper error handling."
```

### Database Layer Modernization
```
@refactor.md "Replace raw SQL queries with ORM/query builder while 
improving performance. Current code has SQL scattered throughout 
controllers, need proper data access layer."
```

## Related Commands

- Use `@review.md` first to **identify refactoring priorities**
- Use `@test.md` to **ensure adequate coverage** before refactoring
- Use `@code.md` for **major architectural changes**