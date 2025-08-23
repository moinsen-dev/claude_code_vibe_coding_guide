# @goals.md - Project Lead Coordinator

Project coordination command that manages team workflows, tracks progress, and coordinates specialized development team members through MCP-Hive integration.

## Usage

```
@goals.md [OPTIONAL_DIRECTIVE]
```

## What It Does

Coordinates project management through specialized development team:

1. **Frontend Developer** (moinsen-frontend-developer) – UI components, theming, user interactions
2. **Backend Developer** (moinsen-backend-developer) – API endpoints, WebSocket integration, server logic
3. **Security Engineer** (moinsen-security-engineer) – Security reviews, validation, authentication
4. **QA Engineer** (moinsen-qa-engineer) – Testing strategies, quality assurance, edge cases
5. **DevOps Engineer** (moinsen-devops-engineer) – Testing environments, deployment, automation
6. **Knowledge Curator** (moinsen-knowledge-curator) – Documentation, knowledge management

## When to Use

::: tip Project Coordination
- **Sprint planning** and task breakdown
- **Team coordination** and assignment management
- **Progress tracking** and bottleneck identification
- **Technical decision** documentation and communication
- **Cross-team dependencies** management
:::

::: info MCP-Hive Integration
- **Context fetching** from project management tools
- **Task status updates** and progress tracking
- **Expert routing** for specialized technical problems
- **Decision recording** for architectural choices
- **Knowledge sharing** across team members
:::

## Key Benefits

### 🎯 Team Coordination
- Manages specialized team members with defined expertise
- Routes complex problems to appropriate specialists
- Tracks dependencies and resolves blocking issues
- Maintains project context and decision history

### 📊 MCP-Hive Integration
- Fetches real-time project context and status
- Updates task progress and team assignments
- Records important technical decisions
- Shares insights and learnings across the team

## MCP-Hive Tools

### Context Management
- `get_context()` – fetch current project state
- `update_task(task_id, status, notes)` – track progress
- `add_task(task_id, description, parent_id, assigned_to, dependencies)` – create work

### Decision & Knowledge
- `record_decision(decision, rationale, impact_areas)` – document choices
- `find_expert(topic)` – locate specialists for problems
- `share_insight(learning, importance)` – capture team knowledge

## Related Commands

- Use `@ask.md` for **architectural decisions** requiring expert consultation
- Use `@code.md` for **detailed technical implementation**
- Coordinate with team specialists for domain-specific work