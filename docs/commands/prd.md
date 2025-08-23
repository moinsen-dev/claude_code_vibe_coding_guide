# @prd.md - Product Strategy Coordinator

Digital assistant command that transforms product ideas into comprehensive Product Requirements Documents through structured analysis and interactive questioning.

## Usage

```
@prd.md [TITLE] [CONTEXT]
```

## What It Does

Acts as a Product Strategy Coordinator that guides you through creating professional PRDs by:

1. **Problem Analyst** – identifies and articulates core problems and user pain points
2. **Solution Architect** – designs solution approach and technical strategy
3. **Market Strategist** – analyzes target audience, competition, and market fit
4. **Delivery Planner** – creates timeline, milestones, and risk mitigation plans

## When to Use

::: tip Perfect for Product Planning
- **New product ideas** that need formal documentation
- **Feature specifications** requiring structured analysis
- **Startup planning** with comprehensive requirements gathering
- **Business case development** with market and technical validation
- **Team alignment** around product vision and scope
:::

::: info Great for Idea Validation
- **Concept refinement** through systematic questioning
- **Market research** and competitive analysis
- **Technical feasibility** assessment and planning
- **Risk identification** and mitigation planning
- **Stakeholder communication** with professional documentation
:::

## Key Benefits

### 🧠 Systematic Analysis
- Uses MCP Sequential Thinking for deep product analysis
- Structured approach ensures no critical aspects are missed
- Multiple perspectives from specialized advisors
- Evidence-based decision making and recommendations

### 💬 Interactive Intelligence
- Asks clarifying questions when information is missing
- Probes for deeper understanding of user problems
- Suggests considerations you might not have thought of
- Adapts questioning based on your responses

### 📋 Comprehensive Output
- Professional PRD document saved as `prd.md`
- All standard PRD sections with detailed content
- Clear action items and next steps
- Open questions highlighted for further research

### 🎯 Strategic Focus
- Problem-solution fit analysis
- Market viability assessment
- Technical feasibility evaluation
- Business impact and success metrics

## Example Scenarios

### Mobile App Concept
```
@prd.md "TaskFlow" "A productivity app that helps remote teams coordinate 
daily tasks with smart notifications and progress tracking"
```

**PRD Process**:
1. **Problem Analysis**: What specific coordination problems do remote teams face?
2. **Market Research**: How do existing solutions fall short?
3. **User Research**: Who are the primary users and what are their workflows?
4. **Technical Planning**: What platform strategy and architecture requirements?
5. **Business Model**: How will this create value and generate revenue?

### SaaS Platform Idea
```
@prd.md "InvoiceAI" "Automated invoice processing using AI to extract data 
and integrate with accounting systems for small businesses"
```

**Analysis Framework**:
1. **Problem Definition**: Current invoice processing pain points
2. **Solution Design**: AI processing capabilities and integration approach
3. **Target Market**: Small business accounting workflow analysis
4. **Competition**: Existing solutions and differentiation strategy
5. **Implementation**: Technical architecture and development phases

### Internal Tool Development
```
@prd.md "DevOps Dashboard" "Centralized monitoring and deployment dashboard 
for our microservices architecture with real-time alerts"
```

**Strategic Planning**:
1. **Current State**: Existing monitoring gaps and inefficiencies
2. **Requirements**: Team needs and workflow integration
3. **Technical Specs**: Architecture, data sources, and integrations
4. **Success Metrics**: Efficiency improvements and adoption targets
5. **Timeline**: Development phases and rollout strategy

## Interactive Question Framework

### Problem Exploration
- "What specific problem does this solve for users?"
- "How do users currently handle this problem?"
- "What makes this problem worth solving now?"
- "Who feels this problem most acutely?"

### Solution Validation
- "What's your unique approach to solving this?"
- "What alternatives exist and why aren't they sufficient?"
- "What's the minimum viable solution?"
- "What would make users switch from their current approach?"

### Market & Business
- "Who is your primary target audience?"
- "What's the market size and opportunity?"
- "How will you reach and acquire users?"
- "What's your business model and pricing strategy?"

### Technical & Implementation
- "What technical constraints or requirements exist?"
- "What's your preferred technology stack?"
- "What integrations are essential vs nice-to-have?"
- "What are the scaling and security considerations?"

## PRD Structure Generated

### Executive Summary
- Product overview and value proposition
- Target market and user base
- Key success metrics and timeline

