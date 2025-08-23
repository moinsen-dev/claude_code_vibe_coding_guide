#!/bin/bash
# Claude Code Hook: Smart Development Companion
# A comprehensive hook that provides intelligent assistance throughout development
# Combines session management, quality gates, error handling, and proactive suggestions

# Read hook input from stdin (Claude Code passes JSON data)  
read -r HOOK_INPUT

# Extract event information
EVENT_TYPE=$(echo "$HOOK_INPUT" | jq -r '.event_type // "unknown"' 2>/dev/null || echo "unknown")
TOOL_NAME=$(echo "$HOOK_INPUT" | jq -r '.tool_name // ""' 2>/dev/null || echo "")
FILE_PATH=$(echo "$HOOK_INPUT" | jq -r '.file_path // ""' 2>/dev/null || echo "")
SESSION_ID=$(echo "$HOOK_INPUT" | jq -r '.session_id // ""' 2>/dev/null || echo "")

# Configuration
CONFIG_DIR="$HOME/.claude/config"
METRICS_DIR="$HOME/.claude/metrics"
CACHE_DIR="$HOME/.claude/cache"
STATE_DIR="$HOME/.claude/state"

# Create all required directories
mkdir -p "$CONFIG_DIR" "$METRICS_DIR" "$CACHE_DIR" "$STATE_DIR"

# Initialize companion configuration if not exists
COMPANION_CONFIG="$CONFIG_DIR/smart-companion.json"
if [ ! -f "$COMPANION_CONFIG" ]; then
    cat > "$COMPANION_CONFIG" << 'EOF'
{
  "companion": {
    "enabled": true,
    "learning_mode": true,
    "proactive_suggestions": true,
    "context_awareness": true
  },
  "features": {
    "pattern_recognition": true,
    "workflow_optimization": true,
    "error_prediction": true,
    "productivity_insights": true,
    "team_coordination": false
  },
  "intelligence": {
    "track_patterns": true,
    "suggest_improvements": true,
    "predict_issues": true,
    "optimize_workflows": true
  },
  "notifications": {
    "productivity_tips": true,
    "pattern_alerts": true,
    "workflow_suggestions": true
  }
}
EOF
fi

# Load configuration
COMPANION_ENABLED=$(jq -r '.companion.enabled // true' < "$COMPANION_CONFIG")
LEARNING_MODE=$(jq -r '.companion.learning_mode // true' < "$COMPANION_CONFIG")
PROACTIVE_SUGGESTIONS=$(jq -r '.companion.proactive_suggestions // true' < "$COMPANION_CONFIG")

# State tracking
CURRENT_SESSION="$CACHE_DIR/current_session"
PATTERNS_DB="$STATE_DIR/patterns.jsonl"
WORKFLOWS_DB="$STATE_DIR/workflows.jsonl"
PRODUCTIVITY_DB="$STATE_DIR/productivity.jsonl"

# Utility functions
get_current_context() {
    local context=""
    
    # Project type
    if [ -f "package.json" ]; then context="$context,node"; fi
    if [ -f "requirements.txt" ] || [ -f "pyproject.toml" ]; then context="$context,python"; fi
    if [ -f "go.mod" ]; then context="$context,go"; fi
    if [ -f "Cargo.toml" ]; then context="$context,rust"; fi
    
    # Git status
    if git rev-parse --git-dir > /dev/null 2>&1; then
        if git diff-index --quiet HEAD -- 2>/dev/null; then
            context="$context,clean"
        else
            context="$context,uncommitted"
        fi
    fi
    
    # Time context
    local hour
    hour=$(date +%H)
    if [ "$hour" -lt 12 ]; then
        context="$context,morning"
    elif [ "$hour" -lt 17 ]; then
        context="$context,afternoon"
    else
        context="$context,evening"
    fi
    
    echo "${context#,}"  # Remove leading comma
}

track_pattern() {
    local pattern_type="$1"
    local pattern_data="$2"
    local context="$3"
    
    if [ "$LEARNING_MODE" = "false" ]; then
        return 0
    fi
    
    local timestamp
    timestamp=$(date -Iseconds)
    
    echo "{\"timestamp\":\"$timestamp\",\"type\":\"$pattern_type\",\"data\":\"$pattern_data\",\"context\":\"$context\",\"session\":\"$(cat "$CURRENT_SESSION" 2>/dev/null || echo 'unknown')\"}" >> "$PATTERNS_DB"
}

analyze_patterns() {
    local pattern_type="$1"
    local limit="${2:-10}"
    
    if [ ! -f "$PATTERNS_DB" ]; then
        return 0
    fi
    
    # Get recent patterns of this type
    tail -100 "$PATTERNS_DB" | jq -s --arg type "$pattern_type" 'map(select(.type == $type)) | sort_by(.timestamp) | reverse | .[:($limit | tonumber)]' 2>/dev/null
}

