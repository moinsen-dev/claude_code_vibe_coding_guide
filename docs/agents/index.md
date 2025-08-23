# Agents & Subagents

Harness the power of specialized AI agents to delegate tasks, maintain context, and create sophisticated collaborative workflows that scale with your development needs.

## Overview

Claude Code agents are specialized AI assistants that excel at specific domains, tasks, or workflows. They're your expert consultants who understand your codebase, follow your conventions, and deliver consistent, high-quality results.

**Why Use Agents?**
- **Specialization**: Each agent masters specific domains rather than being generalist
- **Consistency**: Agents apply the same expertise and patterns every time
- **Scalability**: Delegate complex work while maintaining quality standards
- **Context Preservation**: Agents remember project patterns and preferences
- **Team Alignment**: Shared agents ensure consistent practices across team members

## Agent Architecture

### Core Agent Components

```yaml
name: "agent-name"              # Used in /agent command
description: "Brief purpose"    # Shown in help and auto-delegation
instructions: |                 # Core behavior and expertise
  Your role and responsibilities
  Key areas of focus
  Communication style
  Quality standards
tools:                          # Limited tool access for security
  - name: "Read"
  - name: "Grep" 
  - name: "Edit"
context_files:                  # Additional context
  - "docs/coding-standards.md"
  - "ARCHITECTURE.md"
```

### Agent Types by Purpose

#### 🔍 **Analysis Agents**
Deep investigation and understanding of code, systems, or problems.

#### 🏗️ **Implementation Agents** 
Building features, components, or systems with specialized expertise.

#### ✅ **Quality Assurance Agents**
Review, testing, validation, and improvement of existing code.

#### 🔧 **Maintenance Agents**
Refactoring, optimization, migration, and technical debt management.

#### 📚 **Documentation Agents**
Creating, maintaining, and improving project documentation.

## Subagent Use Cases & Patterns

### The Multi-Agent Feature Development Pattern

**Scenario**: Building a complex authentication system

```bash
# Step 1: Architecture planning
/agent system-architect "Design OAuth2 authentication with social login support"

# Step 2: Security review of plan  
/agent security-specialist "Review the proposed OAuth2 architecture for vulnerabilities"

# Step 3: Implementation
/agent backend-engineer "Implement the OAuth2 system following the approved architecture"

# Step 4: Testing strategy
/agent test-engineer "Create comprehensive test suite for the authentication system"

# Step 5: Documentation
/agent tech-writer "Document the OAuth2 implementation and integration guide"
```

**Result**: Each specialist contributes their expertise while maintaining consistency across the entire feature.

### The Database Migration Specialist Pattern

**Agent Configuration**:
```yaml
name: "db-migration-specialist"
description: "Expert in safe database migrations and schema changes"
instructions: |
  You are a database migration specialist with expertise in:
  
  MIGRATION SAFETY:
  - Always create reversible migrations
  - Check for breaking changes and data loss risks
  - Consider performance impact on large tables
  - Plan for zero-downtime deployments
  
  BEST PRACTICES:
  - Use transactions for complex migrations
  - Add proper indexes before foreign key constraints
  - Handle data transformation carefully
  - Create backup procedures before major changes
  
  COMMUNICATION:
  - Explain migration risks and mitigation strategies
  - Provide rollback procedures for each migration
  - Estimate execution time for large datasets
  
tools:
  - name: "Read"
  - name: "Write" 
  - name: "Bash"
context_files:
  - "database/schema.sql"
  - "docs/database-conventions.md"
```

**Real Usage Example**:
```bash
/agent db-migration-specialist "We need to add user preferences table and migrate 
existing preference data from the user_metadata JSON column. The users table has 
2M records in production."
```

**Agent Response**:
```sql
-- Migration: 002_add_user_preferences_table.sql
-- Estimated execution time: 15-20 minutes for 2M records

BEGIN;

-- Step 1: Create new table
CREATE TABLE user_preferences (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  preference_key VARCHAR(255) NOT NULL,
  preference_value JSONB,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Step 2: Add indexes (before data migration for performance)
CREATE INDEX idx_user_preferences_user_id ON user_preferences(user_id);
CREATE UNIQUE INDEX idx_user_preferences_user_key ON user_preferences(user_id, preference_key);

-- Step 3: Migrate existing data in batches
INSERT INTO user_preferences (user_id, preference_key, preference_value)
SELECT 
  id as user_id,
  'theme' as preference_key,
  user_metadata->>'theme' as preference_value
FROM users 
WHERE user_metadata->>'theme' IS NOT NULL;

-- Add more preference migrations here...

COMMIT;
```

### The Code Review Specialist Network

**Multiple Specialized Reviewers**:

```yaml
# Security-focused reviewer
name: "security-reviewer"
description: "Security-focused code review specialist"
instructions: |
  Focus specifically on:
  - Input validation and sanitization
  - Authentication and authorization flaws
  - SQL injection and XSS vulnerabilities
  - Secrets and sensitive data exposure
  - OWASP Top 10 compliance
```

```yaml
# Performance-focused reviewer  
name: "performance-reviewer"
description: "Performance optimization code review specialist"
instructions: |
  Analyze code for:
  - Database query efficiency and N+1 problems
  - Memory leaks and resource management
  - Algorithm complexity and optimization opportunities
  - Caching strategies and implementation
  - Bundle size and loading performance
```

**Orchestrated Review Process**:
```bash
# Comprehensive multi-perspective review
/agent security-reviewer "Review this authentication middleware for security issues"
/agent performance-reviewer "Review this same middleware for performance bottlenecks" 
/agent maintainability-reviewer "Review for code quality and maintainability"
```

