# Contributing to the Claude Code Vibe Coding Guide

Thank you for your interest in contributing to the Claude Code Vibe Coding Guide! This project thrives on community input and shared experiences with AI-assisted development.

## 🌊 Our Vibe Coding Philosophy

Before contributing, please understand our core approach:

- **Experience-driven**: We document what actually works, not just what sounds good in theory
- **Practical over academic**: Real examples and conversation patterns over abstract concepts  
- **Flow-state focused**: Everything should enhance the natural rhythm of development
- **Community-minded**: The best practices emerge from collective experience

## 🚀 Ways to Contribute

### 1. Share Your Vibe Coding Experiences

**What we're looking for:**
- Real conversation patterns that work well with Claude Code
- Specific project setup configurations that improve AI collaboration
- Workflow techniques that create better flow states
- Troubleshooting solutions for common issues

**How to share:**
- Open an issue with the `experience-sharing` label
- Include specific examples, code snippets, or conversation excerpts
- Explain the context and why the technique works

### 2. Improve Documentation

**High-impact areas:**
- Add missing examples to existing sections
- Expand "Coming Soon" sections with practical content
- Fix broken links or incorrect information
- Improve clarity and readability

**Documentation standards:**
- Use practical, actionable language
- Include code examples where relevant
- Follow the established tone (conversational but professional)
- Add "🚧 Work in Progress" notices for incomplete sections

### 3. Create New Content

**Needed content areas:**
- Industry-specific vibe coding guides (mobile, web3, ML, etc.)
- Advanced MCP server configurations
- Team collaboration patterns with Claude Code
- Performance optimization techniques
- Security best practices for AI-assisted development

## 📝 Contribution Process

### For Small Changes (typos, small additions)

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b fix/typo-in-getting-started`
3. **Make your changes**
4. **Commit with descriptive message**: `fix: correct installation command in getting started`
5. **Submit a pull request**

### For Larger Changes (new sections, major updates)

1. **Open an issue first** to discuss the proposed change
2. **Wait for maintainer feedback** before starting work
3. **Follow the standard contribution process** once approved
4. **Include examples and test your documentation** locally

## 🛠️ Development Setup

### Prerequisites

```bash
# Node.js (use the version specified in .nvmrc)
nvm use

# Install dependencies
npm install
```

### Local Development

```bash
# Start development server
npm run dev

# Build for production (to test)
npm run build

# Preview built site
npm run preview
```

### Testing Your Changes

Before submitting:

1. **Run the build**: `npm run build` (should complete without errors)
2. **Test all links**: Navigate through the documentation to ensure no broken links
3. **Check mobile responsiveness**: Test on different screen sizes
4. **Validate markdown**: Ensure proper formatting and syntax highlighting

## 📋 Content Guidelines

### Writing Style

**Do:**
- Use conversational, approachable language
- Include practical examples and code snippets
- Share real experiences and proven techniques
- Explain the "why" behind recommendations
- Use active voice and clear, concise sentences

**Don't:**
- Use overly academic or theoretical language
- Include outdated or unverified information
- Make claims without supporting examples
- Use gender-specific pronouns (use "they/them" or "you")
- Include controversial opinions without context

### Code Examples

**Requirements:**
- All code examples should be functional and tested
- Include language specification for syntax highlighting
- Add comments explaining non-obvious parts
- Use realistic, meaningful variable names

**Example:**
```typescript
// ✅ Good: Practical, commented, realistic
interface TaskRequest {
  title: string
  dueDate?: string
  priority: 'low' | 'medium' | 'high'
}

