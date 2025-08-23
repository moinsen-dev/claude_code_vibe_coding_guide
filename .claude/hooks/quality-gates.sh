#!/bin/bash
# Claude Code Hook: Quality Gates
# Enforces code quality standards and prevents low-quality commits
# Integrates with various linting, formatting, and testing tools

# Read hook input from stdin (Claude Code passes JSON data)
read -r HOOK_INPUT

# Extract quality check information
FILE_PATH=$(echo "$HOOK_INPUT" | jq -r '.file_path // ""' 2>/dev/null || echo "")
CHECK_TYPE=$(echo "$HOOK_INPUT" | jq -r '.check_type // "full"' 2>/dev/null || echo "full")
FORCE_MODE=$(echo "$HOOK_INPUT" | jq -r '.force // false' 2>/dev/null || echo "false")

# Configuration
CONFIG_DIR="$HOME/.claude/config"
METRICS_DIR="$HOME/.claude/metrics"
CACHE_DIR="$HOME/.claude/cache"

# Create directories if they don't exist
mkdir -p "$CONFIG_DIR" "$METRICS_DIR" "$CACHE_DIR"

# Load quality gates configuration
QUALITY_CONFIG="$CONFIG_DIR/quality-gates.json"
if [ ! -f "$QUALITY_CONFIG" ]; then
    # Create default quality gates configuration
    cat > "$QUALITY_CONFIG" << 'EOF'
{
  "enabled": true,
  "auto_fix": true,
  "strict_mode": false,
  "thresholds": {
    "max_line_length": 120,
    "max_function_length": 50,
    "max_file_size": 1000,
    "min_test_coverage": 80
  },
  "rules": {
    "require_tests": true,
    "require_documentation": false,
    "enforce_naming_conventions": true,
    "prevent_secrets": true,
    "check_dependencies": true
  },
  "tools": {
    "eslint": true,
    "prettier": true,
    "typescript": true,
    "pylint": false,
    "black": true,
    "mypy": true,
    "gofmt": true,
    "rustfmt": true
  }
}
EOF
fi

# Load configuration
QUALITY_ENABLED=$(jq -r '.enabled // true' < "$QUALITY_CONFIG")
AUTO_FIX=$(jq -r '.auto_fix // true' < "$QUALITY_CONFIG")
STRICT_MODE=$(jq -r '.strict_mode // false' < "$QUALITY_CONFIG")

# Quality check results
QUALITY_SCORE=100
ISSUES_FOUND=()
FIXES_APPLIED=()
WARNINGS=()

# Utility functions
detect_file_type() {
    local file="$1"
    case "$file" in
        *.js|*.jsx) echo "javascript" ;;
        *.ts|*.tsx) echo "typescript" ;;
        *.py) echo "python" ;;
        *.go) echo "go" ;;
        *.rs) echo "rust" ;;
        *.java) echo "java" ;;
        *.php) echo "php" ;;
        *.rb) echo "ruby" ;;
        *.md) echo "markdown" ;;
        *.json) echo "json" ;;
        *.yml|*.yaml) echo "yaml" ;;
        *.css|*.scss|*.less) echo "stylesheet" ;;
        *.html) echo "html" ;;
        *) echo "unknown" ;;
    esac
}

check_file_size() {
    local file="$1"
    local max_size
    max_size=$(jq -r '.thresholds.max_file_size // 1000' < "$QUALITY_CONFIG")
    
    if [ -f "$file" ]; then
        local lines
        lines=$(wc -l < "$file")
        if [ "$lines" -gt "$max_size" ]; then
            ISSUES_FOUND+=("File too large: $lines lines (max: $max_size)")
            QUALITY_SCORE=$((QUALITY_SCORE - 10))
            return 1
        fi
    fi
    return 0
}

