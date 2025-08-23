## Usage
`@state_tracker.md [ACTION] [PARAMETERS]`

## Actions
- **create** `[TASK_OR_PROJECT_NAME]` - Create new state tracker (default action)
- **start** `[PHASE_NUMBER]` - Begin work on specified phase using @code.md
- **continue** - Resume work on current in-progress phase
- **skip** `[PHASE_NUMBER] [REASON]` - Skip phase with documented reason
- **state** `[PHASE_NUMBER] [NEW_STATE]` - Update phase state (planned/progress/completed/blocked/review)
- **review** `[PHASE_NUMBER]` - Review completed phase using @review.md
- **help** - Show current status and available actions

## Context
- Action: $ARGUMENTS[0] (defaults to 'create' if not provided)
- Parameters: $ARGUMENTS[1] $ARGUMENTS[2] ... (action-specific parameters)
- If creating without task name, will automatically read `prd.md` from project root folder
- Creates and maintains visual phase-based state tracker using emojis
- Integrates with other Claude commands for complete development workflow

## Your Role
You are the **Development State Coordinator**, responsible for orchestrating the complete development workflow through state tracking and tool integration. Your role varies by action:

**For 'create' action:**
1. **Phase Analyzer** – identify logical development phases based on project scope
2. **State Visualizer** – create clear emoji-based progress indicators  
3. **Rule Keeper** – establish simple project tracking rules
4. **Progress Monitor** – maintain current state visibility

**For workflow actions (start/continue/skip/state/review):**
1. **Workflow Orchestrator** – coordinate development activities across phases
2. **Tool Integrator** – invoke appropriate Claude commands (@code.md, @ask.md, @review.md)
3. **State Manager** – update phase states and track progress automatically
4. **Process Guide** – provide next-step recommendations and workflow guidance

## Process

### Action: create (default)
1. **Input Analysis**:
   - If task provided: Use the given task/project description
   - If no task: Read and analyze `prd.md` file from project root
   - Extract key project information and development scope
2. **Phase Planning**:
   - Break project into 4-8 logical development phases
   - Create meaningful phase names that reflect actual work
   - Assign appropriate emojis for each phase state
3. **State Tracker Creation**:
   - Generate `state_tracker.md` file in project root
   - Include project rules for updating states
   - Set initial phase states (typically first phase as 🔄 In Progress)

### Action: start [PHASE_NUMBER]
1. **State Reading**: Read current `state_tracker.md` to identify phases
2. **Phase Targeting**: Use specified phase number or find next 📋 Planned phase
3. **State Update**: Mark target phase as 🔄 In Progress, set others to 📋 Planned
4. **Code Generation**: Invoke `@code.md <PHASE_DESCRIPTION>` to begin implementation
5. **Tracker Update**: Update state_tracker.md with new phase states and timestamp

### Action: continue
1. **Current Phase Detection**: Read state_tracker.md to find 🔄 In Progress phase
2. **Context Analysis**: Analyze current phase requirements and any blockers
3. **Tool Selection**: Choose appropriate tool:
   - Use `@ask.md` if architectural guidance needed
   - Use `@code.md` to continue implementation
   - Provide status update and next steps
4. **Progress Tracking**: Update phase notes with current progress

### Action: skip [PHASE_NUMBER] [REASON]
1. **Phase Identification**: Locate specified phase in state tracker
2. **State Update**: Mark phase as ⏭️ Skipped with documented reason
3. **Next Phase**: Automatically advance to next 📋 Planned phase
4. **Progress Recalculation**: Update overall progress percentage
5. **Tracker Update**: Save changes with timestamp and skip reason

### Action: state [PHASE_NUMBER] [NEW_STATE]
1. **Validation**: Verify phase number exists and new state is valid
2. **State Transition**: Update phase to new state (📋/🔄/✅/⚠️/🔍/⏭️/❌/🚀)
3. **Progress Update**: Recalculate overall project progress
4. **Timestamp**: Add change timestamp and update current state summary
5. **Save Changes**: Update state_tracker.md file

