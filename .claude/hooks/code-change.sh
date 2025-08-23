#!/bin/bash
# Claude Code Hook: Code Change Detection  
# Triggered when code files are modified
# Handles automatic testing, documentation updates, and team notifications

# Read hook input from stdin (Claude Code passes JSON data)
read -r HOOK_INPUT

# Extract change information
FILE_PATH=$(echo "$HOOK_INPUT" | jq -r '.file_path // ""' 2>/dev/null || echo "")
CHANGE_TYPE=$(echo "$HOOK_INPUT" | jq -r '.change_type // "unknown"' 2>/dev/null || echo "unknown")
LINES_CHANGED=$(echo "$HOOK_INPUT" | jq -r '.lines_changed // 0' 2>/dev/null || echo "0")

# Configuration
CONFIG_DIR="$HOME/.claude/config"
METRICS_DIR="$HOME/.claude/metrics"
CACHE_DIR="$HOME/.claude/cache"

# Create directories if they don't exist
mkdir -p "$CONFIG_DIR" "$METRICS_DIR" "$CACHE_DIR"

# Load preferences
AUTO_TEST_ENABLED=$(jq -r '.auto_test.enabled // true' < "$CONFIG_DIR/preferences.json" 2>/dev/null || echo "true")
AUTO_DOC_ENABLED=$(jq -r '.auto_documentation.enabled // false' < "$CONFIG_DIR/preferences.json" 2>/dev/null || echo "false")
TEAM_NOTIFICATIONS=$(jq -r '.team.notifications_enabled // false' < "$CONFIG_DIR/preferences.json" 2>/dev/null || echo "false")
SIGNIFICANT_CHANGE_THRESHOLD=$(jq -r '.thresholds.significant_change // 50' < "$CONFIG_DIR/preferences.json" 2>/dev/null || echo "50")

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

is_test_file() {
    local file="$1"
    case "$file" in
        *test*|*spec*|*.test.*|*.spec.*|*/__tests__/*|*/tests/*)
            echo "true"
            ;;
        *)
            echo "false"
            ;;
    esac
}

find_related_tests() {
    local source_file="$1"
    local base_name
    base_name=$(basename "$source_file" | sed 's/\.[^.]*$//')
    
    # Common test patterns
    find . -name "*$base_name*.test.*" -o -name "*$base_name*.spec.*" 2>/dev/null | head -5
}

run_tests() {
    local project_type="$1"
    local changed_file="$2"
    
    echo "🧪 Running tests for $changed_file..." >&2
    
    case "$project_type" in
        "node")
            if [ -f "package.json" ]; then
                # Check if specific test command exists
                if npm run test:watch > /dev/null 2>&1; then
                    echo "📊 Running test:watch..." >&2
                    timeout 30 npm run test:watch -- --passWithNoTests --silent 2>/dev/null || true
                elif npm test > /dev/null 2>&1; then
                    echo "📊 Running npm test..." >&2
                    timeout 30 npm test -- --passWithNoTests --silent 2>/dev/null || true
                fi
                
                # Run related tests if Jest is available
                if command -v jest > /dev/null; then
                    local related_tests
                    related_tests=$(find_related_tests "$changed_file")
                    if [ -n "$related_tests" ]; then
                        echo "🔍 Running related tests..." >&2
                        echo "$related_tests" | while read -r test_file; do
                            [ -f "$test_file" ] && jest "$test_file" --passWithNoTests --silent 2>/dev/null || true
                        done
                    fi
                fi
            fi
            ;;
            
        "python")
            if command -v pytest > /dev/null; then
                echo "📊 Running pytest..." >&2
                # Find and run related tests
                local test_file
                test_file=$(echo "$changed_file" | sed 's/\.py$/test_&/' | sed 's|/|/test_|')
                if [ -f "$test_file" ]; then
                    timeout 30 pytest "$test_file" -v --tb=short 2>/dev/null || true
                else
                    # Run tests in the same directory
                    local dir
                    dir=$(dirname "$changed_file")
                    if [ -d "$dir" ]; then
                        timeout 30 pytest "$dir" -v --tb=short -x 2>/dev/null || true
                    fi
                fi
            elif [ -f "manage.py" ]; then
                echo "📊 Running Django tests..." >&2
                timeout 30 python manage.py test --verbosity=0 2>/dev/null || true
            fi
            ;;
            
        "go")
            echo "📊 Running Go tests..." >&2
            local dir
            dir=$(dirname "$changed_file")
            timeout 30 go test "./$dir" -v 2>/dev/null || true
            ;;
            
        "rust")
            echo "📊 Running Cargo tests..." >&2
            timeout 30 cargo test --quiet 2>/dev/null || true
            ;;
    esac
}

update_documentation() {
    local changed_file="$1"
    local file_type
    file_type=$(detect_file_type "$changed_file")
    
    case "$file_type" in
        "javascript"|"python"|"go"|"rust")
            # Check if function signatures changed significantly
            if [ "$LINES_CHANGED" -gt "$SIGNIFICANT_CHANGE_THRESHOLD" ]; then
                echo "📚 Significant changes detected, consider updating documentation" >&2
                
                # Look for related documentation files
                local doc_files
                doc_files=$(find . -name "README.md" -o -name "*.md" | grep -E "($(dirname "$changed_file")|docs?)" 2>/dev/null)
                
                if [ -n "$doc_files" ]; then
                    echo "📋 Documentation files that may need updates:" >&2
                    echo "$doc_files" | while read -r doc; do
                        echo "  - $doc" >&2
                    done
                fi
            fi
            ;;
    esac
}

detect_file_type() {
    local file="$1"
    case "$file" in
        *.js|*.jsx|*.ts|*.tsx) echo "javascript" ;;
        *.py) echo "python" ;;
        *.go) echo "go" ;;
        *.rs) echo "rust" ;;
        *.java) echo "java" ;;
        *.php) echo "php" ;;
        *) echo "unknown" ;;
    esac
}

analyze_change_impact() {
    local file="$1"
    local change_type="$2"
    local lines_changed="$3"
    
    # Determine change significance
    local significance="minor"
    if [ "$lines_changed" -gt 100 ]; then
        significance="major"
    elif [ "$lines_changed" -gt 20 ]; then
        significance="moderate"
    fi
    
    # Check if it's a critical file
    case "$file" in
        */src/main.*|*/index.*|*/app.*|*config*|*package.json|*requirements.txt|*go.mod|*Cargo.toml)
            significance="critical"
            ;;
    esac
    
    echo "$significance"
}

