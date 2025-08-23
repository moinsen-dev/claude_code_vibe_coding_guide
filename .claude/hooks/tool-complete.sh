#!/bin/bash
# Claude Code Hook: Tool Complete
# Triggered after each tool execution (PostToolUse event)
# Handles tool-specific automation, quality gates, and follow-up actions

# Read hook input from stdin (Claude Code passes JSON data)
read -r HOOK_INPUT

# Extract tool information from JSON input
TOOL_NAME=$(echo "$HOOK_INPUT" | jq -r '.tool_name // "unknown"' 2>/dev/null || echo "unknown")
TOOL_STATUS=$(echo "$HOOK_INPUT" | jq -r '.status // "unknown"' 2>/dev/null || echo "unknown")
FILE_PATH=$(echo "$HOOK_INPUT" | jq -r '.file_path // ""' 2>/dev/null || echo "")

# Configuration
CONFIG_DIR="$HOME/.claude/config"
METRICS_DIR="$HOME/.claude/metrics"
CACHE_DIR="$HOME/.claude/cache"

# Create directories if they don't exist
mkdir -p "$CONFIG_DIR" "$METRICS_DIR" "$CACHE_DIR"

# Load preferences
QUALITY_GATES_ENABLED=$(jq -r '.quality_gates.enabled // true' < "$CONFIG_DIR/preferences.json" 2>/dev/null || echo "true")
AUTO_FORMAT_ENABLED=$(jq -r '.auto_format.enabled // true' < "$CONFIG_DIR/preferences.json" 2>/dev/null || echo "true")
NOTIFICATIONS_ENABLED=$(jq -r '.notifications.enabled // true' < "$CONFIG_DIR/preferences.json" 2>/dev/null || echo "true")

# Utility functions
detect_file_type() {
    local file="$1"
    case "$file" in
        *.js|*.jsx|*.ts|*.tsx) echo "javascript" ;;
        *.py) echo "python" ;;
        *.go) echo "go" ;;
        *.rs) echo "rust" ;;
        *.java) echo "java" ;;
        *.md) echo "markdown" ;;
        *.json) echo "json" ;;
        *.yml|*.yaml) echo "yaml" ;;
        *) echo "unknown" ;;
    esac
}

run_quality_gates() {
    local file="$1"
    local file_type="$2"
    
    if [ "$QUALITY_GATES_ENABLED" = "false" ]; then
        return 0
    fi
    
    echo "🔍 Running quality gates for $file..." >&2
    
    case "$file_type" in
        "javascript")
            # ESLint check
            if command -v eslint > /dev/null && [ -f ".eslintrc.js" ] || [ -f ".eslintrc.json" ]; then
                if ! eslint "$file" --quiet; then
                    echo "❌ ESLint issues found in $file" >&2
                    return 1
                fi
            fi
            
            # Prettier check
            if command -v prettier > /dev/null && [ -f ".prettierrc" ]; then
                if ! prettier --check "$file" > /dev/null 2>&1; then
                    echo "📝 Auto-formatting $file with Prettier..." >&2
                    prettier --write "$file"
                fi
            fi
            
            # TypeScript check
            if [[ "$file" == *.ts ]] || [[ "$file" == *.tsx ]]; then
                if command -v tsc > /dev/null && [ -f "tsconfig.json" ]; then
                    if ! tsc --noEmit --skipLibCheck > /dev/null 2>&1; then
                        echo "❌ TypeScript errors found" >&2
                        return 1
                    fi
                fi
            fi
            ;;
            
        "python")
            # Black formatting
            if command -v black > /dev/null && [ "$AUTO_FORMAT_ENABLED" = "true" ]; then
                black "$file" --quiet
                echo "📝 Auto-formatted $file with Black" >&2
            fi
            
            # Flake8 linting
            if command -v flake8 > /dev/null; then
                if ! flake8 "$file" --quiet; then
                    echo "❌ Flake8 issues found in $file" >&2
                    return 1
                fi
            fi
            
            # mypy type checking
            if command -v mypy > /dev/null && [ -f "mypy.ini" ] || [ -f "pyproject.toml" ]; then
                if ! mypy "$file" --quiet; then
                    echo "❌ Type checking errors found in $file" >&2
                    return 1
                fi
            fi
            ;;
            
        "go")
            # Go fmt
            if [ "$AUTO_FORMAT_ENABLED" = "true" ]; then
                gofmt -w "$file"
                echo "📝 Auto-formatted $file with gofmt" >&2
            fi
            
            # Go vet
            if ! go vet "$file" > /dev/null 2>&1; then
                echo "❌ Go vet issues found in $file" >&2
                return 1
            fi
            ;;
            
        "rust")
            # Rustfmt
            if [ "$AUTO_FORMAT_ENABLED" = "true" ]; then
                rustfmt "$file"
                echo "📝 Auto-formatted $file with rustfmt" >&2
            fi
            
            # Clippy
            if command -v cargo-clippy > /dev/null; then
                if ! cargo clippy --quiet -- -D warnings > /dev/null 2>&1; then
                    echo "❌ Clippy warnings found" >&2
                    return 1
                fi
            fi
            ;;
    esac
    
    echo "✅ Quality gates passed for $file" >&2
    return 0
}

