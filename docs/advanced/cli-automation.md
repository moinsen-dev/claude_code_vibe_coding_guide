# CLI Automation - Batch Processing & Workflows

Harness Claude Code's CLI capabilities for automated workflows, batch processing, and programmable AI assistance through command-line scripting.

## Overview

Claude Code's CLI provides powerful automation capabilities that go beyond interactive coding. By combining specific CLI flags, output formats, and shell scripting, you can create sophisticated automated workflows for code analysis, documentation generation, and systematic code improvements.

## Key CLI Components for Automation

### Core CLI Commands
```bash
# Interactive REPL
claude

# Quick query with exit
claude -p "query"

# Continue recent conversation
claude -c

# Update CLI
claude update
```

### Essential Automation Flags

::: tip Critical Automation Combination
The power trio for automation: `-p`, `--dangerous-skip-permissions`, and `--output-format`
:::

#### Query Mode (`-p`)
**Purpose**: Execute queries programmatically without entering interactive REPL.

```bash
# Basic query mode
claude -p "Analyze the main.js file for potential improvements"

# With piped input
cat src/components/Header.jsx | claude -p "Review this component for accessibility issues"
```

#### Skip Permissions (`--dangerous-skip-permissions`)
**Purpose**: Bypass permission prompts for automated workflows.

::: warning Use Carefully
This flag should only be used in controlled environments where you trust the operations being performed. Never use in production scripts without careful review.
:::

```bash
# Automated file analysis without prompts
claude -p --dangerous-skip-permissions "Analyze all TypeScript files and suggest improvements"
```

#### Output Formats (`--output-format`)
**Purpose**: Control output structure for programmatic processing.

**Available Formats**:
- `text` - Human-readable text (default)
- `json` - Structured JSON response
- `stream-json` - Real-time streaming JSON

```bash
# JSON output for programmatic processing
claude -p --output-format json "List all TODO comments in the codebase"

# Streaming JSON for real-time processing
claude -p --output-format stream-json "Generate documentation for all API endpoints"
```

## Automation Patterns

### Batch Code Analysis

#### Project Health Check Script
```bash
#!/bin/bash
# project-health-check.sh

echo "Running comprehensive project health check..."

# Store prompts in files for reusability
SECURITY_PROMPT="Analyze this codebase for security vulnerabilities, focusing on input validation, authentication, and data handling."
PERFORMANCE_PROMPT="Identify performance bottlenecks and optimization opportunities in this codebase."
MAINTAINABILITY_PROMPT="Assess code maintainability, highlighting areas that need refactoring or documentation."

# Run analyses with structured output
echo "=== Security Analysis ==="
claude -p --dangerous-skip-permissions --output-format json "$SECURITY_PROMPT" | jq '.response.content'

echo "=== Performance Analysis ==="
claude -p --dangerous-skip-permissions --output-format json "$PERFORMANCE_PROMPT" | jq '.response.content'

echo "=== Maintainability Analysis ==="
claude -p --dangerous-skip-permissions --output-format json "$MAINTAINABILITY_PROMPT" | jq '.response.content'
```

#### File-by-File Analysis
```bash
#!/bin/bash
# analyze-components.sh

# Analyze React components individually
for file in src/components/*.tsx; do
    echo "Analyzing $file..."
    
    result=$(cat "$file" | claude -p --dangerous-skip-permissions --output-format json \
        "Review this React component for best practices, accessibility, and performance. Provide specific recommendations.")
    
    # Extract and format recommendations
    echo "$result" | jq -r '.response.content' > "analysis/$(basename "$file" .tsx)-analysis.md"
    
    echo "Analysis saved to analysis/$(basename "$file" .tsx)-analysis.md"
done
```

### Documentation Generation

#### API Documentation Automation
```bash
#!/bin/bash
# generate-api-docs.sh

# Create API documentation from code
for endpoint_file in src/api/endpoints/*.js; do
    endpoint_name=$(basename "$endpoint_file" .js)
    
    cat "$endpoint_file" | claude -p --dangerous-skip-permissions --output-format json \
        "Generate comprehensive API documentation for this endpoint including parameters, responses, and examples." \
        | jq -r '.response.content' > "docs/api/$endpoint_name.md"
    
    echo "Documentation generated for $endpoint_name"
done

# Generate API index
claude -p --dangerous-skip-permissions --output-format text \
    "Create an API documentation index linking to all endpoint documentation files in docs/api/" \
    > docs/api/README.md
```

