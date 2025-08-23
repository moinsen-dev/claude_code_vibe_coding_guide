# @state_tracker.md - Development State Coordinator

Visual project tracking command that creates emoji-based phase trackers for development progress monitoring with automatic PRD integration and complete workflow orchestration.

## Usage

```
@state_tracker.md [ACTION] [PARAMETERS]
```

### Available Actions

- **create** `[TASK_OR_PROJECT_NAME]` - Create new state tracker (default action)
- **start** `[PHASE_NUMBER]` - Begin work on specified phase using @code.md
- **continue** - Resume work on current in-progress phase
- **skip** `[PHASE_NUMBER] [REASON]` - Skip phase with documented reason
- **state** `[PHASE_NUMBER] [NEW_STATE]` - Update phase state
- **review** `[PHASE_NUMBER]` - Review completed phase using @review.md
- **help** - Show current status and available actions

## What It Does

Creates a comprehensive development workflow system that combines visual tracking with automated tool integration:

### Create Mode (Default)
1. **Phase Analyzer** – identifies logical development phases based on project scope
2. **State Visualizer** – creates clear emoji-based progress indicators
3. **Rule Keeper** – establishes simple project tracking rules
4. **Progress Monitor** – maintains current state visibility

### Workflow Mode (Enhanced Actions)
1. **Workflow Orchestrator** – coordinates development activities across phases
2. **Tool Integrator** – invokes appropriate Claude commands (@code.md, @ask.md, @review.md)
3. **State Manager** – updates phase states and tracks progress automatically
4. **Process Guide** – provides next-step recommendations and workflow guidance

## When to Use

::: tip Perfect for Project Visibility
- **New project kickoff** requiring progress tracking setup
- **Team coordination** needing shared visibility into development phases
- **Client updates** with visual progress representation
- **Sprint planning** with phase-based milestone tracking
- **Personal projects** needing simple progress monitoring
:::

::: info Automatic PRD Integration
- **No task provided**: Automatically reads `prd.md` from project root
- **PRD-based phases**: Extracts timeline and milestones for phase creation
- **Consistent tracking**: Aligns state tracker with PRD objectives
- **Smart planning**: Uses PRD scope to determine appropriate phases
:::

## Workflow Actions Deep Dive

### Create Action (Default)
```bash
@state_tracker.md create "New Project Name"
@state_tracker.md "New Project Name"  # Same as above
@state_tracker.md  # Uses existing PRD file
```
**When to use**: Starting a new project or setting up initial phase tracking.

### Start Action - Begin Phase Work
```bash
@state_tracker.md start 1      # Start phase 1
@state_tracker.md start        # Start next planned phase
```
**What it does**:
- Marks specified phase as 🔄 In Progress
- Automatically invokes `@code.md` with phase description
- Updates state tracker with new progress
- Provides implementation guidance

### Continue Action - Resume Current Work
```bash
@state_tracker.md continue
```
**What it does**:
- Finds current 🔄 In Progress phase
- Analyzes blockers or progress needs
- Chooses appropriate tool (@ask.md for guidance, @code.md for implementation)
- Updates phase notes with current status

### Skip Action - Skip Phase with Reason
```bash
@state_tracker.md skip 3 "API not ready yet"
@state_tracker.md skip 2 "Waiting for client approval"
```
**What it does**:
- Marks phase as ⏭️ Skipped with documented reason
- Automatically advances to next 📋 Planned phase
- Recalculates project progress percentage

### State Action - Manual State Updates
```bash
@state_tracker.md state 1 completed
@state_tracker.md state 2 blocked
@state_tracker.md state 3 review
```
**Valid states**: `planned`, `progress`, `completed`, `blocked`, `review`, `skipped`, `cancelled`, `deployed`

### Review Action - Phase Quality Review
```bash
@state_tracker.md review 1
```
**What it does**:
- Marks phase as 🔍 Under Review
- Invokes `@review.md` for comprehensive code analysis
- Integrates review findings into phase notes
- Sets final state based on review results (✅ or ⚠️)

### Help Action - Current Status & Guidance
```bash
@state_tracker.md help
```
**What it shows**:
- Current project state and active phases
- Available next actions based on current state
- Specific command examples for next steps
- Overall project progress and blockers

## Key Benefits

### 📊 Visual Simplicity
- Clean emoji-based state representation
- Immediate progress visibility at a glance
- No complex project management overhead
- Easy to understand for all stakeholders

### 🎯 Focused Tracking
- **Only phases, rules, and current state** - nothing more
- Eliminates documentation bloat
- Maintains focus on actual progress
- Quick updates during development