send_team_notification() {
    local message="$1"
    local significance="$2"
    
    if [ "$TEAM_NOTIFICATIONS" = "true" ] && [ -n "$SLACK_WEBHOOK_URL" ]; then
        local color="good"
        local icon="✏️"
        
        case "$significance" in
            "critical") color="danger"; icon="🚨" ;;
            "major") color="warning"; icon="⚠️" ;;
        esac
        
        curl -s -X POST "$SLACK_WEBHOOK_URL" \
             -H "Content-Type: application/json" \
             -d "{
                \"text\":\"$icon Code Change Alert\",
                \"attachments\":[{
                    \"color\":\"$color\",
                    \"text\":\"$message\",
                    \"footer\":\"Claude Code - $(basename "$PWD")\",
                    \"ts\":$(date +%s)
                }]
             }"
    fi
}

# Main code change handling
if [ -n "$FILE_PATH" ] && [ -f "$FILE_PATH" ]; then
    PROJECT_TYPE=$(detect_project_type)
    FILE_TYPE=$(detect_file_type "$FILE_PATH")
    SIGNIFICANCE=$(analyze_change_impact "$FILE_PATH" "$CHANGE_TYPE" "$LINES_CHANGED")
    IS_TEST=$(is_test_file "$FILE_PATH")
    
    echo "📝 Code change detected in $FILE_PATH ($LINES_CHANGED lines, $SIGNIFICANCE impact)" >&2
    
    # Log the change
    echo "{\"timestamp\":\"$(date -Iseconds)\",\"event\":\"code_change\",\"file\":\"$FILE_PATH\",\"change_type\":\"$CHANGE_TYPE\",\"lines_changed\":$LINES_CHANGED,\"significance\":\"$SIGNIFICANCE\",\"file_type\":\"$FILE_TYPE\",\"is_test\":$IS_TEST}" >> "$METRICS_DIR/changes-$(date +%Y-%m).jsonl"
    
    # Run automated tests if enabled and not a test file
    if [ "$AUTO_TEST_ENABLED" = "true" ] && [ "$IS_TEST" = "false" ]; then
        run_tests "$PROJECT_TYPE" "$FILE_PATH"
    fi
    
    # Update documentation suggestions if enabled
    if [ "$AUTO_DOC_ENABLED" = "true" ]; then
        update_documentation "$FILE_PATH"
    fi
    
    # Send team notifications for significant changes
    if [ "$SIGNIFICANCE" = "critical" ] || [ "$SIGNIFICANCE" = "major" ]; then
        send_team_notification "Significant code changes in \`$(basename "$FILE_PATH")\`: $LINES_CHANGED lines changed ($SIGNIFICANCE impact)" "$SIGNIFICANCE"
    fi
    
    # Check for potential security issues
    if grep -qE "(password|token|key|secret)" "$FILE_PATH" 2>/dev/null; then
        echo "🔐 Security-sensitive content detected in $FILE_PATH" >&2
        send_team_notification "🔐 Security review needed: Sensitive content detected in \`$(basename "$FILE_PATH")\`" "critical"
    fi
    
    echo "✅ Code change processing complete for $FILE_PATH" >&2
fi

exit 0