### The API Documentation Generator

**Specialized Documentation Agent**:
```yaml
name: "api-doc-generator"
description: "Generates comprehensive API documentation from code"
instructions: |
  You are an API documentation specialist. Create clear, comprehensive documentation including:
  
  STRUCTURE:
  - OpenAPI/Swagger specifications
  - Request/response examples with real data
  - Error handling documentation
  - Authentication requirements
  
  QUALITY STANDARDS:
  - Use consistent terminology throughout
  - Include edge cases and validation rules
  - Provide code examples in multiple languages
  - Document rate limiting and quotas
  
  MAINTENANCE:
  - Keep documentation in sync with implementation
  - Add versioning information
  - Include deprecation notices when needed

tools:
  - name: "Read"
  - name: "Write"
  - name: "Grep"
context_files:
  - "src/routes/*.js"
  - "docs/api-standards.md"
```

**Usage Pattern**:
```bash
/agent api-doc-generator "Generate complete API documentation for the user management endpoints in src/routes/users.js"
```

### The Testing Strategy Architect

**Comprehensive Test Planning Agent**:
```yaml
name: "test-architect"
description: "Designs comprehensive testing strategies and implements test suites"
instructions: |
  You are a testing expert who designs testing strategies following the testing pyramid:
  
  UNIT TESTS (70%):
  - Test individual functions and components
  - Focus on edge cases and error conditions
  - Mock external dependencies appropriately
  
  INTEGRATION TESTS (20%):
  - Test component interactions
  - Database integration tests
  - API endpoint testing
  
  E2E TESTS (10%):
  - Critical user workflows
  - Cross-browser compatibility
  - Mobile responsive testing
  
  TESTING PRINCIPLES:
  - Tests should be fast, reliable, and maintainable
  - Follow AAA pattern (Arrange, Act, Assert)
  - Use descriptive test names
  - Avoid testing implementation details
  
tools:
  - name: "Read"
  - name: "Write"
  - name: "Bash"
context_files:
  - "package.json"
  - "jest.config.js"
  - "cypress.json"
```

## Advanced Agent Patterns

### The Code Modernization Team

**Legacy System Upgrade Workflow**:
```bash
# Analysis phase
/agent legacy-analyzer "Analyze the jQuery codebase in src/legacy/ for modernization opportunities"

# Planning phase  
/agent migration-planner "Create migration plan from jQuery to React based on the analysis"

# Implementation phase
/agent react-converter "Convert the user dashboard component following the migration plan"

# Validation phase
/agent compatibility-tester "Test the converted component for feature parity and performance"
```

### The DevOps Automation Network

**Infrastructure as Code Specialists**:
```yaml
name: "terraform-specialist"
description: "Terraform infrastructure automation expert"

name: "docker-specialist" 
description: "Container and orchestration expert"

name: "cicd-architect"
description: "CI/CD pipeline design and optimization specialist"
```

**Coordinated Infrastructure Setup**:
```bash
/agent terraform-specialist "Design AWS infrastructure for the TaskFlow application"
/agent docker-specialist "Create optimized containers for the designed infrastructure"  
/agent cicd-architect "Build deployment pipeline using the containers and infrastructure"
```

### The Mobile Development Squad

**Cross-Platform Mobile Team**:
```yaml
name: "react-native-expert"
description: "React Native and cross-platform mobile development specialist"

name: "ios-specialist"
description: "iOS native development and App Store optimization expert"

name: "android-specialist" 
description: "Android native development and Play Store optimization expert"
```

## Agent Management Best Practices

### 1. **Scope Limitation** 🎯
- Give agents specific, well-defined responsibilities
- Limit tool access to what each agent actually needs
- Avoid creating "do everything" agents

### 2. **Context Optimization** 📋
- Include relevant documentation in context_files
- Keep agent instructions focused and actionable
- Update context as project evolves

### 3. **Quality Validation** ✅
- Test agents with real scenarios before team adoption
- Validate outputs match expected quality standards
- Iterate on instructions based on actual usage

### 4. **Team Coordination** 🤝
- Share successful agent configurations with team
- Establish naming conventions for agent organization
- Document agent capabilities and use cases

### 5. **Evolution Management** 🔄
- Version control agent configurations
- Update agents as project patterns change
- Retire or merge agents that become redundant

## Integration with Command System

Agents work seamlessly with command workflows:

```bash
# Command invokes specialized agents automatically
@code.md "Implement user authentication"
# Internally coordinates: system-architect → security-reviewer → backend-engineer → test-architect

@review.md "Review this payment processing code"  
# Automatically delegates to security-reviewer and performance-reviewer
```

## Common Agent Recipes

### The Full-Stack Feature Team
- `frontend-specialist`: React/Vue/Angular expert
- `backend-specialist`: API and business logic expert  
- `database-specialist`: Schema and query optimization expert
- `test-specialist`: Comprehensive testing strategy expert

### The Security Audit Squad
- `security-auditor`: General security review and OWASP compliance
- `auth-specialist`: Authentication and authorization expert
- `crypto-specialist`: Encryption and cryptographic implementation expert
- `infrastructure-security`: DevOps and infrastructure security expert

### The Performance Optimization Team
- `frontend-perf`: Bundle size, rendering, and UX performance expert
- `backend-perf`: API response time and server optimization expert
- `database-perf`: Query optimization and indexing specialist
- `infrastructure-perf`: Scaling and resource optimization expert

This agent ecosystem transforms development from individual effort into orchestrated specialist collaboration, delivering higher quality results while maintaining development velocity.