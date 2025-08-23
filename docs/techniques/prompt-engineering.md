# Prompt Engineering for Claude Code

Master the art of communicating with Claude to generate high-quality, production-ready code through proven prompting techniques.

## XML Tag Structuring

Claude excels with XML-style structured prompts, leveraging its fine-tuning on structured data. This approach dramatically improves code quality and accuracy by 30-40% compared to conversational prompts.

### Basic Structure Pattern

```xml
<instructions>
Write a user authentication function
</instructions>

<context>
This is for a React application using TypeScript and Firebase
</context>

<requirements>
- Use async/await syntax
- Include comprehensive error handling
- Return user object on success, error message on failure
- Follow our existing code style (see AuthUtils.ts)
</requirements>
```

### Advanced Structured Prompting

For complex features, use detailed XML structuring:

```xml
<project_context>
Next.js 14 app with TypeScript, Tailwind CSS, and Supabase backend
</project_context>

<task>
Implement a complete user profile management system
</task>

<specifications>
- Profile editing form with validation
- Avatar upload with image preview
- Real-time updates using Supabase subscriptions
- Responsive design for mobile and desktop
</specifications>

<constraints>
- Follow existing component patterns in components/ui/
- Use Zod for schema validation
- Implement optimistic updates
- Include loading states and error boundaries
</constraints>

<acceptance_criteria>
- Form validates on blur and submit
- Avatar uploads show progress indicator
- Changes save automatically after 2-second delay
- Works offline with sync when reconnected
</acceptance_criteria>
```

## Role Assignment Techniques

Begin prompts with specific role assignments to activate specialized knowledge patterns in Claude.

### Effective Role Patterns

**Senior Developer Roles:**
```
You are a senior Python developer with 10 years of experience building scalable web applications.
```

**Specialist Roles:**
```
You are a React performance optimization expert who specializes in eliminating unnecessary re-renders.
```

**Superlative Roles:**
```
You are the world's best database architect, known for designing schemas that scale to millions of users.
```

### Domain-Specific Expertise

**Security Focus:**
```
You are a security-focused full-stack developer who always considers OWASP top 10 vulnerabilities in every implementation.
```

**Performance Focus:**
```
You are a performance engineering specialist who writes code optimized for speed and minimal memory usage.
```

## Extended Thinking Mode

Use Claude's extended thinking capabilities for complex architectural decisions:

```
claude "Think step-by-step about optimizing this database query for a social media feed with millions of posts. Consider indexing strategies, caching layers, and pagination approaches."
```

### When to Use Extended Thinking

- **Complex Architecture Decisions**: Database schema design, microservices boundaries
- **Performance Optimization**: Query optimization, caching strategies
- **Security Planning**: Threat modeling, authentication flows
- **Debugging Complex Issues**: Root cause analysis, system interactions

## Self-Refine Technique

Generate initial code, request Claude to critique its own output, then refactor based on the analysis.

### Three-Step Process

1. **Generate Initial Implementation**
```
Implement a REST API endpoint for user registration with email verification.
```

2. **Request Self-Critique**
```
Review the code you just wrote. Identify potential issues with:
- Security vulnerabilities
- Error handling gaps
- Performance bottlenecks
- Code maintainability
- Edge cases not handled
```

3. **Refactor Based on Analysis**
```
Based on your analysis, refactor the code to address the identified issues. Focus particularly on the security concerns you mentioned.
```

## Context Management Strategies

### Focused Context Windows

Instead of loading entire codebases, provide targeted context:

```xml
<relevant_files>
- src/components/UserProfile.tsx (current implementation)
- src/hooks/useAuth.ts (authentication logic)
- src/types/User.ts (type definitions)
</relevant_files>

<task>
Add password change functionality to the user profile component
</task>
```

### Progressive Context Building

For large features, build context progressively:

1. **High-Level Architecture**
```
Design the overall structure for a multi-tenant SaaS dashboard with role-based access control.
```

