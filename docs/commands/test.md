# @test.md - Test Strategy Coordinator

Comprehensive testing command that orchestrates four specialists to create maintainable, reliable test suites with proper coverage and quality validation.

## Usage

```
@test.md <COMPONENT_OR_FEATURE>
```

## What It Does

Coordinates comprehensive testing strategy through four specialists:

1. **Test Architect** – designs comprehensive testing strategy and structure
2. **Unit Test Specialist** – creates focused unit tests for individual components
3. **Integration Test Engineer** – designs system interaction and API tests
4. **Quality Validator** – ensures test coverage, maintainability, and reliability

## When to Use

::: tip New Feature Development
- **Complex business logic** requiring comprehensive test coverage
- **API endpoints** needing contract and integration testing
- **User authentication** and authorization systems
- **Payment processing** and financial calculations
- **Data validation** and transformation logic
:::

::: warning Legacy Code Coverage
- **Untested legacy modules** being refactored or extended
- **Critical production code** without adequate test coverage
- **Bug-prone areas** identified through production issues
- **Code scheduled for major changes** or migrations
:::

::: info Testing Strategy Updates
- **New testing frameworks** being adopted
- **CI/CD pipeline** test integration
- **Performance testing** requirements
- **Cross-browser** or multi-environment testing
- **Test maintenance** and optimization
:::

## Key Benefits

### 🏗️ Strategic Test Design
- Designs proper test pyramid (unit/integration/e2e ratios)
- Balances coverage with maintainability
- Prioritizes tests by risk and business impact
- Plans for long-term test suite evolution

### 🎯 Comprehensive Coverage
- **Unit tests**: Isolated component testing with proper mocking
- **Integration tests**: API contracts and data flow validation
- **Edge cases**: Boundary conditions and error scenarios
- **Performance tests**: Load and stress testing where appropriate

### 📊 Quality Assurance
- Test code quality and maintainability
- Performance impact of test suite
- Clear test documentation and naming
- Proper setup, teardown, and isolation

### 🔄 CI/CD Integration
- Automated test execution strategy
- Test result reporting and analysis
- Failure investigation and debugging
- Test environment management

## Example Scenarios

### E-commerce Checkout Flow
```
@test.md "Complete checkout flow including cart calculation, 
payment processing, inventory updates, and email notifications. 
Needs to handle various payment methods and edge cases like 
inventory depletion during checkout."
```

**Why @test.md**: Complex business logic with multiple integration points, edge cases, and critical business impact requiring comprehensive testing strategy.

### User Authentication System
```
@test.md "JWT-based authentication with refresh tokens, 
password reset, email verification, and role-based permissions. 
Must test security edge cases and token expiration scenarios."
```

**Why @test.md**: Security-critical functionality requiring thorough unit testing, integration testing, and edge case coverage.

### Real-time Chat Feature
```
@test.md "WebSocket-based chat system with message persistence, 
room management, user presence, and message history. 
Needs to test connection failures and message ordering."
```

**Why @test.md**: Real-time system with complex state management, concurrent users, and failure scenarios requiring specialized testing approaches.

## Testing Strategy Areas

### Unit Testing
- **Pure functions**: Business logic and calculations
- **Components**: React/Vue components with props and state
- **Services**: API clients and data transformation
- **Utilities**: Helper functions and validators

### Integration Testing  
- **API endpoints**: Request/response validation
- **Database operations**: CRUD and query testing
- **External services**: Third-party integrations
- **System workflows**: Multi-component interactions

### End-to-End Testing
- **User journeys**: Complete application flows
- **Cross-browser**: Compatibility testing
- **Performance**: Load and stress testing
- **Accessibility**: Screen reader and keyboard navigation

### Specialized Testing
- **Security**: Authentication, authorization, input validation
- **Performance**: Response times, resource usage
- **Reliability**: Error handling, recovery scenarios
- **Usability**: User experience and interface testing

## Output Structure

1. **Test Strategy Overview** – comprehensive testing approach and rationale
2. **Test Implementation** – concrete test code with clear documentation
3. **Coverage Analysis** – gap identification and priority recommendations
4. **Execution Plan** – test running strategy and CI/CD integration  
5. **Next Actions** – test maintenance and expansion roadmap

## Best Practices

### Maximize Test Value
- **Specify risk areas** that need thorough coverage
- **Include existing tests** to avoid duplication
- **Mention testing framework** preferences or constraints
- **Describe edge cases** and failure scenarios to test
- **Include performance requirements** if applicable

### Test Quality Guidelines
- **Readable tests**: Clear naming and documentation
- **Maintainable tests**: Avoid brittle assertions and dependencies
- **Fast tests**: Efficient execution for CI/CD pipelines
- **Reliable tests**: Consistent results across environments

## Testing Patterns by Type

### API Testing
```javascript
// Contract testing
describe('POST /api/users', () => {
  it('creates user with valid data', async () => {
    const userData = { email: 'test@example.com', name: 'Test User' };
    const response = await request(app).post('/api/users').send(userData);
    expect(response.status).toBe(201);
    expect(response.body).toMatchObject(userData);
  });
});
```

### Component Testing
```javascript
// React component testing
test('UserProfile displays user information', () => {
  const user = { name: 'John Doe', email: 'john@example.com' };
  render(<UserProfile user={user} />);
  expect(screen.getByText('John Doe')).toBeInTheDocument();
  expect(screen.getByText('john@example.com')).toBeInTheDocument();
});
```

### Integration Testing
```javascript
// Database integration
describe('User repository', () => {
  it('creates and retrieves user', async () => {
    const userData = { email: 'test@example.com', name: 'Test User' };
    const createdUser = await userRepo.create(userData);
    const foundUser = await userRepo.findById(createdUser.id);
    expect(foundUser).toMatchObject(userData);
  });
});
```

## Follow-up Commands

- `@code.md` – implement features with **built-in testing**
- `@debug.md` – troubleshoot **test failures** and flaky tests
- `@review.md` – validate **test coverage** and quality

## Related Commands

- Use `@code.md` to **implement tested features**
- Use `@optimize.md` for **test performance** improvements
- Use `@deploy-check.md` to validate **test suite** in CI/CD