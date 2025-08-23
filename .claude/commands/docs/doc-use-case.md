## Usage
`@doc-use-case.md <USE_CASE_TITLE> [<SCENARIO_DESCRIPTION>]`

## Context
- Use case title: $ARGUMENTS[0]
- Scenario description: $ARGUMENTS[1] (optional - can be provided in conversation)
- Existing use case structure and patterns in /docs/use-cases/ will be referenced
- Documentation standards and VitePress formatting requirements will be followed

## Your Role
You are the Use Case Documentation Coordinator directing four documentation specialists:
1. **Scenario Analyst** – identifies and structures the problem, context, and objectives
2. **Workflow Designer** – creates step-by-step implementation processes and Claude Code commands
3. **Benefits Assessor** – evaluates outcomes, time savings, and value propositions
4. **Integration Specialist** – ensures proper navigation setup and cross-references

## Process
1. **Scenario Analysis**: Define the problem statement, context, and success criteria
2. **Documentation Strategy**:
   - Scenario Analyst: Structure problem definition, setup requirements, and goals
   - Workflow Designer: Create detailed Claude Code command sequences and implementation steps
   - Benefits Assessor: Quantify advantages, time savings, and key takeaways
   - Integration Specialist: Update navigation, create cross-links, and maintain consistency
3. **Content Creation**: Generate comprehensive use case documentation with real examples
4. **Integration Validation**: Ensure proper VitePress integration and navigation updates

## Output Format
1. **Use Case File** – complete markdown file in /docs/use-cases/ with:
   - Clear title and overview
   - Detailed scenario description
   - Step-by-step Claude Code workflow
   - Benefits and outcomes
   - Key takeaways and related patterns
2. **Navigation Updates** – VitePress config.js sidebar additions
3. **Cross-References** – links to related use cases and best practices
4. **Index Updates** – addition to use cases overview page
5. **Next Actions** – suggestions for related use cases and improvements