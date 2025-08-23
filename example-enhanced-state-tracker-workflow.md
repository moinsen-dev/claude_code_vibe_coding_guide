# Enhanced State Tracker Workflow Examples

*Examples demonstrating the enhanced @state_tracker.md command with multiple actions*

## Complete Project Development Lifecycle

### 1. Project Setup and Initial Planning

```bash
# Create PRD for new project
@prd.md "TaskFlow - Advanced Task Management System"

# Generate aligned state tracker from PRD
@state_tracker.md create
```

**Generated State Tracker**: `state_tracker.md`
```markdown
# TaskFlow Development State Tracker

## Project Rules
- Update emoji states as phases progress
- Only one phase should be 🔄 In Progress at a time
- Move completed phases to ✅ before starting next phase
- Use ⚠️ for blocked phases and document blockers
- Review ✅ phases before final deployment 🚀

## Development Phases

### Phase 1: Architecture & Database Design
🔄 **Status: In Progress**
- System architecture planning
- Database schema design
- API endpoint specification

### Phase 2: Core Backend Development
📋 **Status: Planned**
- User authentication system
- Task CRUD operations
- Project management APIs

### Phase 3: Frontend Implementation
📋 **Status: Planned**
- React components development
- State management with Redux
- UI/UX implementation

### Phase 4: Integration & Testing
📋 **Status: Planned**
- Frontend-backend integration
- Unit and integration tests
- Performance optimization

### Phase 5: Deployment & Launch
📋 **Status: Planned**
- Production deployment
- Monitoring setup
- Launch preparation

## Current State
**Active Phase:** Phase 1: Architecture & Database Design 🔄
**Overall Progress:** 20% (1/5 phases in progress)
**Next Phase:** Core Backend Development
```

### 2. Beginning Development Work

```bash
# Start working on first phase (automatically invokes @code.md)
@state_tracker.md start 1

# This internally calls: @code.md "System architecture planning, database schema design, API endpoint specification"
```

**What happens**:
- Phase 1 marked as 🔄 In Progress
- @code.md invoked with phase description
- Implementation plan generated
- State tracker updated with progress

### 3. Continuing Development

```bash
# Resume current work
@state_tracker.md continue

# If blocked, this will invoke @ask.md for architectural guidance
# If progressing normally, continues with @code.md implementation
```

### 4. Handling Development Blockers

```bash
# Mark phase as blocked due to external dependency
@state_tracker.md state 1 blocked

# Continue command now provides architectural guidance
@state_tracker.md continue
# Internally calls: @ask.md "Need guidance on database schema design for TaskFlow system"

# After resolving blocker, resume development
@state_tracker.md state 1 progress
@state_tracker.md continue
```

### 5. Phase Completion and Review

```bash
# Mark phase as completed
@state_tracker.md state 1 completed

# Comprehensive review of completed work
@state_tracker.md review 1
# Internally calls: @review.md "Phase 1: Architecture & Database Design implementation"

# If review passes, move to next phase
@state_tracker.md start 2
```

### 6. Managing Phase Dependencies

```bash
# Skip phase due to external dependency
@state_tracker.md skip 3 "UI/UX designs not ready from design team"

# Continue with backend-focused work
@state_tracker.md start 4

# Later, return to skipped phase
@state_tracker.md state 3 planned
@state_tracker.md start 3
```

### 7. Team Status and Coordination

```bash
# Quick status check for daily standup
@state_tracker.md help
```

**Output Example**:
```
# TaskFlow Project Status

**Current State**: Phase 2: Core Backend Development 🔄 In Progress
**Overall Progress**: 40% (2/5 phases completed)

## Phase Status:
- ✅ Phase 1: Architecture & Database Design (Completed, Reviewed)
- 🔄 Phase 2: Core Backend Development (In Progress - 60% complete)  
- ⏭️ Phase 3: Frontend Implementation (Skipped - UI designs pending)
- 📋 Phase 4: Integration & Testing (Planned)
- 📋 Phase 5: Deployment & Launch (Planned)

## Available Actions:
- @state_tracker.md continue          # Resume Phase 2 development
- @state_tracker.md state 2 completed # Mark Phase 2 as done
- @state_tracker.md review 2          # Review Phase 2 work
- @state_tracker.md state 3 planned   # Unblock Phase 3

## Next Recommended Action:
@state_tracker.md continue  # Continue Phase 2 implementation
```

## Advanced Workflow Scenarios

### Quality Assurance Workflow

```bash
# Development complete
@state_tracker.md state 2 completed

# Comprehensive review
@state_tracker.md review 2
# Calls: @review.md with full phase context and implementation

# Handle review results
# If review passes:
@state_tracker.md state 2 deployed

# If review fails:
@state_tracker.md state 2 blocked
@state_tracker.md continue  # Address review feedback
```

### Multi-Developer Coordination

```bash
# Developer A updates their work
@state_tracker.md state 2 completed

# Developer B checks status before starting
@state_tracker.md help

# Developer B starts next phase
@state_tracker.md start 3

# Team lead reviews completed work
@state_tracker.md review 2
```

### Emergency Phase Management

```bash
# Cancel problematic phase
@state_tracker.md state 4 cancelled

# Reprioritize remaining work
@state_tracker.md start 5

# Add replacement phase manually to state_tracker.md
# Then use standard workflow commands
```

## State Tracker Integration Benefits

### 1. **Automated Tool Invocation**
- No need to remember which command to use next
- Context automatically passed between commands
- Seamless workflow progression

### 2. **Progress Tracking**
- Real-time phase status updates
- Automatic progress percentage calculation
- Timestamp tracking for all state changes

### 3. **Team Coordination**
- Shared visibility into project state
- Clear documentation of blockers and dependencies
- Standardized workflow across team members

### 4. **Quality Assurance**
- Integrated review process
- Automatic review invocation for completed phases
- Quality gates before phase progression

### 5. **Flexibility**
- Handle unexpected dependencies with skip/resume
- Manual state updates when needed
- Graceful handling of development obstacles

## Error Handling Examples

### Missing State Tracker
```bash
@state_tracker.md start 1
# Error: No state_tracker.md found. Please create one first:
# @state_tracker.md create "Your Project Name"
```

### Invalid Phase Number
```bash
@state_tracker.md start 10
# Error: Phase 10 not found. Available phases:
# 1. Architecture & Database Design (✅ Completed)
# 2. Core Backend Development (🔄 In Progress)
# 3. Frontend Implementation (📋 Planned)
# 4. Integration & Testing (📋 Planned)
# 5. Deployment & Launch (📋 Planned)
```

### Invalid State Transition
```bash
@state_tracker.md state 1 deployed  # When phase is still "planned"
# Error: Cannot transition from 📋 Planned to 🚀 Deployed
# Valid transitions: 📋 → 🔄 (start working)
# Use: @state_tracker.md start 1
```

This enhanced state_tracker system transforms simple visual tracking into a complete development workflow orchestrator, seamlessly integrating planning, implementation, review, and deployment phases.