# Tips and Tricks from Anthropic

Official tips and best practices from Anthropic's Claude Code documentation, organized for quick reference and maximum productivity.

## Communication & Interaction

::: tip Claude Code is Your AI Pair Programmer
Remember: Claude Code is your AI pair programmer. Talk to it like you would a helpful colleague – describe what you want to achieve, and it will help you get there.

*Source: [Quickstart Guide](https://docs.anthropic.com/en/docs/claude-code/quickstart)*
:::

::: info Ask Broad Then Specific Questions
- Start with broad questions, then narrow down to specific areas
- Ask about coding conventions and patterns used in the project
- Request a glossary of project-specific terms

*Source: [Common Workflows](https://docs.anthropic.com/en/docs/claude-code/common-workflows)*
:::

::: tip Be Specific and Use Project Terms
- Be specific about what you're looking for
- Use domain language from the project

*Source: [Common Workflows](https://docs.anthropic.com/en/docs/claude-code/common-workflows)*
:::

::: info Use Images for Clarity
- Use images when text descriptions would be unclear or cumbersome
- Include screenshots of errors, UI designs, or diagrams for better context
- You can work with multiple images in a conversation
- Image analysis works with diagrams, screenshots, mockups, and more

*Source: [Common Workflows](https://docs.anthropic.com/en/docs/claude-code/common-workflows)*
:::

## Debugging & Problem Solving

::: warning Provide Error Reproduction Steps
- Tell Claude the command to reproduce the issue and get a stack trace
- Mention any steps to reproduce the error
- Let Claude know if the error is intermittent or consistent

*Source: [Common Workflows](https://docs.anthropic.com/en/docs/claude-code/common-workflows)*
:::

::: tip Use Extended Thinking for Complex Tasks
Extended thinking is most valuable for complex tasks such as:
- Planning complex architectural changes
- Debugging intricate issues
- Creating implementation plans for new features
- Understanding complex codebases

**Prompting tips:**
- "think" triggers basic extended thinking
- Intensifiers like "think more", "think harder", or "think longer" trigger deeper reasoning

*Source: [Common Workflows](https://docs.anthropic.com/en/docs/claude-code/common-workflows)*
:::

## Development Workflows

::: info Refactor in Small, Backward-Compatible Steps
- Ask Claude to explain the benefits of the modern approach
- Request that changes maintain backward compatibility when needed
- Do refactoring in small, testable increments

*Source: [Common Workflows](https://docs.anthropic.com/en/docs/claude-code/common-workflows)*
:::

::: tip Cover Edge Cases with Tests
- Ask for tests that cover edge cases and error conditions
- Request both unit and integration tests when appropriate
- Have Claude explain the testing strategy

*Source: [Common Workflows](https://docs.anthropic.com/en/docs/claude-code/common-workflows)*
:::

::: info Let Claude Create PRs, But Review Them
- Ask Claude directly to make a PR for you
- Review Claude's generated PR before submitting
- Ask Claude to highlight potential risks or considerations

*Source: [Common Workflows](https://docs.anthropic.com/en/docs/claude-code/common-workflows)*
:::

::: tip Specify Documentation Style
- Specify the documentation style you want (JSDoc, docstrings, etc.)
- Ask for examples in the documentation
- Request documentation for public APIs, interfaces, and complex logic

*Source: [Common Workflows](https://docs.anthropic.com/en/docs/claude-code/common-workflows)*
:::

## Claude Code Features

::: info Use @ References for Files and Directories
- File paths can be relative or absolute
- "@" file references add CLAUDE.md in the file's directory and parent directories to context
- Directory references show file listings, not contents
- You can reference multiple files in a single message (e.g., "@file1.js and @file2.js")

*Source: [Common Workflows](https://docs.anthropic.com/en/docs/claude-code/common-workflows)*
:::

::: tip Conversation History is Local
- Conversation history is stored locally on your machine
- Use `--continue` for quick access to your most recent conversation
- Use `--resume` when you need to select a specific past conversation
- When resuming, you'll see the entire conversation history before continuing
- The resumed conversation starts with the same model and configuration as the original

*Source: [Common Workflows](https://docs.anthropic.com/en/docs/claude-code/common-workflows)*
:::

::: info Isolate Parallel Sessions with Git Worktrees
- Each worktree has its own independent file state, making it perfect for parallel Claude Code sessions
- Changes made in one worktree won't affect others, preventing interference between Claude instances
- All worktrees share the same Git history and remote connections
- For long-running tasks, you can have Claude working in one worktree while you continue development in another
- Use descriptive directory names to identify each worktree's task
- Remember to initialize your development environment in each new worktree

*Source: [Common Workflows](https://docs.anthropic.com/en/docs/claude-code/common-workflows)*
:::

::: tip Choose the Right Output Format
- Use `--output-format text` for simple integrations where you just need Claude's response
- Use `--output-format json` when you need the full conversation log
- Use `--output-format stream-json` for real-time output of each conversation turn

*Source: [Common Workflows](https://docs.anthropic.com/en/docs/claude-code/common-workflows)*
:::

## Automation & Integration

::: info Automate Code Review with Claude in CI
- Use Claude for automated code review in your CI/CD pipeline
- Customize the prompt to check for specific issues relevant to your project
- Consider creating multiple scripts for different types of verification

*Source: [Common Workflows](https://docs.anthropic.com/en/docs/claude-code/common-workflows)*
:::

::: tip Integrate with Shell Pipes
- Use pipes to integrate Claude into existing shell scripts
- Combine with other Unix tools for powerful workflows
- Consider using `--output-format` for structured output

*Source: [Common Workflows](https://docs.anthropic.com/en/docs/claude-code/common-workflows)*
:::

## Project Customization

::: info Use Project-Specific Subagents
- Create project-specific subagents in `.claude/agents/` for team sharing
- Use descriptive description fields to enable automatic delegation
- Limit tool access to what each subagent actually needs
- Check the subagents documentation for detailed examples

*Source: [Common Workflows](https://docs.anthropic.com/en/docs/claude-code/common-workflows)*
:::

::: tip Project Slash Commands
- Command names are derived from the filename (e.g. `optimize.md` becomes `/optimize`)
- You can organize commands in subdirectories (e.g. `.claude/commands/frontend/component.md` creates `/component` with "(project:frontend)" shown in the description)
- Project commands are available to everyone who clones the repository
- The Markdown file's content becomes the prompt sent to Claude when the command is invoked

*Source: [Common Workflows](https://docs.anthropic.com/en/docs/claude-code/common-workflows)*
:::

::: info Add $ARGUMENTS to Slash Commands
- The `$ARGUMENTS` placeholder is replaced with any text that follows the command
- You can position `$ARGUMENTS` anywhere in your command template
- Useful applications include generating test cases for specific functions, creating documentation for components, reviewing code in particular files, or translating content to specified languages

*Source: [Common Workflows](https://docs.anthropic.com/en/docs/claude-code/common-workflows)*
:::

::: tip Personal Slash Commands
- Personal commands show "(user)" in their description when listed with `/help`
- Personal commands are only available to you and not shared with your team
- Personal commands work across all your projects
- Use them for consistent workflows across different codebases

*Source: [Common Workflows](https://docs.anthropic.com/en/docs/claude-code/common-workflows)*
:::

::: info Use CLAUDE.md Effectively
- Include frequently used commands (build, test, lint) to avoid repeated searches
- Document code style preferences and naming conventions
- Add important architectural patterns specific to your project
- CLAUDE.md memories can be used for both instructions shared with your team and for your individual preferences

*Source: [Memory Guide](https://docs.anthropic.com/en/docs/claude-code/memory)*
:::

## Help & Documentation

::: tip Claude Always Has Latest Docs
- Claude always has access to the latest Claude Code documentation, regardless of the version you're using
- Ask specific questions to get detailed answers
- Claude can explain complex features like MCP integration, enterprise configurations, and advanced workflows

*Source: [Common Workflows](https://docs.anthropic.com/en/docs/claude-code/common-workflows)*
:::

## Security Considerations

::: danger Third-Party MCP Servers Caution
Use third party MCP servers at your own risk – Anthropic has not verified the correctness or security of all these servers. Make sure you trust MCP servers you are installing. Be especially careful when using MCP servers that could fetch untrusted content, as these can expose you to prompt injection risk.

*Source: [MCP Guide](https://docs.anthropic.com/en/docs/claude-code/mcp)*
:::

::: warning GitHub Actions Security
Use repository-specific configurations and grant only the minimum required permissions. When configuring cloud provider authentication for GitHub Actions, use narrowly scoped settings and least privilege access.

*Source: [GitHub Actions Guide](https://docs.anthropic.com/en/docs/claude-code/github-actions)*
:::

---

*All tips sourced from official [Anthropic Claude Code Documentation](https://docs.anthropic.com/en/docs/claude-code/) - refer to original sources for detailed explanations and examples.*