# Troubleshooting Guide

> **🚧 Work in Progress** - Common issues and solutions are being documented.

Solutions to common vibe coding challenges and Claude Code issues.

## MCP Server Issues

### MCP Server Won't Start

**Problem**: MCP server fails to launch or connect.

**Common Causes & Solutions:**

1. **Missing Dependencies**
   ```bash
   # Check if npx is available
   npx --version
   
   # Install if missing
   npm install -g npx
   
   # Clear npm cache
   npm cache clean --force
   ```

2. **Port Conflicts**
   ```bash
   # Check for processes using common MCP ports
   lsof -i :3000
   lsof -i :8080
   
   # Kill conflicting processes if needed
   kill -9 <PID>
   ```

3. **Permission Issues**
   ```bash
   # Fix npm permissions (macOS/Linux)
   sudo chown -R $(whoami) ~/.npm
   
   # Or use nvm to avoid permission issues
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
   nvm install node
   ```

4. **Network/Firewall Issues**
   ```json
   {
     "mcpServers": {
       "browsermcp": {
         "command": "npx",
         "args": ["@browsermcp/mcp@latest"],
         "env": {
           "NODE_TLS_REJECT_UNAUTHORIZED": "0"
         }
       }
     }
   }
   ```

### MCP Server Timeouts

**Problem**: MCP server starts but times out during operations.

**Solutions:**

1. **Increase Timeout Settings**
   ```json
   {
     "mcpServers": {
       "browsermcp": {
         "command": "npx",
         "args": ["@browsermcp/mcp@latest"],
         "timeout": 30000
       }
     }
   }
   ```

2. **Check System Resources**
   ```bash
   # Monitor CPU and memory usage
   top
   
   # Check disk space
   df -h
   
   # Free up memory if needed
   sudo purge  # macOS
   ```

## Communication Issues

### Claude Doesn't Understand My Project

**Problem**: Claude seems confused about your project structure or requirements.

**Solutions:**

1. **Improve Your CLAUDE.md**
   ```markdown
   # Add more context about:
   - What your application actually does (not just tech stack)
   - Key business logic and domain concepts  
   - Unusual patterns or architectural decisions
   - Common tasks and workflows
   ```

2. **Use Better File References**
   ```
   Instead of: "Fix the bug in the component"
   Try: "Fix the validation bug in @src/components/LoginForm.tsx on line 42"
   ```

3. **Provide Concrete Examples**
   ```
   Instead of: "Make it better"
   Try: "Refactor this function to handle edge cases like empty arrays and null values, following the same pattern as @src/utils/arrayHelpers.ts"
   ```

### Claude's Responses Are Too Generic

**Problem**: Getting boilerplate responses instead of project-specific help.

**Solutions:**

1. **Share More Context Upfront**
   ```
   Good example:
   "I'm working on a React e-commerce app with Stripe integration. The checkout form in @components/CheckoutForm.jsx is failing to validate credit card inputs properly. Here's the current validation logic: [paste code]. It should reject invalid card numbers but allow valid test cards in development."
   ```

2. **Be Specific About Your Tech Stack**
   ```
   Instead of: "Help me with authentication"
   Try: "Help me implement JWT refresh token rotation in this Next.js app using Auth0"
   ```

3. **Use Thinking Mode**
   ```
   "Think through the different approaches to handle file uploads in this Node.js API. I need to consider file size limits, virus scanning, and storing metadata in PostgreSQL."
   ```

## Performance Issues

### Claude Code is Running Slowly

**Problem**: Long response times or timeouts.

**Diagnostic Steps:**

1. **Check Network Connection**
   ```bash
   # Test connectivity
   ping claude.ai
   
   # Check DNS resolution
   nslookup claude.ai
   
   # Test bandwidth
   speedtest-cli
   ```

2. **Monitor System Resources**
   ```bash
   # Check available memory
   free -h  # Linux
   vm_stat  # macOS
   
   # Check CPU usage
   htop
   
   # Check disk I/O
   iotop
   ```

3. **Clear Claude Code Cache**
   ```bash
   # Clear cache (location varies by OS)
   rm -rf ~/.claude/cache
   
   # Or reset settings
   rm ~/.claude/settings.local.json
   ```

### File Operations Are Slow

**Problem**: Reading/writing files takes too long.

**Solutions:**

