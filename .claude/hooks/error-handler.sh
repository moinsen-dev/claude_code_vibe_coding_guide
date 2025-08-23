#!/bin/bash
# Claude Code Hook: Error Handler
# Triggered when tools fail or errors occur  
# Handles error recovery, diagnostics, and intelligent suggestions

# Read hook input from stdin (Claude Code passes JSON data)
read -r HOOK_INPUT

# Extract error information
ERROR_TYPE=$(echo "$HOOK_INPUT" | jq -r '.error_type // "unknown"' 2>/dev/null || echo "unknown")
ERROR_MESSAGE=$(echo "$HOOK_INPUT" | jq -r '.error_message // ""' 2>/dev/null || echo "")
TOOL_NAME=$(echo "$HOOK_INPUT" | jq -r '.tool_name // "unknown"' 2>/dev/null || echo "unknown")
FILE_PATH=$(echo "$HOOK_INPUT" | jq -r '.file_path // ""' 2>/dev/null || echo "")

# Configuration
CONFIG_DIR="$HOME/.claude/config"
METRICS_DIR="$HOME/.claude/metrics"
CACHE_DIR="$HOME/.claude/cache"

# Create directories if they don't exist
mkdir -p "$CONFIG_DIR" "$METRICS_DIR" "$CACHE_DIR"

# Load preferences
AUTO_RECOVERY_ENABLED=$(jq -r '.auto_recovery.enabled // true' < "$CONFIG_DIR/preferences.json" 2>/dev/null || echo "true")
ERROR_NOTIFICATIONS=$(jq -r '.notifications.errors // true' < "$CONFIG_DIR/preferences.json" 2>/dev/null || echo "true")
DIAGNOSTIC_MODE=$(jq -r '.diagnostics.enabled // false' < "$CONFIG_DIR/preferences.json" 2>/dev/null || echo "false")

# Error patterns and solutions
declare -A ERROR_SOLUTIONS
ERROR_SOLUTIONS["ENOENT"]="File or directory not found. Check file path and ensure the file exists."
ERROR_SOLUTIONS["EACCES"]="Permission denied. Try using sudo or check file permissions."
ERROR_SOLUTIONS["EISDIR"]="Is a directory. Specify a file, not a directory."
ERROR_SOLUTIONS["ENOTDIR"]="Not a directory. Path component is not a directory."
ERROR_SOLUTIONS["EMFILE"]="Too many open files. Close some files or increase file descriptor limit."
ERROR_SOLUTIONS["ENOSPC"]="No space left on device. Free up disk space."
ERROR_SOLUTIONS["MODULE_NOT_FOUND"]="Module not found. Run 'npm install' or check module name."
ERROR_SOLUTIONS["IMPORT_ERROR"]="Import error. Check module installation and Python path."
ERROR_SOLUTIONS["COMPILATION_ERROR"]="Compilation failed. Check syntax and dependencies."

# Utility functions
get_project_type() {
    if [ -f "package.json" ]; then echo "node"; return; fi
    if [ -f "requirements.txt" ] || [ -f "pyproject.toml" ]; then echo "python"; return; fi
    if [ -f "go.mod" ]; then echo "go"; return; fi
    if [ -f "Cargo.toml" ]; then echo "rust"; return; fi
    echo "generic"
}