### Problem Statement
- Current situation analysis
- User pain points and frustrations
- Market gap and opportunity size

### Goals & Objectives
- Primary product goals (3-5 key objectives)
- Success metrics and KPIs
- User experience goals

### Target Audience
- Primary user personas with demographics and behavior
- Use cases and user journeys
- Secondary stakeholders and their needs

### Solution Overview
- Core features and functionality
- MVP scope and future roadmap
- Technical architecture approach

### Requirements
- **Functional**: User stories, features, acceptance criteria
- **Non-Functional**: Performance, security, scalability, usability

### Constraints & Assumptions
- Budget, timeline, and resource limitations
- Technical constraints and dependencies
- Market and business assumptions

### Risks & Mitigation
- Technical risks and solutions
- Market risks and contingencies
- Business risks and mitigation plans

### Timeline & Milestones
- Development phases and deliverables
- Key milestones and decision points
- Launch and post-launch roadmap

### Open Questions
- Research needed before development
- Decisions requiring stakeholder input
- Areas requiring further validation

## Sequential Thinking Integration

The command leverages MCP Sequential Thinking to:

### Deep Problem Analysis
```
"Think deeply about this product idea, considering:
- Problem-solution fit and market need
- Technical feasibility and implementation challenges
- User experience and adoption barriers
- Business viability and competitive landscape"
```

### Multi-Perspective Evaluation
- **User Perspective**: Does this solve a real problem users care about?
- **Technical Perspective**: Is this technically feasible and maintainable?
- **Business Perspective**: Can this create sustainable value and growth?
- **Market Perspective**: Is there sufficient market opportunity and demand?

### Risk Assessment
- Systematic identification of technical, market, and business risks
- Evaluation of risk probability and impact
- Development of specific mitigation strategies

## Best Practices

### Maximize PRD Value

::: tip Provide Context Upfront
- **Share your background** and experience with the problem
- **Include market research** or user feedback you already have
- **Mention constraints** like budget, timeline, or technical limitations
- **Describe your vision** for the end user experience
:::

::: info Be Open to Questions
- **Answer thoughtfully** when the assistant asks for clarification
- **Provide specific examples** rather than general descriptions
- **Share assumptions** you're making about users or markets
- **Mention concerns** or risks you're already aware of
:::

::: warning Iterate and Refine
- **Review the generated PRD** carefully and identify gaps
- **Ask follow-up questions** about sections that need more detail
- **Request revisions** for sections that don't capture your vision
- **Use the PRD** as a living document that evolves with learning
:::

### Effective Product Planning

**Start Broad, Then Focus**: Begin with the big picture problem and vision, then drill down into specific features and requirements.

**User-Centric Thinking**: Always frame features and decisions in terms of user value and problem-solving effectiveness.

**Evidence-Based Planning**: Include market research, user interviews, or competitive analysis to support your decisions.

**Iterative Approach**: Use the PRD as a starting point for validation and refinement through prototyping and user feedback.

## Output Management

### File Creation
- **Filename**: `prd.md` created in your project root
- **Format**: Structured markdown with clear sections and formatting
- **Content**: Comprehensive analysis based on your input and interactive Q&A
- **Updates**: Can be regenerated with refined inputs for iterative improvement

### Version Control
- Track changes to your PRD as your understanding evolves
- Use git to maintain history of product requirement evolution
- Share with team members for feedback and alignment
- Reference during development to ensure scope adherence

## Integration with Development Workflow

### Strategic Planning Phase
1. **Idea Generation**: Use @prd.md to formalize and validate concepts
2. **Stakeholder Alignment**: Share PRD for feedback and buy-in
3. **Technical Planning**: Use PRD as input for @ask.md architectural decisions

### Implementation Phase
1. **Development Planning**: Break PRD requirements into development tasks
2. **Feature Development**: Use @code.md for implementing specific features
3. **Progress Tracking**: Use @goals.md for ongoing project coordination

### Validation Phase
1. **Testing Strategy**: Use @test.md to validate PRD requirements
2. **Code Review**: Use @review.md to ensure quality standards
3. **Deployment Planning**: Use @deploy-check.md for release readiness

## Related Commands

- Use `@ask.md` for **architectural decisions** after PRD completion
- Use `@code.md` for **feature implementation** based on PRD requirements
- Use `@goals.md` for **project management** and team coordination during development