send_notification() {
    local message="$1"
    local level="${2:-info}"
    
    if [ "$NOTIFICATIONS_ENABLED" = "true" ]; then
        local icon="ℹ️"
        case "$level" in
            "success") icon="✅" ;;
            "warning") icon="⚠️" ;;
            "error") icon="❌" ;;
        esac
        
        # Desktop notification
        if command -v osascript > /dev/null; then
            osascript -e "display notification \"$message\" with title \"Claude Code - $icon\""
        elif command -v notify-send > /dev/null; then
            notify-send "Claude Code" "$icon $message"
        fi
    fi
}

# Main tool completion logic
case "$TOOL_NAME" in
    "Edit"|"Write"|"MultiEdit")
        if [ -n "$FILE_PATH" ] && [ -f "$FILE_PATH" ]; then
            FILE_TYPE=$(detect_file_type "$FILE_PATH")
            
            # Run quality gates
            if run_quality_gates "$FILE_PATH" "$FILE_TYPE"; then
                send_notification "Quality gates passed for $(basename "$FILE_PATH")" "success"
                
                # Log successful edit
                echo "{\"timestamp\":\"$(date -Iseconds)\",\"event\":\"quality_gates_passed\",\"tool\":\"$TOOL_NAME\",\"file\":\"$FILE_PATH\",\"file_type\":\"$FILE_TYPE\"}" >> "$METRICS_DIR/quality-$(date +%Y-%m).jsonl"
            else
                send_notification "Quality gates failed for $(basename "$FILE_PATH")" "error"
                
                # Log quality gate failure
                echo "{\"timestamp\":\"$(date -Iseconds)\",\"event\":\"quality_gates_failed\",\"tool\":\"$TOOL_NAME\",\"file\":\"$FILE_PATH\",\"file_type\":\"$FILE_TYPE\"}" >> "$METRICS_DIR/quality-$(date +%Y-%m).jsonl"
                exit 1
            fi
        fi
        ;;
        
    "Bash")
        # Track command usage
        COMMAND=$(echo "$HOOK_INPUT" | jq -r '.command // ""' 2>/dev/null || echo "")
        echo "{\"timestamp\":\"$(date -Iseconds)\",\"event\":\"bash_command\",\"command\":\"$COMMAND\",\"status\":\"$TOOL_STATUS\"}" >> "$METRICS_DIR/bash-$(date +%Y-%m).jsonl"
        
        # Check for potentially dangerous commands
        case "$COMMAND" in
            *"rm -rf"*|*"sudo"*|*"chmod 777"*)
                send_notification "Potentially dangerous command executed: $COMMAND" "warning"
                ;;
        esac
        ;;
        
    "Grep"|"Glob")
        # Track search patterns for learning
        PATTERN=$(echo "$HOOK_INPUT" | jq -r '.pattern // ""' 2>/dev/null || echo "")
        echo "{\"timestamp\":\"$(date -Iseconds)\",\"event\":\"search_pattern\",\"tool\":\"$TOOL_NAME\",\"pattern\":\"$PATTERN\"}" >> "$METRICS_DIR/search-$(date +%Y-%m).jsonl"
        ;;
        
    "Read")
        # Track file reading patterns
        echo "{\"timestamp\":\"$(date -Iseconds)\",\"event\":\"file_read\",\"file\":\"$FILE_PATH\"}" >> "$METRICS_DIR/reads-$(date +%Y-%m).jsonl"
        ;;
esac

# General tool completion logging
echo "{\"timestamp\":\"$(date -Iseconds)\",\"event\":\"tool_complete\",\"tool\":\"$TOOL_NAME\",\"status\":\"$TOOL_STATUS\",\"file\":\"$FILE_PATH\"}" >> "$METRICS_DIR/tools-$(date +%Y-%m).jsonl"

# Success exit
exit 0