check_secrets() {
    local file="$1"
    
    if ! jq -r '.rules.prevent_secrets // true' < "$QUALITY_CONFIG" | grep -q "true"; then
        return 0
    fi
    
    # Common secret patterns
    local secret_patterns=(
        "password\s*[:=]\s*['\"]?[a-zA-Z0-9]"
        "api[_-]?key\s*[:=]\s*['\"]?[a-zA-Z0-9]"
        "secret[_-]?key\s*[:=]\s*['\"]?[a-zA-Z0-9]"
        "token\s*[:=]\s*['\"]?[a-zA-Z0-9]"
        "private[_-]?key"
        "-----BEGIN.*PRIVATE KEY-----"
        "sk_live_[a-zA-Z0-9]"
        "pk_live_[a-zA-Z0-9]"
    )
    
    for pattern in "${secret_patterns[@]}"; do
        if grep -qiE "$pattern" "$file" 2>/dev/null; then
            ISSUES_FOUND+=("Potential secret detected: $pattern")
            QUALITY_SCORE=$((QUALITY_SCORE - 25))
            echo "🔐 Security risk: Potential secret detected in $file" >&2
            return 1
        fi
    done
    
    return 0
}

check_naming_conventions() {
    local file="$1"
    local file_type="$2"
    
    if ! jq -r '.rules.enforce_naming_conventions // true' < "$QUALITY_CONFIG" | grep -q "true"; then
        return 0
    fi
    
    case "$file_type" in
        "javascript"|"typescript")
            # Check for camelCase functions and variables
            if grep -qE "function\s+[A-Z]" "$file" 2>/dev/null; then
                WARNINGS+=("Function names should start with lowercase (camelCase)")
                QUALITY_SCORE=$((QUALITY_SCORE - 2))
            fi
            ;;
        "python")
            # Check for snake_case conventions
            if grep -qE "def\s+[A-Z]" "$file" 2>/dev/null; then
                WARNINGS+=("Python function names should use snake_case")
                QUALITY_SCORE=$((QUALITY_SCORE - 2))
            fi
            ;;
    esac
}

