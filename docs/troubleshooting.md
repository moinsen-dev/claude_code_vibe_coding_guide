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

## Don't Believe Your Coding Agent

::: danger Critical Reality Check
**AI coding agents lie.** They don't intentionally deceive, but they often report success when builds actually fail, claim functionality works when it's broken, and express confidence about code that has serious errors.

**Example of AI Overconfidence**:
```
AI Output: "✅ Build passes successfully - The application is ready for production use!"

Reality: "Failed to compile. Type error: WorkflowEdge[] is not assignable to Edge[]"
```

**Why This Happens**:
- AI agents don't actually run your code
- They predict what *should* happen, not what *does* happen  
- They're optimized to sound confident and positive
- They can't see the actual build output or runtime errors
:::

### Always Verify AI Claims

::: warning Trust But Verify
**Never deploy without validation**:
- **Run the build yourself** after AI makes changes
- **Test critical functionality** manually
- **Check type errors** and linting warnings
- **Verify tests still pass** after modifications
- **Review AI code changes** line by line
:::

### Red Flags in AI Responses

::: tip Suspicious Confidence Indicators
Watch for overly confident language when the AI hasn't actually executed anything:

- "✅ Successfully implemented..." (without running code)
- "The build will pass" (prediction, not fact)  
- "Everything is working perfectly" (no actual testing done)
- "Ready for production" (hasn't seen runtime behavior)

**Healthy skepticism saves debugging time.**
:::

### Verification Workflow

1. **AI makes changes** → 2. **You run build/tests** → 3. **Fix actual errors** → 4. **Repeat if needed**

Never skip step 2. The AI's confidence doesn't correlate with code correctness.

## Technology Limitations

::: danger New & Experimental Technology Warning
**Critical Understanding**: AI coding agents, including Claude Code, have significant limitations with very new or rarely used technologies.

**The Problem**: Large Language Models (LLMs) cannot learn from documentation on-the-fly. They must be trained on technologies during their training phase. Simply providing links to documentation or GitHub repos **does not help** - the AI cannot truly "read" and understand new information the way humans can.

**Common Pitfall**: Developers often assume that if they can find documentation for a new framework or library, the AI can use it effectively. This leads to frustration when the AI:
- Gives generic, unhelpful responses
- Makes up APIs that don't exist  
- Suggests outdated or incorrect approaches
- Says "yes" to everything but delivers poor results
:::

### Before Using New Technology

::: tip Start with a Capability Check
**Always test the AI's knowledge first** before committing to a new technology:

```
"Do you have specific experience with [New Framework v2.0]? 
Can you show me a basic example of [specific feature] 
without looking up documentation?"
```

**Red flags in responses**:
- Vague, generic explanations
- "You should check the documentation for details"
- Code that feels like guesswork
- Mixing concepts from similar but different technologies
:::

### Proof of Concept Strategy

::: info Smart POC Approach
1. **Start Small**: Ask for a minimal working example
2. **Test Core Features**: Verify the AI can handle key functionality
3. **Validate Accuracy**: Check generated code against official docs
4. **Assess Confidence**: Pay attention to hedging language ("This might work...", "You may need to...")

**Good POC Test**:
```
"Create a minimal working example of [new technology] that demonstrates 
[specific core feature]. Don't use generic placeholders - show actual 
implementation with realistic data."
```
:::

### What to Do When AI Knowledge is Limited

::: warning Alternative Strategies
**When the AI admits limitations or produces poor results**:

1. **Ask for Alternatives**: 
   ```
   "What mature, well-established alternatives to [new tech] 
   would you recommend that achieve similar goals?"
   ```

2. **Use Established Patterns**:
   ```
   "How would you solve [problem] using technologies you're 
   confident with, like React/Node.js/Python?"
   ```

3. **Focus on Architecture**:
   ```
   "Help me design the overall architecture and interfaces. 
   I'll implement the new technology parts manually."
   ```

4. **Incremental Adoption**:
   ```
   "Let's build this with [established tech] first, then 
   identify specific parts to migrate to [new tech] later."
   ```
:::

### Technology Maturity Guidelines

::: tip Safe Technology Choices
**High Confidence** (AI works well):
- **Established frameworks**: React, Vue, Angular, Express, Django, Rails
- **Mature languages**: JavaScript/TypeScript, Python, Java, C#, Go
- **Standard libraries**: Popular npm packages with 100K+ downloads
- **Proven patterns**: REST APIs, SQL databases, common architectures

**Moderate Confidence** (Test thoroughly):
- **Recent stable releases**: Major version updates of established tools
- **Emerging standards**: Well-documented but newer technologies
- **Popular beta software**: High community adoption but still evolving

**Low Confidence** (Avoid or use minimally):
- **Alpha/Beta releases**: Unstable APIs and frequent changes
- **Brand new frameworks**: Less than 6 months old
- **Experimental features**: Not yet in stable release
- **Niche technologies**: Very specialized or low adoption
:::

### Signs Your Technology Choice May Be Too New

- **Documentation is scarce** or constantly changing
- **Stack Overflow has few questions** about the technology
- **GitHub issues outnumber** resolved discussions
- **Community tutorials are outdated** within months
- **Breaking changes occur frequently** between minor versions

**Remember**: The goal is productive development, not using the newest tools. Choose technologies that enable both you and your AI assistant to work effectively together.

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