### 🔄 Automatic Intelligence
- Reads existing PRD files for context
- Extracts appropriate phases from project scope
- Aligns with established timelines and milestones
- Creates meaningful phase names

### ⚡ Low Maintenance
- Designed for easy manual updates
- Simple emoji state changes
- No complex status workflows
- Team-friendly update process

### 🚀 Complete Workflow Integration
- **Automated tool invocation** - Seamlessly calls @code.md, @ask.md, @review.md
- **Context preservation** - Phase descriptions passed to integrated commands
- **Progress automation** - State updates handled automatically during workflows
- **Error handling** - Graceful fallbacks and helpful guidance when issues occur

## Example Scenarios

### New SaaS Product Development
```
@state_tracker.md "TaskFlow Development"
```

**Generated Phases**:
- 📋 **Discovery & Planning** - Requirements and architecture design
- 🔄 **MVP Development** - Core features and basic functionality
- 📋 **Integration & Testing** - Third-party integrations and QA
- 📋 **Launch Preparation** - Deployment, documentation, and marketing
- 📋 **Post-Launch Iteration** - User feedback and feature improvements

### Mobile App Project
```
@state_tracker.md "InvoiceGenie Mobile App"
```

**Automatic PRD Integration**:
- Reads `prd.md` from project root
- Extracts phases from PRD timeline
- Creates state tracker aligned with PRD milestones
- Maintains consistency with established planning

### Feature Development
```
@state_tracker.md "User Authentication System"
```

**Generated Phases**:
- 🔄 **Design & Architecture** - System design and security planning
- 📋 **Backend Implementation** - API endpoints and database schema
- 📋 **Frontend Integration** - UI components and user flows
- 📋 **Testing & Security Review** - Comprehensive testing and validation
- 📋 **Deployment & Monitoring** - Production deployment and monitoring setup

## State Emoji System

### Primary States
- 📋 **Planned** - Phase defined but not started
- 🔄 **In Progress** - Currently working on this phase
- ✅ **Completed** - Phase finished and validated
- 🚀 **Deployed** - Phase delivered to production

### Special States
- ⚠️ **Blocked** - Phase stuck waiting for dependencies
- 🔍 **Under Review** - Phase complete but needs validation
- ⏭️ **Skipped** - Phase intentionally skipped with documented reason
- ❌ **Cancelled** - Phase cancelled or deprioritized

## Generated State Tracker Structure

### Project Rules
```markdown
## Project Rules
- Update emoji states as phases progress
- Only one phase should be 🔄 In Progress at a time
- Move completed phases to ✅ before starting next phase
- Use ⚠️ for blocked phases and document blockers
- Review ✅ phases before final deployment 🚀
```

### Development Phases
```markdown
## Development Phases
- 🔄 **Phase 1: Discovery & Planning** - Requirements and architecture
- 📋 **Phase 2: Core Development** - Main feature implementation
- 📋 **Phase 3: Integration & Testing** - QA and system integration
- 📋 **Phase 4: Deployment** - Production release and monitoring
```

### Current State Summary
```markdown
## Current State
**Active Phase:** Phase 1: Discovery & Planning 🔄
**Overall Progress:** 25% (1/4 phases in progress)
**Next Phase:** Core Development (blocked on architecture decisions)
```

## PRD Integration Features

### Automatic Phase Extraction
When PRD exists in project root:
- **Timeline Analysis**: Converts PRD milestones into development phases
- **Scope Assessment**: Determines appropriate number of phases (4-8)
- **Context Preservation**: Maintains alignment with PRD goals and objectives
- **Milestone Mapping**: Maps PRD deliverables to trackable phases

### Intelligent Phase Naming
- **Meaningful Names**: Creates phases that reflect actual work being done
- **Consistent Terminology**: Uses language consistent with PRD documentation
- **Logical Progression**: Ensures phases follow natural development sequence
- **Stakeholder Friendly**: Uses terms that make sense to all team members

## Complete Workflow Examples

### Starting a New Project
```bash
# 1. Create state tracker from existing PRD
@state_tracker.md create

# 2. Begin first phase
@state_tracker.md start 1

# 3. Continue development as needed
@state_tracker.md continue

# 4. Complete and review phase
@state_tracker.md state 1 completed
@state_tracker.md review 1

# 5. Move to next phase
@state_tracker.md start 2
```

### Handling Development Blockers
```bash
# Encounter a blocker
@state_tracker.md state 2 blocked

# Get architectural guidance
@state_tracker.md continue  # Will invoke @ask.md

# Resume after unblocking
@state_tracker.md state 2 progress
@state_tracker.md continue
```