run_linting_tools() {
    local file="$1"
    local file_type="$2"
    
    case "$file_type" in
        "javascript"|"typescript")
            # ESLint
            if jq -r '.tools.eslint // true' < "$QUALITY_CONFIG" | grep -q "true" && command -v eslint > /dev/null; then
                if ! eslint "$file" --quiet 2>/dev/null; then
                    ISSUES_FOUND+=("ESLint violations found")
                    QUALITY_SCORE=$((QUALITY_SCORE - 15))
                    
                    if [ "$AUTO_FIX" = "true" ]; then
                        eslint "$file" --fix --quiet 2>/dev/null && FIXES_APPLIED+=("ESLint auto-fixes applied")
                    fi
                fi
            fi
            
            # Prettier
            if jq -r '.tools.prettier // true' < "$QUALITY_CONFIG" | grep -q "true" && command -v prettier > /dev/null; then
                if ! prettier --check "$file" > /dev/null 2>&1; then
                    if [ "$AUTO_FIX" = "true" ]; then
                        prettier --write "$file" 2>/dev/null && FIXES_APPLIED+=("Prettier formatting applied")
                    else
                        ISSUES_FOUND+=("Code formatting issues (prettier)")
                        QUALITY_SCORE=$((QUALITY_SCORE - 5))
                    fi
                fi
            fi
            
            # TypeScript check
            if [ "$file_type" = "typescript" ] && jq -r '.tools.typescript // true' < "$QUALITY_CONFIG" | grep -q "true"; then
                if command -v tsc > /dev/null && [ -f "tsconfig.json" ]; then
                    if ! tsc --noEmit --skipLibCheck > /dev/null 2>&1; then
                        ISSUES_FOUND+=("TypeScript compilation errors")
                        QUALITY_SCORE=$((QUALITY_SCORE - 20))
                    fi
                fi
            fi
            ;;
            
        "python")
            # Black formatting
            if jq -r '.tools.black // true' < "$QUALITY_CONFIG" | grep -q "true" && command -v black > /dev/null; then
                if ! black "$file" --check --quiet 2>/dev/null; then
                    if [ "$AUTO_FIX" = "true" ]; then
                        black "$file" --quiet 2>/dev/null && FIXES_APPLIED+=("Black formatting applied")
                    else
                        ISSUES_FOUND+=("Python formatting issues (black)")
                        QUALITY_SCORE=$((QUALITY_SCORE - 5))
                    fi
                fi
            fi
            
            # Flake8 linting
            if command -v flake8 > /dev/null; then
                if ! flake8 "$file" --quiet 2>/dev/null; then
                    ISSUES_FOUND+=("Python style violations (flake8)")
                    QUALITY_SCORE=$((QUALITY_SCORE - 10))
                fi
            fi
            
            # MyPy type checking
            if jq -r '.tools.mypy // true' < "$QUALITY_CONFIG" | grep -q "true" && command -v mypy > /dev/null; then
                if ! mypy "$file" --quiet 2>/dev/null; then
                    ISSUES_FOUND+=("Python type checking issues (mypy)")
                    QUALITY_SCORE=$((QUALITY_SCORE - 15))
                fi
            fi
            ;;
            
        "go")
            # Go format
            if jq -r '.tools.gofmt // true' < "$QUALITY_CONFIG" | grep -q "true"; then
                if ! gofmt -l "$file" | grep -q "^$" 2>/dev/null; then
                    if [ "$AUTO_FIX" = "true" ]; then
                        gofmt -w "$file" 2>/dev/null && FIXES_APPLIED+=("Go formatting applied")
                    else
                        ISSUES_FOUND+=("Go formatting issues")
                        QUALITY_SCORE=$((QUALITY_SCORE - 5))
                    fi
                fi
            fi
            
            # Go vet
            if ! go vet "$file" > /dev/null 2>&1; then
                ISSUES_FOUND+=("Go vet issues")
                QUALITY_SCORE=$((QUALITY_SCORE - 15))
            fi
            ;;
            
        "rust")
            # Rust format
            if jq -r '.tools.rustfmt // true' < "$QUALITY_CONFIG" | grep -q "true"; then
                if ! rustfmt --check "$file" > /dev/null 2>&1; then
                    if [ "$AUTO_FIX" = "true" ]; then
                        rustfmt "$file" 2>/dev/null && FIXES_APPLIED+=("Rust formatting applied")
                    else
                        ISSUES_FOUND+=("Rust formatting issues")
                        QUALITY_SCORE=$((QUALITY_SCORE - 5))
                    fi
                fi
            fi
            
            # Clippy
            if command -v cargo-clippy > /dev/null; then
                if ! cargo clippy --quiet -- -D warnings > /dev/null 2>&1; then
                    ISSUES_FOUND+=("Rust clippy warnings")
                    QUALITY_SCORE=$((QUALITY_SCORE - 10))
                fi
            fi
            ;;
    esac
}

check_test_coverage() {
    local file="$1"
    
    if ! jq -r '.rules.require_tests // true' < "$QUALITY_CONFIG" | grep -q "true"; then
        return 0
    fi
    
    # Look for corresponding test files
    local base_name
    base_name=$(basename "$file" | sed 's/\.[^.]*$//')
    local test_files
    test_files=$(find . -name "*$base_name*.test.*" -o -name "*$base_name*.spec.*" 2>/dev/null)
    
    if [ -z "$test_files" ]; then
        WARNINGS+=("No test files found for $file")
        QUALITY_SCORE=$((QUALITY_SCORE - 5))
    fi
}

check_dependencies() {
    if ! jq -r '.rules.check_dependencies // true' < "$QUALITY_CONFIG" | grep -q "true"; then
        return 0
    fi
    
    # Check for unused dependencies (basic implementation)
    if [ -f "package.json" ]; then
        if command -v npm > /dev/null; then
            # Check for security vulnerabilities
            if npm audit --audit-level=high > /dev/null 2>&1; then
                true  # No high-severity vulnerabilities
            else
                ISSUES_FOUND+=("Security vulnerabilities in dependencies")
                QUALITY_SCORE=$((QUALITY_SCORE - 20))
            fi
        fi
    fi
}

