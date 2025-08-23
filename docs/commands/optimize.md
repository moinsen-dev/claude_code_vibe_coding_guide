# @optimize.md - Performance Optimization Coordinator

Systematic performance optimization command that identifies bottlenecks through measurement and implements data-driven improvements with quantified results.

## Usage

```
@optimize.md <PERFORMANCE_TARGET>
```

## What It Does

Coordinates performance optimization through four specialists:

1. **Profiler Analyst** – identifies bottlenecks through systematic measurement
2. **Algorithm Engineer** – optimizes computational complexity and data structures  
3. **Resource Manager** – optimizes memory, I/O, and system resource usage
4. **Scalability Architect** – ensures solutions work under increased load

## When to Use

::: danger Performance Critical Issues
- **Slow page load times** affecting user experience
- **API response times** exceeding SLA requirements
- **Database queries** taking too long to execute
- **Memory usage** causing out-of-memory errors
- **CPU bottlenecks** under normal or peak load
:::

::: warning Scalability Concerns
- **Application slowdown** under increased traffic
- **Resource exhaustion** during peak usage
- **Concurrent user limits** being reached
- **Database performance** degrading with data growth
- **Cache efficiency** problems with hit rates
:::

## Key Benefits

### 📊 Data-Driven Optimization
- Establishes performance baselines and metrics
- Measures actual impact of optimization efforts
- Identifies real bottlenecks vs perceived issues
- Provides quantified improvement results

### 🎯 Systematic Approach
- **Profiling**: Execution time, memory usage, resource consumption
- **Algorithm**: Time/space complexity improvements
- **Resource**: Caching, batching, resource allocation
- **Scalability**: Horizontal scaling and concurrent processing

## Example Scenarios

### Slow Database Dashboard
```
@optimize.md "Dashboard loading takes 8-12 seconds with 50K+ records. 
Need to get under 2 seconds. Complex joins across 5 tables with 
filtering and aggregation. Current queries in @report-queries.sql"
```

### API Response Time Issues
```
@optimize.md "User profile API endpoint averaging 3-5 second response 
times under normal load. Need sub-500ms responses. Includes user data, 
preferences, activity history, and related content aggregation."
```

## Related Commands

- Use `@review.md` to **identify optimization opportunities**
- Use `@debug.md` for **performance-related bugs**
- Use `@code.md` to **implement optimized solutions**