1. **Optimize File Access Patterns**
   ```
   Instead of: Reading many small files sequentially
   Try: Batch file operations or use file watchers
   ```

2. **Check File Permissions**
   ```bash
   # Fix permission issues
   chmod -R 755 /path/to/project
   
   # Check for file locks
   lsof /path/to/locked/file
   ```

3. **Exclude Large Directories**
   ```json
   {
     "ignoredPaths": [
       "node_modules/**",
       "build/**",
       "dist/**",
       ".git/**",
       "*.log"
     ]
   }
   ```

## Project-Specific Issues

### "Can't Find Module" Errors

**Problem**: Claude can't locate files or dependencies.

**Solutions:**

1. **Check File Paths**
   ```
   # Verify files exist
   ls -la src/components/
   
   # Check relative vs absolute paths
   pwd
   ```

2. **Update Import Paths**
   ```typescript
   // If using path mapping
   {
     "compilerOptions": {
       "baseUrl": ".",
       "paths": {
         "@/*": ["src/*"],
         "@components/*": ["src/components/*"]
       }
     }
   }
   ```

3. **Clear Node Modules**
   ```bash
   rm -rf node_modules package-lock.json
   npm install
   ```

### Context Loss Between Sessions

**Problem**: Claude forgets project details between conversations.

**Solutions:**

1. **Enhance CLAUDE.md Documentation**
   ```markdown
   # Add session restoration info:
   ## Recent Work
   - Currently working on user authentication system
   - Main files: src/auth/, components/LoginForm.tsx
   - Known issues: JWT token refresh needs implementation
   
   ## Key Decisions
   - Using Zustand for state management
   - Following compound component pattern
   - API endpoints follow RESTful conventions
   ```

2. **Use Consistent File References**
   ```
   Always reference key files with @filename syntax
   Mention current branch: "On feature/auth-improvements branch"
   ```

3. **Create Project Summaries**
   ```
   Start sessions with: "Quick context: I'm building a task management app with React/Node.js. Currently implementing real-time updates via WebSocket. Main challenge is syncing optimistic UI updates with server state."
   ```

## Error Messages and Fixes

### Common Error Patterns

**"Permission Denied" Errors**
```bash
# Fix file permissions
chmod +x .git/hooks/*
sudo chown -R $(whoami) ~/.npm

# Check directory access
ls -la /path/to/directory
```

**"Command Not Found" Errors**
```bash
# Check PATH
echo $PATH

# Verify installation
which npm
which node
which git

# Reinstall if needed
brew reinstall node  # macOS
```

**"Module Resolution Failed" Errors**
```bash
# Clear all caches
npm cache clean --force
rm -rf node_modules package-lock.json
npm install

# Check for version conflicts
npm ls
```

## Getting Help

### When to Ask for Help

- Spent more than 30 minutes on a problem
- Error messages are unclear or contradictory
- Performance issues persist after basic troubleshooting
- MCP servers consistently fail to start

### How to Ask for Help Effectively

1. **Provide Context**
   ```
   - Operating system and version
   - Node.js and npm versions
   - Claude Code version
   - What you were trying to do
   - What actually happened
   - Error messages (full text)
   ```

2. **Include Relevant Files**
   ```
   - package.json
   - .mcp.json
   - CLAUDE.md
   - Error logs
   ```

3. **Describe What You've Tried**
   ```
   List troubleshooting steps already attempted
   ```

### Community Resources

- **GitHub Issues**: Report bugs and feature requests
- **Documentation**: Official Claude Code docs
- **Stack Overflow**: General programming issues (tag with `claude-code`)

### Advanced Debugging

**Enable Debug Mode**
```bash
# Set debug environment variables
export DEBUG=claude:*
export CLAUDE_LOG_LEVEL=debug

# Run with verbose output
claude --verbose
```

**Log Analysis**
```bash
# Find log files
find ~ -name "*claude*log*" 2>/dev/null

# Monitor logs in real-time
tail -f ~/.claude/logs/debug.log
```

**Network Debugging**
```bash
# Monitor network requests
netstat -an | grep claude

# Check proxy settings
echo $HTTP_PROXY
echo $HTTPS_PROXY
```

This troubleshooting guide covers the most common issues developers encounter when using Claude Code for vibe coding. Remember: most issues have simple solutions, and the community is here to help when you're stuck!