generate_quality_report() {
    local file="$1"
    
    echo "📊 Quality Gate Report for $file" >&2
    echo "Overall Score: $QUALITY_SCORE/100" >&2
    
    if [ ${#ISSUES_FOUND[@]} -gt 0 ]; then
        echo "❌ Issues Found:" >&2
        for issue in "${ISSUES_FOUND[@]}"; do
            echo "   - $issue" >&2
        done
    fi
    
    if [ ${#FIXES_APPLIED[@]} -gt 0 ]; then
        echo "✅ Auto-fixes Applied:" >&2
        for fix in "${FIXES_APPLIED[@]}"; do
            echo "   - $fix" >&2
        done
    fi
    
    if [ ${#WARNINGS[@]} -gt 0 ]; then
        echo "⚠️  Warnings:" >&2
        for warning in "${WARNINGS[@]}"; do
            echo "   - $warning" >&2
        done
    fi
    
    # Quality gate decision
    local min_score=70
    if [ "$STRICT_MODE" = "true" ]; then
        min_score=85
    fi
    
    if [ "$QUALITY_SCORE" -ge "$min_score" ]; then
        echo "✅ Quality gates passed ($QUALITY_SCORE >= $min_score)" >&2
        return 0
    else
        echo "❌ Quality gates failed ($QUALITY_SCORE < $min_score)" >&2
        return 1
    fi
}

# Main quality gates logic
if [ "$QUALITY_ENABLED" = "false" ]; then
    echo "⏭️  Quality gates disabled" >&2
    exit 0
fi

if [ "$FORCE_MODE" = "true" ]; then
    echo "⚠️  Quality gates bypassed (force mode)" >&2
    exit 0
fi

if [ -n "$FILE_PATH" ] && [ -f "$FILE_PATH" ]; then
    FILE_TYPE=$(detect_file_type "$FILE_PATH")
    
    echo "🔍 Running quality gates for $FILE_PATH ($FILE_TYPE)" >&2
    
    # Run all quality checks
    check_file_size "$FILE_PATH"
    check_secrets "$FILE_PATH"
    check_naming_conventions "$FILE_PATH" "$FILE_TYPE"
    check_test_coverage "$FILE_PATH"
    run_linting_tools "$FILE_PATH" "$FILE_TYPE"
    check_dependencies
    
    # Generate report and determine pass/fail
    if generate_quality_report "$FILE_PATH"; then
        # Log successful quality gate
        echo "{\"timestamp\":\"$(date -Iseconds)\",\"event\":\"quality_gate_pass\",\"file\":\"$FILE_PATH\",\"score\":$QUALITY_SCORE,\"issues\":${#ISSUES_FOUND[@]},\"fixes\":${#FIXES_APPLIED[@]}}" >> "$METRICS_DIR/quality-$(date +%Y-%m).jsonl"
        exit 0
    else
        # Log quality gate failure
        echo "{\"timestamp\":\"$(date -Iseconds)\",\"event\":\"quality_gate_fail\",\"file\":\"$FILE_PATH\",\"score\":$QUALITY_SCORE,\"issues\":${#ISSUES_FOUND[@]},\"fixes\":${#FIXES_APPLIED[@]}}" >> "$METRICS_DIR/quality-$(date +%Y-%m).jsonl"
        
        if [ "$STRICT_MODE" = "true" ]; then
            echo "🚫 Strict mode: Quality gates must pass" >&2
            exit 1
        else
            echo "⚠️  Quality gates failed but continuing (non-strict mode)" >&2
            exit 0
        fi
    fi
else
    echo "📋 Running project-wide quality checks..." >&2
    check_dependencies
    exit 0
fi