#### Component Documentation
```bash
#!/bin/bash
# document-components.sh

PROMPT_FILE="prompts/component-documentation.txt"

# Store reusable prompt
cat > "$PROMPT_FILE" << 'EOF'
Generate comprehensive documentation for this React component including:
1. Purpose and functionality
2. Props interface with types and descriptions  
3. Usage examples
4. Styling and customization options
5. Accessibility features
6. Testing considerations

Format as markdown suitable for a component library.
EOF

# Process all components
find src/components -name "*.tsx" -type f | while read component; do
    component_name=$(basename "$component" .tsx)
    
    cat "$component" | claude -p --dangerous-skip-permissions --output-format text \
        "$(cat "$PROMPT_FILE")" \
        > "docs/components/$component_name.md"
    
    echo "✅ Documented $component_name"
done
```

### Code Quality Automation

#### Pre-commit Analysis
```bash
#!/bin/bash
# pre-commit-ai-review.sh

# Get list of modified files
modified_files=$(git diff --cached --name-only --diff-filter=AM)

if [ -z "$modified_files" ]; then
    echo "No files to review"
    exit 0
fi

echo "AI Code Review - Modified Files:"
echo "$modified_files"

# Review each modified file
for file in $modified_files; do
    if [[ $file =~ \.(js|ts|jsx|tsx|py|java|go)$ ]]; then
        echo "Reviewing $file..."
        
        review_result=$(cat "$file" | claude -p --dangerous-skip-permissions --output-format json \
            "Review this code for bugs, security issues, performance problems, and style inconsistencies. Focus on issues that could cause problems in production.")
        
        # Check if issues were found
        issues=$(echo "$review_result" | jq -r '.response.content' | grep -i "issue\|problem\|warning\|error" | wc -l)
        
        if [ $issues -gt 0 ]; then
            echo "⚠️  Issues found in $file:"
            echo "$review_result" | jq -r '.response.content'
            echo "---"
        else
            echo "✅ $file looks good"
        fi
    fi
done
```

### CI/CD Integration

#### Automated Code Review in GitHub Actions
```yaml
# .github/workflows/ai-code-review.yml
name: AI Code Review

on:
  pull_request:
    types: [opened, synchronize]

jobs:
  ai-review:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
          
      - name: Install Claude Code CLI
        run: curl -sSL https://claude.ai/install.sh | bash
        
      - name: Review Changed Files
        env:
          CLAUDE_API_KEY: ${{ secrets.CLAUDE_API_KEY }}
        run: |
          # Get changed files
          changed_files=$(git diff --name-only origin/main..HEAD)
          
          for file in $changed_files; do
            if [[ $file =~ \.(js|ts|jsx|tsx)$ ]]; then
              echo "## Review for $file" >> review-results.md
              cat "$file" | claude -p --dangerous-skip-permissions --output-format text \
                "Review this code for security, performance, and maintainability issues. Be specific about line numbers and suggestions." \
                >> review-results.md
              echo "" >> review-results.md
            fi
          done
          
      - name: Comment PR
        uses: actions/github-script@v7
        with:
          script: |
            const fs = require('fs');
            const review = fs.readFileSync('review-results.md', 'utf8');
            
            github.rest.issues.createComment({
              issue_number: context.issue.number,
              owner: context.repo.owner,
              repo: context.repo.repo,
              body: '## 🤖 AI Code Review\n\n' + review
            });
```

## Advanced Automation Techniques

### JSON Processing with jq

::: tip Power Combo: JSON + jq
Using `--output-format json` with jq enables sophisticated data processing and filtering.
:::

#### Extract Specific Information
```bash
# Get only security issues from analysis
claude -p --dangerous-skip-permissions --output-format json \
  "Analyze codebase for security issues" \
  | jq -r '.response.content' \
  | grep -E "security|vulnerability|authentication"

# Extract TODO items with metadata
claude -p --dangerous-skip-permissions --output-format json \
  "Find all TODO comments and categorize by priority" \
  | jq '.response | {timestamp: .timestamp, todos: .content}'
```

#### Batch Processing with Structured Data
```bash
# Analyze multiple files and combine results
results=()

for file in src/**/*.js; do
    result=$(cat "$file" | claude -p --dangerous-skip-permissions --output-format json \
        "Rate this file's code quality from 1-10 and explain why")
    
    rating=$(echo "$result" | jq -r '.response.content' | grep -oE '[0-9]+/10' | head -1)
    filename=$(basename "$file")
    
    results+=("{\"file\": \"$filename\", \"rating\": \"$rating\"}")
done

# Combine into summary report
printf '%s\n' "${results[@]}" | jq -s '.' > code-quality-report.json
```