suggest_workflow_optimizations() {
    local current_tool="$1"
    local file_path="$2"
    
    if [ "$PROACTIVE_SUGGESTIONS" = "false" ]; then
        return 0
    fi
    
    # Analyze recent tool usage patterns
    local recent_tools
    recent_tools=$(tail -20 "$PATTERNS_DB" 2>/dev/null | jq -s 'map(select(.type == "tool_usage")) | map(.data) | group_by(.) | map({tool: .[0], count: length}) | sort_by(-.count)' 2>/dev/null)
    
    if [ -n "$recent_tools" ] && [ "$recent_tools" != "null" ]; then
        # Check for inefficient patterns
        local edit_count
        edit_count=$(echo "$recent_tools" | jq '.[] | select(.tool | contains("Edit")) | .count' 2>/dev/null | head -1)
        
        if [ -n "$edit_count" ] && [ "$edit_count" -gt 5 ]; then
            echo "💡 Productivity tip: Consider using MultiEdit for multiple related changes" >&2
            track_pattern "suggestion_given" "multi_edit_suggestion" "$(get_current_context)"
        fi
        
        # Check for repeated file operations
        if [ -n "$file_path" ]; then
            local file_ops
            file_ops=$(tail -10 "$PATTERNS_DB" 2>/dev/null | grep -c "$file_path" 2>/dev/null || echo 0)
            if [ "$file_ops" -gt 3 ]; then
                echo "💡 Working intensively on $(basename "$file_path"). Consider using quality gates to catch issues early." >&2
            fi
        fi
    fi
}

predict_potential_issues() {
    local tool_name="$1"
    local file_path="$2"
    
    # Check for common issue patterns
    case "$tool_name" in
        "Edit"|"Write"|"MultiEdit")
            if [ -n "$file_path" ]; then
                local file_type
                case "$file_path" in
                    *.js|*.jsx|*.ts|*.tsx) file_type="javascript" ;;
                    *.py) file_type="python" ;;
                    *) file_type="other" ;;
                esac
                
                # Check recent error patterns for this file type
                local recent_errors
                recent_errors=$(tail -50 "$PATTERNS_DB" 2>/dev/null | jq -s --arg type "$file_type" 'map(select(.type == "error" and (.context | contains($type)))) | length' 2>/dev/null)
                
                if [ -n "$recent_errors" ] && [ "$recent_errors" -gt 2 ]; then
                    echo "⚠️  High error rate detected for $file_type files. Consider running quality gates." >&2
                    track_pattern "prediction" "high_error_risk_$file_type" "$(get_current_context)"
                fi
            fi
            ;;
            
        "Bash")
            # Predict potential bash issues
            local command
            command=$(echo "$HOOK_INPUT" | jq -r '.command // ""' 2>/dev/null)
            case "$command" in
                *"npm install"*|*"pip install"*|*"cargo build"*)
                    echo "🔍 Running dependency installation. This might take a while..." >&2
                    ;;
                *"rm"*|*"delete"*)
                    echo "⚠️  Destructive operation detected. Double-check the command." >&2
                    ;;
            esac
            ;;
    esac
}

provide_context_aware_assistance() {
    local context
    context=$(get_current_context)
    
    # Morning productivity suggestions
    if [[ "$context" == *"morning"* ]]; then
        local today_session_start
        today_session_start=$(date +%Y-%m-%d)
        if [ ! -f "$CACHE_DIR/morning_tip_$today_session_start" ]; then
            echo "🌅 Morning productivity tip: Start with code review or planning tasks when focus is highest" >&2
            touch "$CACHE_DIR/morning_tip_$today_session_start"
        fi
    fi
    
    # Project-specific suggestions
    if [[ "$context" == *"node"* ]] && [ ! -d "node_modules" ] && [ -f "package.json" ]; then
        echo "📦 Node.js project detected without node_modules. Run 'npm install' to set up dependencies." >&2
    fi
    
    if [[ "$context" == *"python"* ]] && [ ! -d "venv" ] && [ ! -d ".venv" ] && [ -f "requirements.txt" ]; then
        echo "🐍 Python project detected. Consider creating a virtual environment: python -m venv venv" >&2
    fi
    
    # Uncommitted changes reminder
    if [[ "$context" == *"uncommitted"* ]]; then
        local uncommitted_count
        uncommitted_count=$(git status --porcelain 2>/dev/null | wc -l)
        if [ "$uncommitted_count" -gt 10 ]; then
            echo "📋 Many uncommitted changes ($uncommitted_count files). Consider creating a checkpoint commit." >&2
        fi
    fi
}

