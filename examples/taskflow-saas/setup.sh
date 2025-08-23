#!/bin/bash
# TaskFlow Example - Real Claude Code Workflow Setup
# This script sets up a genuine development environment using the actual Claude Code configuration

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Configuration
PROJECT_NAME="taskflow-example"
SETUP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_CLAUDE_DIR="$SETUP_DIR/../../.claude"
TARGET_DIR="$HOME/Desktop/$PROJECT_NAME"

# Functions
print_header() {
    echo -e "${BLUE}╔══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║                  TaskFlow Example - Real Claude Code Workflow               ║${NC}"
    echo -e "${BLUE}║              Experience authentic AI-assisted development                    ║${NC}"
    echo -e "${BLUE}╚══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "This setup creates a ${YELLOW}real development environment${NC} using the actual Claude Code"
    echo -e "configuration from this repository. You'll experience the authentic workflow"
    echo -e "from idea to production code, starting with just a concept."
    echo ""
}

print_step() {
    echo -e "${GREEN}▶${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

check_dependencies() {
    print_step "Checking system requirements..."
    
    # Check Node.js
    if ! command -v node &> /dev/null; then
        print_error "Node.js is required for the TaskFlow example"
        echo "Install from: https://nodejs.org/ (version 18+ recommended)"
        exit 1
    fi
    
    local node_version
    node_version=$(node --version | sed 's/v//' | cut -d. -f1)
    if [ "$node_version" -lt 18 ]; then
        print_error "Node.js version $node_version detected. Version 18+ recommended for TaskFlow"
        exit 1
    fi
    print_success "Node.js $(node --version)"
    
    # Check git
    if ! command -v git &> /dev/null; then
        print_error "Git is required for version control"
        exit 1
    fi
    print_success "Git $(git --version | cut -d' ' -f3)"
    
    # Check jq (recommended but not required)
    if ! command -v jq &> /dev/null; then
        print_warning "jq is recommended for optimal hook functionality"
        echo "Install: brew install jq (macOS) | sudo apt-get install jq (Linux)"
        read -p "Continue without jq? (y/N): " continue_setup
        if [[ ! "$continue_setup" =~ ^[Yy]$ ]]; then
            exit 1
        fi
    else
        print_success "jq $(jq --version)"
    fi
    
    # Check source Claude configuration exists
    if [ ! -d "$ROOT_CLAUDE_DIR" ]; then
        print_error "Source Claude Code configuration not found at $ROOT_CLAUDE_DIR"
        echo "Please run this script from within the claude-code-guide repository"
        exit 1
    fi
    print_success "Claude Code configuration found"
    
    echo ""
}

get_project_location() {
    print_step "Configuring TaskFlow example location..."
    echo ""
    
    echo -e "Where would you like to create your TaskFlow development environment?"
    echo -e "Default: ${BLUE}$TARGET_DIR${NC}"
    read -p "Enter custom path (or press Enter for default): " custom_path
    
    if [ -n "$custom_path" ]; then
        TARGET_DIR=$(eval echo "$custom_path")
    fi
    
    # Handle existing directory
    if [ -d "$TARGET_DIR" ]; then
        print_warning "Directory $TARGET_DIR already exists"
        if [ "$(ls -A "$TARGET_DIR")" ]; then
            print_warning "Directory is not empty"
            read -p "Remove existing contents and continue? (y/N): " confirm_overwrite
            if [[ "$confirm_overwrite" =~ ^[Yy]$ ]]; then
                rm -rf "$TARGET_DIR"
            else
                print_error "Setup cancelled"
                exit 1
            fi
        fi
    fi
    
    echo ""
}

create_development_environment() {
    print_step "Creating TaskFlow development environment..."
    
    # Create project directory
    mkdir -p "$TARGET_DIR"
    cd "$TARGET_DIR"
    
    # Copy the real Claude Code configuration
    cp -r "$ROOT_CLAUDE_DIR" "$TARGET_DIR/.claude"
    
    # Ensure hook scripts are executable
    chmod +x "$TARGET_DIR"/.claude/hooks/*.sh
    
    print_success "Claude Code configuration installed"
    
    # Initialize git repository (clean slate)
    git init > /dev/null 2>&1
    print_success "Git repository initialized"
    
    # Create basic .gitignore for development
    cat > .gitignore << 'EOF'
# Node.js
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*
package-lock.json

# Next.js
.next/
out/

# Environment variables  
.env*

# Build outputs
build/
dist/

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Claude Code runtime files (keep configuration)
.claude/cache/
.claude/metrics/
.claude/state/
EOF
    
    print_success "Development environment configured"
}

create_starting_context() {
    print_step "Setting up TaskFlow project context..."
    
    # Copy the example PRD for reference
    if [ -f "$SETUP_DIR/PRD-example.md" ]; then
        cp "$SETUP_DIR/PRD-example.md" PRD-example.md
        print_success "Example PRD copied for reference"
    fi
    
    # Create a starting README
    cat > README.md << 'EOF'
# TaskFlow Development Environment

## Getting Started with Claude Code Workflow

You now have a real TaskFlow development environment with the complete Claude Code configuration. 

**See `PRD-example.md` for what a generated PRD looks like!**

Here's how to experience the authentic development workflow:

### Step 1: Generate Product Requirements
```bash
@prd.md "TaskFlow - AI-enhanced task management SaaS for remote teams. Focus on intelligent task prioritization, automated progress tracking, and seamless team collaboration."
```

### Step 2: Create Development Phases
```bash
@state_tracker.md create "TaskFlow MVP"
```

### Step 3: Start Development
```bash
@state_tracker.md start 1
@code.md "Initialize Next.js project with TypeScript and create basic authentication system"
```

### Step 4: Experience Quality Gates
- Make code changes and see automatic quality gates
- Experience intelligent error recovery
- Watch productivity insights and workflow optimization

## What You'll Experience

✅ **Real Claude Code Configuration** - Not templates, but the actual working hooks and commands  
✅ **Authentic Workflow** - Start from concept and build real functionality  
✅ **Quality Automation** - Experience production-ready quality gates  
✅ **Multi-Agent Coordination** - See specialist agents handle complex tasks  
✅ **State Tracking** - Systematic project management with clear phases
✅ **Example PRD** - See PRD-example.md for what the @prd.md command generates

## Commands Available

- `@prd.md` - Generate comprehensive product requirements
- `@state_tracker.md` - Manage development phases and progress
- `@code.md` - Implement features with quality automation
- `@ask.md` - Get architectural guidance and technical advice

## Next Steps

1. Run the PRD command above to start your journey
2. Follow the generated development phases
3. Experience the complete workflow from idea to production

This is the real deal - the same configuration used to build production applications!
EOF
    
    print_success "Project context and documentation created"
}

validate_setup() {
    print_step "Validating setup..."
    
    # Check that Claude Code configuration is properly installed
    if [ ! -d ".claude/hooks" ] || [ ! -f ".claude/config/settings.json" ]; then
        print_error "Claude Code configuration incomplete"
        return 1
    fi
    
    # Check hook permissions
    if [ ! -x ".claude/hooks/session-start.sh" ]; then
        print_error "Hook permissions not set correctly"
        chmod +x .claude/hooks/*.sh
        print_success "Fixed hook permissions"
    fi
    
    # Verify git repository
    if [ ! -d ".git" ]; then
        print_error "Git repository not initialized"
        return 1
    fi
    
    print_success "Setup validation completed"
}

print_next_steps() {
    echo ""
    echo -e "${GREEN}╔══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║                     🎉 TaskFlow Environment Ready! 🎉                      ║${NC}"
    echo -e "${GREEN}╚══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${BLUE}Your authentic Claude Code development environment is ready:${NC}"
    echo -e "${YELLOW}$TARGET_DIR${NC}"
    echo ""
    echo -e "${PURPLE}🚀 Start Your Development Journey:${NC}"
    echo -e "1. ${GREEN}cd \"$TARGET_DIR\"${NC}"
    echo -e "2. ${GREEN}@prd.md \"TaskFlow - AI-enhanced task management SaaS for remote teams\"${NC}"
    echo -e "3. ${GREEN}@state_tracker.md create \"TaskFlow MVP\"${NC}"
    echo -e "4. ${GREEN}@code.md \"Initialize Next.js project with authentication\"${NC}"
    echo ""
    echo -e "${BLUE}What Makes This Special:${NC}"
    echo -e "• ${YELLOW}Real Configuration${NC} - Uses actual Claude Code hooks from this repo"
    echo -e "• ${YELLOW}Authentic Workflow${NC} - Start from concept, build real features"  
    echo -e "• ${YELLOW}Production Quality${NC} - Same standards used in real projects"
    echo -e "• ${YELLOW}Complete Automation${NC} - Quality gates, error recovery, insights"
    echo ""
    echo -e "${PURPLE}Experience the future of AI-assisted development! 🤖✨${NC}"
    echo ""
    echo -e "${BLUE}Questions?${NC} Check the README.md in your new project directory."
    echo ""
}

# Main execution
main() {
    print_header
    check_dependencies
    get_project_location
    create_development_environment
    create_starting_context
    validate_setup
    print_next_steps
}

# Run main function
main "$@"