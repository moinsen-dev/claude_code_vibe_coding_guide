# @debug.md - Debug Coordinator

Systematic debugging command that orchestrates four specialist agents to identify root causes, not just symptoms, and provide comprehensive solutions.

## Usage

```
@debug.md <ERROR_DESCRIPTION>
```

## What It Does

Coordinates systematic debugging through four specialist agents:

1. **Error Analyzer** – identifies root cause and error patterns
2. **Code Inspector** – examines relevant code sections and logic flow
3. **Environment Checker** – validates configuration, dependencies, and environment
4. **Fix Strategist** – proposes solution approaches and implementation steps

## When to Use

::: danger Critical Production Issues
- **Production outages** requiring immediate root cause analysis
- **Performance degradation** affecting user experience
- **Data corruption** or inconsistency issues
- **Security breaches** or vulnerability exploitation
- **Integration failures** between systems
:::

::: warning Development Blocking Issues
- **Intermittent bugs** that are hard to reproduce
- **Complex stack traces** spanning multiple systems
- **Memory leaks** or resource exhaustion
- **Configuration-related failures** across environments
- **Third-party integration problems**
:::

::: info General Debugging Scenarios
- **Logic errors** in complex business rules
- **Race conditions** in concurrent code
- **Database query optimization** issues
- **API response inconsistencies**
- **Build or deployment failures**
:::

## Key Benefits

### 🔍 Root Cause Focus
- Goes beyond surface symptoms to find actual problems
- Traces issues through the entire system architecture
- Identifies contributing factors and failure chains
- Prevents recurring issues through proper fixes

### 🧩 Multi-Perspective Analysis
- **Error patterns**: Classification and severity assessment
- **Code flow**: Execution path and logic analysis
- **Environment**: Configuration and dependency validation
- **Solution strategy**: Risk-assessed fix approaches

### 📊 Comprehensive Documentation
- Complete debugging transcript with reasoning
- Clear explanation of what went wrong and why
- Step-by-step solution with code changes
- Verification plan to confirm fixes work

### 🛡️ Prevention Planning
- Monitoring recommendations for early detection
- Testing strategies to prevent regression
- Documentation improvements for future debugging

## Example Scenarios

### Intermittent Database Connection Failures
```
@debug.md "Users randomly getting 'connection timeout' errors when 
accessing their dashboard. Happens about 10% of the time, no clear pattern. 
Database shows normal CPU/memory usage. Error started after recent deployment."
```

**Why @debug.md**: Intermittent issues require systematic analysis across error patterns, code changes, environment differences, and comprehensive solution strategy.

### Memory Leak in Production
```
@debug.md "Application memory usage keeps growing until OOM crash. 
Happens after 4-6 hours in production but never in development. 
Memory profiling shows objects not being garbage collected properly."
```

**Why @debug.md**: Complex production-only issue needing environment comparison, code analysis for memory management, and strategic fix planning.

### API Integration Suddenly Failing
```
@debug.md "Third-party payment API started returning 500 errors yesterday. 
No code changes on our side. Some requests succeed, others fail. 
Error response is generic 'Internal Server Error' with no details."
```

**Why @debug.md**: External integration failure requiring error pattern analysis, environment checking, and strategic solution planning including fallback options.

## Workflow Process

### 1. Initial Assessment
- Analyzes error description and gathers context
- Classifies error type and severity
- Identifies immediate investigation priorities

### 2. Agent Delegation
- **Error Analyzer**: Pattern recognition and impact scope
- **Code Inspector**: Logic flow and problematic code identification
- **Environment Checker**: Configuration and dependency validation  
- **Fix Strategist**: Solution design with risk assessment

### 3. Synthesis & Validation
- Combines insights into comprehensive debugging strategy
- Validates that proposed fixes address root cause
- Ensures solutions don't introduce new problems

## Output Structure

1. **Debug Transcript** – reasoning process and findings from each agent
2. **Root Cause Analysis** – clear explanation of what went wrong and why  
3. **Solution Implementation** – step-by-step fix with code changes
4. **Verification Plan** – testing strategy to confirm fix and prevent regression
5. **Next Actions** – monitoring, prevention, and follow-up items

## Best Practices

### Provide Rich Context
- **Include error messages** and stack traces in full
- **Describe reproduction steps** if known
- **Mention recent changes** that might be related
- **Specify affected environments** (prod, staging, dev)
- **Include timing information** (when it started, frequency)

### Follow-up Commands
- `@test.md` – create tests to prevent regression
- `@review.md` – security review if vulnerability-related
- `@optimize.md` – performance improvements if performance-related

## Debugging Scenarios by Type

### Logic Errors
- Business rule violations
- Calculation mistakes
- State management issues
- Data transformation problems

### Performance Issues  
- Slow database queries
- Memory leaks
- CPU bottlenecks
- Network timeouts

### Integration Problems
- API compatibility issues
- Data format mismatches
- Authentication failures
- Service dependencies

### Environment Issues
- Configuration differences
- Version compatibility
- Resource constraints
- Network connectivity

## Related Commands

- Use `@ask.md` for **architectural questions** about system design
- Use `@optimize.md` for **performance-specific** debugging
- Use `@code.md` for **implementing fixes** after root cause identification