### Prompt Management

#### Reusable Prompt Library
```bash
# prompts/library.sh

# Security review prompt
security_review() {
    echo "Perform a comprehensive security review of this code, checking for:"
    echo "1. Input validation and sanitization"
    echo "2. Authentication and authorization flaws"
    echo "3. Data exposure and information leakage"
    echo "4. Injection vulnerabilities (SQL, XSS, etc.)"
    echo "5. Insecure dependencies or configurations"
    echo "Provide specific line numbers and remediation suggestions."
}

# Performance analysis prompt
performance_analysis() {
    echo "Analyze this code for performance issues including:"
    echo "1. Algorithm complexity and optimization opportunities"
    echo "2. Memory usage and potential leaks"
    echo "3. Database query efficiency"
    echo "4. Caching opportunities"
    echo "5. Resource usage patterns"
    echo "Suggest specific improvements with estimated impact."
}

# Architecture review prompt
architecture_review() {
    echo "Review this code's architecture and design patterns:"
    echo "1. SOLID principles adherence"
    echo "2. Design pattern usage and appropriateness"
    echo "3. Code organization and modularity"
    echo "4. Coupling and cohesion analysis"
    echo "5. Scalability and maintainability considerations"
    echo "Recommend architectural improvements."
}
```

#### Using Prompt Library
```bash
#!/bin/bash
source prompts/library.sh

# Use structured prompts for consistent analysis
cat src/auth/login.js | claude -p --dangerous-skip-permissions --output-format json \
    "$(security_review)" > analysis/login-security.json

cat src/api/users.js | claude -p --dangerous-skip-permissions --output-format json \
    "$(performance_analysis)" > analysis/users-performance.json
```

## Best Practices for CLI Automation

### Security Considerations

::: warning Permission Management
- Only use `--dangerous-skip-permissions` in controlled environments
- Review automated operations before applying to production code
- Store sensitive prompts in files, not command history
- Use environment variables for API keys and configuration
:::

### Performance Optimization

::: tip Efficient Batch Processing
- **Parallel processing**: Use background jobs for independent analyses
- **Rate limiting**: Respect API limits and add delays between requests
- **Caching**: Store results to avoid redundant analyses
- **Filtering**: Process only relevant files to reduce API usage
:::

### Workflow Integration

::: info Integration Points
- **Pre-commit hooks**: Automated code review before commits
- **CI/CD pipelines**: Quality gates and documentation generation
- **Scheduled tasks**: Regular codebase health checks
- **Development scripts**: Custom analysis and improvement workflows
:::

## Example Workflows

### Complete Project Analysis Pipeline
```bash
#!/bin/bash
# comprehensive-analysis.sh

PROJECT_NAME=$(basename $(pwd))
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
REPORT_DIR="reports/${PROJECT_NAME}_${TIMESTAMP}"

mkdir -p "$REPORT_DIR"

echo "🚀 Starting comprehensive analysis for $PROJECT_NAME..."

# 1. Security Analysis
echo "🔒 Security Analysis..."
claude -p --dangerous-skip-permissions --output-format json \
    "$(cat prompts/security-audit.txt)" \
    > "$REPORT_DIR/security-analysis.json"

# 2. Performance Review
echo "⚡ Performance Analysis..."
claude -p --dangerous-skip-permissions --output-format json \
    "$(cat prompts/performance-review.txt)" \
    > "$REPORT_DIR/performance-analysis.json"

# 3. Code Quality Assessment
echo "✨ Code Quality Assessment..."
claude -p --dangerous-skip-permissions --output-format json \
    "$(cat prompts/quality-assessment.txt)" \
    > "$REPORT_DIR/quality-analysis.json"

# 4. Generate Summary Report
echo "📊 Generating Summary Report..."
claude -p --dangerous-skip-permissions --output-format text \
    "Create an executive summary based on these analysis results: 
     $(cat "$REPORT_DIR"/*.json)" \
    > "$REPORT_DIR/executive-summary.md"

echo "✅ Analysis complete! Results saved to $REPORT_DIR"
```

Claude Code CLI automation transforms one-off analyses into systematic, repeatable workflows that improve code quality, security, and maintainability at scale.