track_productivity_metrics() {
    local event_type="$1"
    local tool_name="$2"
    
    local timestamp
    timestamp=$(date -Iseconds)
    local session_id
    session_id=$(cat "$CURRENT_SESSION" 2>/dev/null || echo "unknown")
    
    # Calculate session duration
    local session_start
    session_start=$(stat -f %B "$CURRENT_SESSION" 2>/dev/null || echo 0)
    local current_time
    current_time=$(date +%s)
    local session_duration=$((current_time - session_start))
    
    echo "{\"timestamp\":\"$timestamp\",\"event\":\"$event_type\",\"tool\":\"$tool_name\",\"session_id\":\"$session_id\",\"session_duration\":$session_duration}" >> "$PRODUCTIVITY_DB"
    
    # Weekly productivity insights
    if [ $((current_time % 3600)) -lt 60 ]; then  # Once per hour
        generate_productivity_insights
    fi
}

generate_productivity_insights() {
    if [ ! -f "$PRODUCTIVITY_DB" ]; then
        return 0
    fi
    
    local week_start
    week_start=$(date -d "last Monday" +%s 2>/dev/null || date -v -1w +%s 2>/dev/null || echo 0)
    
    # Get this week's data
    local weekly_data
    weekly_data=$(awk -v start="$week_start" 'BEGIN{FS=","} {if($1 > start) print $0}' "$PRODUCTIVITY_DB" 2>/dev/null)
    
    if [ -n "$weekly_data" ]; then
        local tool_usage
        tool_usage=$(echo "$weekly_data" | jq -s 'group_by(.tool) | map({tool: .[0].tool, count: length}) | sort_by(-.count) | .[0:3]' 2>/dev/null)
        
        if [ -n "$tool_usage" ] && [ "$tool_usage" != "null" ]; then
            echo "📊 Weekly productivity insight: Most used tools this week:" >&2
            echo "$tool_usage" | jq -r '.[] | "   \(.tool): \(.count) uses"' 2>/dev/null | head -3 >&2
        fi
    fi
}

handle_session_event() {
    local event_type="$1"
    
    case "$event_type" in
        "session_start")
            # Initialize session tracking
            local session_id
            session_id=$(date +%s)
            echo "$session_id" > "$CURRENT_SESSION"
            
            # Provide context-aware welcome
            provide_context_aware_assistance
            
            # Track session start
            track_pattern "session_event" "session_start" "$(get_current_context)"
            track_productivity_metrics "session_start" "system"
            ;;
            
        "session_end")
            if [ -f "$CURRENT_SESSION" ]; then
                local session_duration
                session_duration=$(( $(date +%s) - $(cat "$CURRENT_SESSION") ))
                echo "📊 Session duration: $((session_duration / 60)) minutes" >&2
                
                # Provide session summary
                if [ "$session_duration" -gt 1800 ]; then  # 30+ minutes
                    echo "🎯 Productive session! Consider taking a break." >&2
                fi
                
                track_pattern "session_event" "session_end" "duration:$session_duration"
                track_productivity_metrics "session_end" "system"
                rm -f "$CURRENT_SESSION"
            fi
            ;;
    esac
}

# Main smart companion logic
if [ "$COMPANION_ENABLED" = "false" ]; then
    exit 0
fi

# Track all interactions for pattern analysis
track_pattern "tool_usage" "$TOOL_NAME" "$(get_current_context)"

case "$EVENT_TYPE" in
    "user_prompt_submit")
        handle_session_event "session_start"
        ;;
        
    "post_tool_use")
        # Tool completed successfully
        suggest_workflow_optimizations "$TOOL_NAME" "$FILE_PATH"
        predict_potential_issues "$TOOL_NAME" "$FILE_PATH"
        track_productivity_metrics "tool_use" "$TOOL_NAME"
        ;;
        
    "error")
        # Tool failed - track for pattern analysis
        local error_type
        error_type=$(echo "$HOOK_INPUT" | jq -r '.error_type // "unknown"')
        track_pattern "error" "$error_type" "tool:$TOOL_NAME"
        echo "🤖 Smart companion: Error tracked for pattern analysis" >&2
        ;;
        
    "stop"|"session_end")
        handle_session_event "session_end"
        ;;
        
    *)
        # Default tracking for unknown events
        track_pattern "event" "$EVENT_TYPE" "$(get_current_context)"
        ;;
esac

# Proactive assistance based on current state
if [ "$EVENT_TYPE" = "post_tool_use" ] && [ -n "$FILE_PATH" ]; then
    # Check if this is part of a larger pattern
    local similar_recent_files
    similar_recent_files=$(tail -20 "$PATTERNS_DB" 2>/dev/null | grep -c "$(dirname "$FILE_PATH")" 2>/dev/null || echo 0)
    
    if [ "$similar_recent_files" -gt 5 ]; then
        echo "🎯 Focus mode detected: Working intensively on $(dirname "$FILE_PATH")" >&2
        echo "💡 Consider using hooks for automatic quality checking" >&2
    fi
fi

exit 0