suggest_solution() {
    local error_type="$1"
    local error_message="$2"
    local tool_name="$3"
    local file_path="$4"
    
    echo "🔧 Error Analysis & Suggestions:" >&2
    echo "   Tool: $tool_name" >&2
    echo "   Error: $error_type" >&2
    
    # Check for known error patterns
    for pattern in "${!ERROR_SOLUTIONS[@]}"; do
        if [[ "$error_message" == *"$pattern"* ]] || [[ "$error_type" == *"$pattern"* ]]; then
            echo "💡 Suggestion: ${ERROR_SOLUTIONS[$pattern]}" >&2
            return 0
        fi
    done
    
    # Tool-specific error handling
    case "$tool_name" in
        "Edit"|"Write"|"MultiEdit")
            if [[ "$error_message" == *"not found"* ]] || [[ "$error_message" == *"ENOENT"* ]]; then
                echo "💡 Suggestion: File doesn't exist. Create the file first or check the file path." >&2
                
                if [ -n "$file_path" ]; then
                    local dir
                    dir=$(dirname "$file_path")
                    if [ ! -d "$dir" ]; then
                        echo "💡 Directory '$dir' doesn't exist. Create it with: mkdir -p \"$dir\"" >&2
                    fi
                fi
            elif [[ "$error_message" == *"permission"* ]] || [[ "$error_message" == *"EACCES"* ]]; then
                echo "💡 Suggestion: Permission denied. Check file permissions or try with sudo." >&2
            fi
            ;;
            
        "Bash")
            if [[ "$error_message" == *"command not found"* ]]; then
                local command
                command=$(echo "$error_message" | grep -o "'[^']*'" | tr -d "'")
                echo "💡 Suggestion: Command '$command' not found. Install it or check if it's in PATH." >&2
                
                # Suggest installation for common commands
                case "$command" in
                    "npm"|"node") echo "   Install Node.js: https://nodejs.org/" >&2 ;;
                    "python"|"python3") echo "   Install Python: https://python.org/" >&2 ;;
                    "git") echo "   Install Git: https://git-scm.com/" >&2 ;;
                    "docker") echo "   Install Docker: https://docker.com/" >&2 ;;
                esac
            elif [[ "$error_message" == *"No such file"* ]]; then
                echo "💡 Suggestion: File or directory doesn't exist. Check the path and create if needed." >&2
            fi
            ;;
            
        "Read")
            if [[ "$error_message" == *"ENOENT"* ]] || [[ "$error_message" == *"not found"* ]]; then
                echo "💡 Suggestion: File doesn't exist. Check file path spelling and location." >&2
                
                if [ -n "$file_path" ]; then
                    # Suggest similar files
                    local basename_file
                    basename_file=$(basename "$file_path")
                    local similar_files
                    similar_files=$(find . -name "*$basename_file*" -type f 2>/dev/null | head -3)
                    if [ -n "$similar_files" ]; then
                        echo "💡 Similar files found:" >&2
                        echo "$similar_files" | while read -r similar; do
                            echo "   - $similar" >&2
                        done
                    fi
                fi
            fi
            ;;
            
        "Grep"|"Glob")
            if [[ "$error_message" == *"Permission denied"* ]]; then
                echo "💡 Suggestion: Some directories require elevated permissions. Consider using sudo or check permissions." >&2
            elif [[ "$error_message" == *"No such file"* ]]; then
                echo "💡 Suggestion: Search path doesn't exist. Check directory path." >&2
            fi
            ;;
    esac
    
    # Project-specific suggestions
    local project_type
    project_type=$(get_project_type)
    
    case "$project_type" in
        "node")
            if [[ "$error_message" == *"MODULE_NOT_FOUND"* ]] || [[ "$error_message" == *"Cannot find module"* ]]; then
                echo "💡 Node.js suggestion: Run 'npm install' to install missing dependencies." >&2
                
                # Check if package.json exists
                if [ ! -f "package.json" ]; then
                    echo "💡 No package.json found. Initialize with 'npm init'." >&2
                fi
            fi
            ;;
            
        "python")
            if [[ "$error_message" == *"ModuleNotFoundError"* ]] || [[ "$error_message" == *"ImportError"* ]]; then
                echo "💡 Python suggestion: Install missing module with 'pip install <module>'." >&2
                
                # Check for virtual environment
                if [ ! -d "venv" ] && [ ! -d ".venv" ]; then
                    echo "💡 Consider using a virtual environment: python -m venv venv && source venv/bin/activate" >&2
                fi
            fi
            ;;
            
        "go")
            if [[ "$error_message" == *"cannot find package"* ]]; then
                echo "💡 Go suggestion: Run 'go mod tidy' to download missing dependencies." >&2
            fi
            ;;
            
        "rust")
            if [[ "$error_message" == *"can't find crate"* ]]; then
                echo "💡 Rust suggestion: Add dependency to Cargo.toml or run 'cargo build'." >&2
            fi
            ;;
    esac
}

attempt_auto_recovery() {
    local error_type="$1"
    local tool_name="$2"
    local file_path="$3"
    
    if [ "$AUTO_RECOVERY_ENABLED" = "false" ]; then
        return 1
    fi
    
    echo "🔄 Attempting automatic recovery..." >&2
    
    case "$tool_name" in
        "Edit"|"Write"|"MultiEdit")
            if [[ "$error_type" == *"ENOENT"* ]] && [ -n "$file_path" ]; then
                # Create directory structure if missing
                local dir
                dir=$(dirname "$file_path")
                if [ ! -d "$dir" ]; then
                    echo "📁 Creating missing directory: $dir" >&2
                    mkdir -p "$dir" && echo "✅ Directory created successfully" >&2 && return 0
                fi
            fi
            ;;
            
        "Bash")
            # Check for missing dependencies and suggest installation
            local project_type
            project_type=$(get_project_type)
            
            case "$project_type" in
                "node")
                    if [ -f "package.json" ] && [ ! -d "node_modules" ]; then
                        echo "📦 Installing Node.js dependencies..." >&2
                        npm install > /dev/null 2>&1 && echo "✅ Dependencies installed successfully" >&2 && return 0
                    fi
                    ;;
                    
                "python")
                    if [ -f "requirements.txt" ] && command -v pip > /dev/null; then
                        echo "📦 Installing Python dependencies..." >&2
                        pip install -r requirements.txt > /dev/null 2>&1 && echo "✅ Dependencies installed successfully" >&2 && return 0
                    fi
                    ;;
            esac
            ;;
    esac
    
    return 1
}

