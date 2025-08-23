# Claude Code Hooks Configuration

This directory contains a comprehensive set of hooks for Claude Code that automate development workflows, enforce quality standards, and provide intelligent assistance.

## Available Hooks

### 🚀 session-start.sh
- **Events**: UserPromptSubmit
- **Purpose**: Initializes development sessions with environment checks and project analysis
- **Features**: Project type detection, git status, dependency verification, notifications

### 🔧 tool-complete.sh  
- **Events**: PostToolUse
- **Purpose**: Quality gates and tool-specific automation after each tool execution
- **Features**: Auto-formatting, linting, type checking, security scanning

### 📝 code-change.sh
- **Events**: PostToolUse (Edit, Write, MultiEdit)
- **Purpose**: Automated testing and documentation updates on code changes
- **Features**: Test execution, change impact analysis, team notifications

### ❌ error-handler.sh
- **Events**: Error
- **Purpose**: Intelligent error recovery and solution suggestions  
- **Features**: Auto-recovery attempts, diagnostic collection, solution recommendations

### ✅ quality-gates.sh
- **Events**: PostToolUse (Edit, Write, MultiEdit)
- **Purpose**: Enforces code quality standards and prevents technical debt
- **Features**: Multi-language linting, formatting, security checks, coverage analysis

### 🤖 smart-companion.sh
- **Events**: UserPromptSubmit, PostToolUse, Error, Stop
- **Purpose**: AI-powered development assistance with pattern recognition
- **Features**: Workflow optimization, productivity insights, context-aware suggestions

## Configuration Files

### settings.json
Main hook configuration that registers all hooks with Claude Code. Specifies which events trigger each hook and provides filtering options.

### preferences.json  
User preferences for customizing hook behavior including:
- Notification settings
- Quality gate strictness
- Auto-recovery options
- Team integration features

## Directory Structure

```
.claude/
├── hooks/           # Executable hook scripts
├── config/          # Configuration files
├── metrics/         # Performance and usage metrics (auto-created)
├── cache/          # Temporary session data (auto-created)
└── state/          # Persistent learning data (auto-created)
```

## Getting Started

1. **Verify Installation**: All hooks should be executable (chmod +x applied)
2. **Customize Preferences**: Edit `config/preferences.json` for your workflow
3. **Test Hooks**: Start a Claude Code session to see hooks in action
4. **Monitor Logs**: Check metrics directory for hook performance data

## Hook Development

Each hook follows the Claude Code hook specification:
- Reads JSON input from stdin
- Uses jq for JSON parsing
- Logs structured data to metrics files  
- Provides user feedback via stderr
- Returns appropriate exit codes

## Customization

To customize hook behavior:
1. Edit `config/preferences.json` for general settings
2. Modify individual hook scripts for specific needs
3. Add project-specific overrides in `settings.json`
4. Create additional hooks following the existing patterns

## Troubleshooting

- **Hooks not running**: Check Claude Code settings and hook permissions
- **Missing dependencies**: Install jq, project-specific tools (eslint, black, etc.)
- **Permission errors**: Ensure all .sh files are executable
- **Configuration issues**: Validate JSON syntax in config files

For detailed hook documentation and examples, see the main project documentation.