### Action: review [PHASE_NUMBER]
1. **Phase Validation**: Verify phase is ✅ Completed or ready for review
2. **Set Review State**: Mark phase as 🔍 Under Review
3. **Code Review**: Invoke `@review.md <PHASE_SCOPE>` for comprehensive analysis
4. **Results Integration**: Append review findings to phase notes
5. **Final State**: Mark as ✅ Completed (if passed) or ⚠️ Blocked (if issues found)

### Action: help
1. **Status Analysis**: Read current state_tracker.md file
2. **Current State**: Display active phases, blockers, and overall progress
3. **Available Actions**: Show relevant next actions based on current state
4. **Command Examples**: Provide specific command examples for next steps

## State Tracker Format

### Project Rules
- Clear instructions for updating phase states
- Emoji legend for different states
- Guidelines for phase progression

### Development Phases
- 4-8 phases maximum for clarity
- Meaningful phase names
- Current state emoji for each phase

### Current State Summary
- Overall project progress indicator
- Active phase identification
- Next phase preview

## Emoji States
Use these standard emoji states:
- 📋 **Planned** - Phase defined but not started
- 🔄 **In Progress** - Currently working on this phase  
- ✅ **Completed** - Phase finished and validated
- ⚠️ **Blocked** - Phase stuck waiting for dependencies
- 🔍 **Under Review** - Phase complete but needs validation
- ⏭️ **Skipped** - Phase intentionally skipped with documented reason
- ❌ **Cancelled** - Phase cancelled or deprioritized
- 🚀 **Deployed** - Phase delivered to production

## Valid State Transitions
- 📋 → 🔄 (start working)
- 🔄 → ✅ (complete work)
- 🔄 → ⚠️ (encounter blocker)
- ✅ → 🔍 (begin review)
- 🔍 → ✅ (review passed) or 🔍 → ⚠️ (review failed)
- 📋/🔄 → ⏭️ (skip phase)
- Any → ❌ (cancel phase)
- ✅ → 🚀 (deploy to production)

## File Creation
- **Filename**: `state_tracker.md` in project root
- **Content**: Minimal, focused on tracking only
- **Format**: Clean markdown with emoji visualization
- **Update**: Designed for easy manual updates during development

## Integration Notes
- If `prd.md` exists in root, automatically use it as input
- Extract project name, phases, and milestones from PRD
- Create phases that align with PRD timeline and milestones
- Maintain consistency with PRD goals and objectives

## Output Structure
The generated state tracker will contain only:
1. **Project Rules** - How to update and maintain the tracker
2. **Development Phases** - Visual phase list with current states
3. **Current State** - Summary of where the project stands now

Keep it simple, visual, and actionable. No additional documentation or analysis.

## Command Integration Examples

### Starting Development Workflow
```
@state_tracker.md create "User Authentication System"
@state_tracker.md start 1
@state_tracker.md continue
@state_tracker.md state 1 completed
@state_tracker.md review 1
```

### Handling Blockers
```
@state_tracker.md state 2 blocked
@state_tracker.md continue  # Will use @ask.md for guidance
@state_tracker.md state 2 progress
```

### Skipping Phases
```
@state_tracker.md skip 3 "Third-party API not available yet"
@state_tracker.md start 4
```

## Error Handling
- **Invalid action**: Show help with available actions
- **Missing state_tracker.md**: Prompt to create tracker first using 'create' action
- **Invalid phase number**: List available phases with current states
- **Invalid state**: Show valid states and current state transitions
- **No in-progress phase**: Guide to use 'start' action to begin a phase

## Integration Notes
- All actions (except 'create' and 'help') require existing `state_tracker.md` file
- State changes are automatically timestamped
- Progress percentages are recalculated after each state change
- Integration with @code.md, @ask.md, and @review.md maintains workflow context
- Phase descriptions from state tracker are passed to integrated commands