send_error_notification() {
    local message="$1"
    local severity="$2"
    
    if [ "$ERROR_NOTIFICATIONS" = "true" ]; then
        local icon="❌"
        case "$severity" in
            "warning") icon="⚠️" ;;
            "critical") icon="🚨" ;;
        esac
        
        # Desktop notification
        if command -v osascript > /dev/null; then
            osascript -e "display notification \"$message\" with title \"Claude Code Error - $icon\""
        elif command -v notify-send > /dev/null; then
            notify-send "Claude Code Error" "$icon $message"
        fi
    fi
}

collect_diagnostics() {
    if [ "$DIAGNOSTIC_MODE" = "false" ]; then
        return 0
    fi
    
    echo "🔍 Collecting diagnostic information..." >&2
    
    # System information
    echo "System: $(uname -a)" >&2
    echo "Working directory: $(pwd)" >&2
    echo "User: $USER" >&2
    echo "Shell: $SHELL" >&2
    
    # Project information
    local project_type
    project_type=$(get_project_type)
    echo "Project type: $project_type" >&2
    
    case "$project_type" in
        "node")
            node --version 2>/dev/null && npm --version 2>/dev/null
            [ -f "package.json" ] && echo "package.json exists" >&2
            [ -d "node_modules" ] && echo "node_modules exists" >&2 || echo "node_modules missing" >&2
            ;;
        "python")
            python --version 2>/dev/null || python3 --version 2>/dev/null
            [ -f "requirements.txt" ] && echo "requirements.txt exists" >&2
            [ -d "venv" ] || [ -d ".venv" ] && echo "Virtual environment exists" >&2
            ;;
        "go")
            go version 2>/dev/null
            [ -f "go.mod" ] && echo "go.mod exists" >&2
            ;;
        "rust")
            rustc --version 2>/dev/null
            [ -f "Cargo.toml" ] && echo "Cargo.toml exists" >&2
            ;;
    esac
    
    # Git status
    if git rev-parse --git-dir > /dev/null 2>&1; then
        echo "Git repository: Yes" >&2
        git status --porcelain 2>/dev/null | wc -l | xargs echo "Modified files:" >&2
    else
        echo "Git repository: No" >&2
    fi
}

# Main error handling logic
echo "❌ Error detected in $TOOL_NAME" >&2

# Log the error
echo "{\"timestamp\":\"$(date -Iseconds)\",\"event\":\"error\",\"tool\":\"$TOOL_NAME\",\"error_type\":\"$ERROR_TYPE\",\"error_message\":\"$ERROR_MESSAGE\",\"file_path\":\"$FILE_PATH\"}" >> "$METRICS_DIR/errors-$(date +%Y-%m).jsonl"

# Collect diagnostics if enabled
collect_diagnostics

# Try automatic recovery
if attempt_auto_recovery "$ERROR_TYPE" "$TOOL_NAME" "$FILE_PATH"; then
    echo "✅ Automatic recovery successful!" >&2
    send_error_notification "Error recovered automatically in $TOOL_NAME" "warning"
    
    # Log successful recovery
    echo "{\"timestamp\":\"$(date -Iseconds)\",\"event\":\"auto_recovery_success\",\"tool\":\"$TOOL_NAME\",\"error_type\":\"$ERROR_TYPE\"}" >> "$METRICS_DIR/recovery-$(date +%Y-%m).jsonl"
else
    # Provide suggestions for manual resolution
    suggest_solution "$ERROR_TYPE" "$ERROR_MESSAGE" "$TOOL_NAME" "$FILE_PATH"
    send_error_notification "Error in $TOOL_NAME: $ERROR_TYPE" "error"
    
    # Log recovery failure
    echo "{\"timestamp\":\"$(date -Iseconds)\",\"event\":\"auto_recovery_failed\",\"tool\":\"$TOOL_NAME\",\"error_type\":\"$ERROR_TYPE\"}" >> "$METRICS_DIR/recovery-$(date +%Y-%m).jsonl"
fi

exit 0