// Handle task creation with validation
export async function createTask(data: TaskRequest): Promise<Task> {
  // Validate required fields
  if (!data.title.trim()) {
    throw new ValidationError('Task title is required')
  }
  
  return await taskService.create(data)
}
```

### Markdown Standards

- Use proper heading hierarchy (don't skip levels)
- Include table of contents for long pages
- Use code fences with language specification
- Include alt text for images
- Use consistent emoji usage (sparingly, only when they add meaning)

## 🎯 Specific Contribution Areas

### 1. CLAUDE.md Templates

**What we need:**
- Templates for different technology stacks
- Industry-specific project contexts
- Team collaboration patterns

**Requirements:**
- Must be based on real, working projects
- Include specific commands and architecture notes
- Explain why certain patterns work well with Claude

### 2. MCP Server Configurations

**What we need:**
- New MCP server integrations and examples
- Advanced configuration patterns
- Troubleshooting guides for specific servers

**Requirements:**
- Test configurations before submitting
- Include practical use cases and examples
- Document any prerequisites or limitations

### 3. Workflow Examples

**What we need:**
- Real conversation examples (anonymized)
- Step-by-step workflow guides
- Problem-solving patterns

**Requirements:**
- Demonstrate actual vibe coding principles
- Show the full conversation flow, not just snippets
- Explain what makes the example effective

## 🐛 Bug Reports

### Before Reporting

1. **Search existing issues** to avoid duplicates
2. **Test with latest version** of the documentation
3. **Gather specific information** about the problem

### Bug Report Template

```markdown
## Description
Brief description of the issue

## Steps to Reproduce
1. Go to [page/section]
2. Follow [specific instructions]
3. Observe [unexpected behavior]

## Expected Behavior
What should happen

## Actual Behavior
What actually happens

## Environment
- Browser: [Chrome 91, Firefox 89, etc.]
- Device: [Desktop, Mobile, etc.]
- Page: [Specific documentation page]

## Screenshots
If applicable, add screenshots
```

## 💡 Feature Requests

### Before Requesting

1. **Check if it aligns with vibe coding philosophy**
2. **Search existing issues and discussions**
3. **Consider if it benefits the community**

### Feature Request Template

```markdown
## Feature Description
Clear description of the proposed feature

## Use Case
Specific scenario where this would be valuable

## Proposed Implementation
How you envision this being implemented

## Alternatives Considered
Other approaches you've thought about

## Community Benefit
How this helps other vibe coders
```

## 🔍 Review Process

### What Reviewers Look For

1. **Accuracy**: Information is correct and up-to-date
2. **Clarity**: Content is easy to understand and follow
3. **Practicality**: Examples and advice are actionable
4. **Consistency**: Style and format match existing documentation
5. **Value**: Contribution meaningfully improves the guide

### Review Timeline

- **Small fixes**: Usually reviewed within 2-3 days
- **Content additions**: May take 1-2 weeks for thorough review
- **Major changes**: Could require discussion and multiple review rounds

## 🏆 Recognition

Contributors are recognized in several ways:

1. **Credit in CHANGELOG.md** for significant contributions
2. **Mention in documentation** for major content additions  
3. **Community shoutouts** for valuable examples and insights

## 📞 Getting Help

### Questions About Contributing

- **Open a discussion** for general questions
- **Join our community** (if/when established)
- **Tag maintainers** in issues for specific questions

### Technical Issues

- **Check the troubleshooting guide** first
- **Search existing issues**
- **Provide detailed information** when asking for help

## 📜 Code of Conduct

### Our Standards

- **Be respectful and inclusive**
- **Focus on constructive feedback**
- **Help create a welcoming environment**
- **Share knowledge generously**
- **Assume good intentions**

### Unacceptable Behavior

- Harassment or discriminatory language
- Personal attacks or trolling
- Sharing others' private information
- Commercial advertising or spam
- Deliberately disrupting discussions

### Enforcement

Community guidelines are enforced by project maintainers. Reports can be made confidentially, and appropriate action will be taken.

---

## 🚀 Ready to Contribute?

1. **Read through the documentation** to understand our approach
2. **Try vibe coding yourself** to gain practical experience  
3. **Start small** with typo fixes or small additions
4. **Share your experiences** through issues or discussions
5. **Propose larger changes** through the issue process

Remember: The best contributions come from real experience with vibe coding. We value practical insights over theoretical knowledge!

**Happy vibe coding! 🌊**