### Managing Phase Dependencies
```bash
# Skip phase due to external dependency
@state_tracker.md skip 3 "Waiting for API documentation"

# Continue with next available phase
@state_tracker.md start 4

# Return to skipped phase later
@state_tracker.md state 3 planned
@state_tracker.md start 3
```

### Quality Assurance Workflow
```bash
# Complete implementation
@state_tracker.md state 2 completed

# Comprehensive review
@state_tracker.md review 2

# If review passes, deploy
@state_tracker.md state 2 deployed

# If review fails, back to development
@state_tracker.md state 2 blocked
@state_tracker.md continue  # Address review feedback
```

### Team Status Updates
```bash
# Quick status check
@state_tracker.md help

# Manual state updates during team meetings
@state_tracker.md state 1 completed
@state_tracker.md state 2 progress
@state_tracker.md state 3 review
```

## Best Practices

### Effective State Tracking

::: tip Keep It Simple
- **Limit phases** to 4-8 for clear visibility
- **Update regularly** but don't over-engineer
- **One active phase** at a time for focused work
- **Clear phase boundaries** with defined completion criteria
:::

::: info Team Coordination
- **Shared understanding** of phase definitions
- **Regular updates** during team meetings
- **Blocker documentation** when phases get stuck
- **Celebration milestones** when phases complete
:::

::: warning Maintenance Guidelines
- **Update immediately** when phase states change
- **Document blockers** that prevent progress
- **Review completed phases** before moving forward
- **Keep rules current** as project evolves
:::

### Integration Workflows

**Complete Development Lifecycle**:
1. **Planning Phase**:
   ```bash
   @prd.md "Project Name"           # Create comprehensive PRD
   @state_tracker.md create         # Generate aligned state tracker
   ```

2. **Development Phase**:
   ```bash
   @state_tracker.md start 1        # Begin first phase with @code.md
   @state_tracker.md continue       # Resume work or get guidance
   @state_tracker.md state 1 completed
   ```

3. **Quality Assurance**:
   ```bash
   @state_tracker.md review 1       # Comprehensive review with @review.md
   @state_tracker.md state 1 deployed
   ```

4. **Team Coordination**:
   ```bash
   @state_tracker.md help           # Status updates for meetings
   @state_tracker.md skip 3 "reason" # Handle dependencies
   ```

**With Other Commands**:
- **@prd.md** → **@state_tracker.md** → **@code.md** → **@review.md** → **@deploy-check.md**
- Complete workflow from planning to deployment
- Each command integrates context from previous steps
- Maintains consistency across entire development lifecycle

## Output Management

### File Creation
- **Location**: `state_tracker.md` in project root
- **Format**: Clean markdown with emoji headers
- **Content**: Only rules, phases, and current state
- **Maintenance**: Designed for easy manual updates

### Version Control Integration
- Track state tracker changes with git commits
- Review phase progression in commit history
- Share updates with team through repository
- Maintain project timeline documentation

## Team Communication

### Status Updates
Use state tracker for:
- **Daily standups**: Quick phase status review
- **Sprint planning**: Phase-based milestone planning
- **Client updates**: Visual progress communication
- **Team retrospectives**: Phase completion analysis

### Blocker Management
- **Immediate visibility**: ⚠️ emoji highlights blocked phases
- **Context documentation**: Brief blocker descriptions
- **Resolution tracking**: Clear path to unblock phases
- **Team coordination**: Shared understanding of impediments

## Related Commands

### Command Integration Chain
- **@prd.md** - **Create comprehensive PRD** before state tracking setup
- **@state_tracker.md** - **Orchestrate development workflow** with automated tool integration
- **@code.md** - **Feature implementation** automatically invoked by 'start' and 'continue' actions
- **@ask.md** - **Architectural guidance** automatically invoked when phases are blocked
- **@review.md** - **Quality assurance** automatically invoked by 'review' action
- **@deploy-check.md** - **Release readiness** validation before marking phases as 🚀 deployed

### Workflow Examples
```bash
# Complete project lifecycle
@prd.md "New Feature"                    # 1. Plan requirements
@state_tracker.md create                 # 2. Set up tracking
@state_tracker.md start 1                # 3. Begin development (calls @code.md)
@state_tracker.md continue               # 4. Resume/get guidance (calls @ask.md if blocked)
@state_tracker.md review 1               # 5. Quality review (calls @review.md)
@deploy-check.md                         # 6. Pre-deployment validation
@state_tracker.md state 1 deployed       # 7. Mark as deployed
```

### Benefits of Integration
- **Seamless workflow** - No need to remember which command to use next
- **Context preservation** - Information flows between commands automatically
- **Reduced cognitive load** - Focus on development, not process management
- **Consistent quality** - Automated reviews and validations at appropriate phases