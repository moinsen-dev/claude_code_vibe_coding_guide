#!/bin/bash
# Claude Code Hook: Session Start
# Triggered when user submits a new prompt (UserPromptSubmit event)
# Handles session initialization, environment checking, and project analysis

# Read hook input from stdin (Claude Code passes JSON data)
read -r HOOK_INPUT

# Configuration directories
CONFIG_DIR="$HOME/.claude/config"
METRICS_DIR="$HOME/.claude/metrics"
CACHE_DIR="$HOME/.claude/cache"

# Create directories if they don't exist
mkdir -p "$CONFIG_DIR" "$METRICS_DIR" "$CACHE_DIR"

# Load user preferences
if [ -f "$CONFIG_DIR/preferences.json" ]; then
    NOTIFICATIONS_ENABLED=$(echo "$HOOK_INPUT" | jq -r '.notifications.enabled // true' 2>/dev/null || echo "true")
    TEAM_INTEGRATION=$(echo "$HOOK_INPUT" | jq -r '.team.integration_enabled // false' 2>/dev/null || echo "false")
else
    NOTIFICATIONS_ENABLED=true
    TEAM_INTEGRATION=false
fi

# Utility functions
detect_project_type() {
    if [ -f "package.json" ]; then echo "node"; return; fi
    if [ -f "requirements.txt" ] || [ -f "pyproject.toml" ]; then echo "python"; return; fi
    if [ -f "go.mod" ]; then echo "go"; return; fi
    if [ -f "Cargo.toml" ]; then echo "rust"; return; fi
    if [ -f "composer.json" ]; then echo "php"; return; fi
    if [ -f "pom.xml" ] || [ -f "build.gradle" ]; then echo "java"; return; fi
    echo "generic"
}

send_notification() {
    local message="$1"
    
    if [ "$NOTIFICATIONS_ENABLED" = "true" ]; then
        # Desktop notification
        if command -v osascript > /dev/null; then
            osascript -e "display notification \"$message\" with title \"Claude Code\""
        elif command -v notify-send > /dev/null; then
            notify-send "Claude Code" "$message"
        fi
        
        # Team notification (if enabled)
        if [ "$TEAM_INTEGRATION" = "true" ] && [ "$SLACK_WEBHOOK_URL" ]; then
            curl -s -X POST "$SLACK_WEBHOOK_URL" \
                 -H "Content-Type: application/json" \
                 -d "{\"text\":\"🤖 Claude Code session started: $USER working on $(basename $PWD)\"}"
        fi
    fi
}

# Main session start logic
echo "🚀 Claude Code session starting..." >&2

# Load project context and prepare environment
echo "🚀 Starting Claude Code session at $(date)" >> ~/.claude/session.log

# Session initialization
SESSION_ID=$(date +%s)
echo "$SESSION_ID" > "$CACHE_DIR/current_session"

# Project analysis
PROJECT_TYPE=$(detect_project_type)
echo "📋 Project type detected: $PROJECT_TYPE" >&2

# Check git status and uncommitted changes
if git rev-parse --git-dir > /dev/null 2>&1; then
    if git diff-index --quiet HEAD -- 2>/dev/null; then
        echo "✅ Working directory clean" >&2
    else
        echo "⚠️  Uncommitted changes detected" >&2
        git status --short >&2
    fi
    
    # Check for unpushed commits
    UNPUSHED=$(git log @{u}.. --oneline 2>/dev/null | wc -l | tr -d ' ')
    if [ "$UNPUSHED" -gt 0 ]; then
        echo "📤 $UNPUSHED unpushed commits" >&2
    fi
fi

# Environment health check
case "$PROJECT_TYPE" in
    "node")
        npm --version > /dev/null 2>&1 && echo "✅ Node.js ready" >&2 || echo "❌ Node.js not available" >&2
        
        if [ -f "package.json" ] && [ ! -d "node_modules" ]; then
            echo "📦 Dependencies not installed - run 'npm install'" >&2
        fi
        
        # Check for outdated dependencies
        if command -v npm > /dev/null 2>&1; then
            OUTDATED=$(npm outdated --json 2>/dev/null | jq 'keys | length' 2>/dev/null || echo 0)
            if [ "$OUTDATED" -gt 5 ]; then
                echo "⚠️  $OUTDATED outdated npm packages detected" >&2
            fi
        fi
        ;;
    "python")
        python --version > /dev/null 2>&1 && echo "✅ Python ready" >&2 || echo "❌ Python not available" >&2
        
        if [ -f "requirements.txt" ] && [ ! -d "venv" ] && [ ! -d ".venv" ]; then
            echo "💡 Consider creating virtual environment: python -m venv venv" >&2
        fi
        ;;
    "go")
        go version > /dev/null 2>&1 && echo "✅ Go ready" >&2 || echo "❌ Go not available" >&2
        ;;
    "rust")
        rustc --version > /dev/null 2>&1 && echo "✅ Rust ready" >&2 || echo "❌ Rust not available" >&2
        ;;
esac

# Load project-specific environment
if [ -f ".env.development" ]; then
    echo "📋 Development environment file detected" >&2
fi

# Load CLAUDE.md context if available
if [ -f "CLAUDE.md" ]; then
    echo "📖 Project context loaded from CLAUDE.md" >&2
fi

# Send notification
send_notification "Claude Code session started in $(basename $PWD)"

# Log session metrics (JSON format for potential analytics)
echo "{\"timestamp\":\"$(date -Iseconds)\",\"event\":\"session_start\",\"project\":\"$(basename $PWD)\",\"project_type\":\"$PROJECT_TYPE\",\"session_id\":\"$SESSION_ID\"}" >> "$METRICS_DIR/$(date +%Y-%m).jsonl"

# Exit with success
exit 0