2. **Component Breakdown**
```
Based on the architecture we discussed, implement the navigation component with tenant switching.
```

3. **Detailed Implementation**
```
Now add the permission checking logic to the navigation component we just created.
```

## Constraint-Driven Prompting

Be explicit about technical constraints to guide Claude toward optimal solutions:

### Technical Constraints

```xml
<constraints>
- Must work with Internet Explorer 11
- Bundle size cannot exceed 500KB
- API calls must complete within 2 seconds
- Must be accessible (WCAG 2.1 AA compliant)
- No external dependencies beyond what's in package.json
</constraints>
```

### Business Constraints

```xml
<constraints>
- Must be implementable within 2 days
- Should reuse existing authentication system
- Must integrate with current payment provider
- Should not require database schema changes
</constraints>
```

## Pattern-Based Prompting

Reference established patterns to leverage Claude's training on best practices:

### Architecture Patterns

```
Implement a shopping cart using the Redux pattern with actions, reducers, and selectors.
```

### Design Patterns

```
Create a file upload component using the Observer pattern to notify multiple components of upload progress.
```

### Framework Patterns

```
Build a Next.js API route following the repository pattern with dependency injection.
```

## Iterative Refinement Process

### Start Broad, Then Narrow

1. **Initial Requirements**
```
I need a user dashboard for a project management application.
```

2. **Add Specificity**
```
The dashboard should show:
- Recent projects with progress indicators
- Task assignments for the current user
- Upcoming deadlines in the next 7 days
- Quick actions for common tasks
```

3. **Technical Details**
```
Implement this as a React component using:
- React Query for data fetching
- Chart.js for progress visualizations
- Date-fns for date formatting
- Tailwind for styling
```

4. **Polish and Edge Cases**
```
Add loading states, error boundaries, and empty states. Handle the case where users have no projects assigned.
```

## Advanced Prompting Patterns

### Conditional Logic Prompting

```xml
<instructions>
If the user is an admin, show all projects.
If the user is a manager, show projects in their department.
If the user is a contributor, show only assigned projects.
</instructions>
```

### Template-Based Generation

```xml
<template>
Generate a CRUD controller following this pattern:
- GET /api/{resource} (with filtering and pagination)
- GET /api/{resource}/{id}
- POST /api/{resource} (with validation)
- PUT /api/{resource}/{id}
- DELETE /api/{resource}/{id}
</template>

<resource>
articles
</resource>
```

## Common Pitfalls to Avoid

### ❌ Vague Prompts
```
Make this code better.
```

### ✅ Specific Improvement Requests
```
Refactor this React component to eliminate prop drilling by using React Context. Focus on the user authentication state that's being passed down 4 levels.
```

### ❌ Overwhelming Context
```
Here's my entire codebase... [dumps 50 files]
```

### ✅ Targeted Context
```
Here are the 3 files related to user authentication that need to be updated for the new password reset feature.
```

### ❌ No Success Criteria
```
Build a search feature.
```

### ✅ Clear Acceptance Criteria
```xml
<acceptance_criteria>
- Search results appear within 200ms
- Supports fuzzy matching (typo tolerance)
- Highlights matching terms in results
- Shows "no results" state with suggestions
- Remembers recent searches
</acceptance_criteria>
```

## Measuring Prompt Effectiveness

Track these metrics to improve your prompting:

- **First-time Success Rate**: Code works without modifications
- **Iteration Count**: Average rounds of refinement needed
- **Code Quality**: Maintainability, performance, security
- **Time to Implementation**: Total time from prompt to working code

## Next Steps

- Practice XML structuring with your current project
- Experiment with different role assignments for your domain
- Try the self-refine technique on a complex feature
- Read about [Context Management](/advanced/context) for large projects
- Learn [Multi-Agent Patterns](/advanced/multi-agent-patterns) for complex workflows