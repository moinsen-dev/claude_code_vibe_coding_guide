import { defineConfig } from "vitepress";
import { withMermaid } from "vitepress-plugin-mermaid";

export default withMermaid(
  defineConfig({
    title: "Vibe Coding Guide",
    description:
      "Master the art of vibe coding with Claude Code - achieve flow-state development through AI collaboration",

    themeConfig: {
      nav: [
        { text: "Home", link: "/" },
        { text: "Getting Started", link: "/getting-started" },
        {
          text: "Features",
          items: [
            { text: "Commands", link: "/commands/" },
            { text: "Agents", link: "/agents/" },
            { text: "Hooks", link: "/hooks/" },
            { text: "MCP", link: "/mcp/" },
          ],
        },
        {
          text: "Guides",
          items: [
            { text: "Best Practices", link: "/best-practices/" },
            { text: "Advanced", link: "/advanced/" },
          ],
        },
        {
          text: "Resources",
          items: [
            { text: "Use Cases", link: "/use-cases/" },
            { text: "Examples", link: "/examples/" },
            { text: "Tips & Tricks", link: "/tips-and-tricks" },
            { text: "Troubleshooting", link: "/troubleshooting" },
          ],
        },
        { text: "Business", link: "/business/" },
      ],

      sidebar: {
        "/getting-started/": [
          {
            text: "Getting Started",
            items: [
              { text: "Overview", link: "/getting-started" },
              { 
                text: "Complete Beginner Guide", 
                link: "/getting-started/absolute-beginner" 
              },
            ],
          },
        ],
        "/commands/": [
          {
            text: "Command Overview",
            items: [{ text: "Overview", link: "/commands/" }],
          },
          {
            text: "Core Development",
            items: [
              { text: "@code.md", link: "/commands/code" },
              { text: "@debug.md", link: "/commands/debug" },
              { text: "@test.md", link: "/commands/test" },
              { text: "@review.md", link: "/commands/review" },
              { text: "@refactor.md", link: "/commands/refactor" },
              { text: "@optimize.md", link: "/commands/optimize" },
              { text: "@deploy-check.md", link: "/commands/deploy-check" },
            ],
          },
          {
            text: "Specialized",
            items: [
              { text: "@ask.md", link: "/commands/ask" },
              { text: "@goals.md", link: "/commands/goals" },
              { text: "@prd.md", link: "/commands/prd" },
              { text: "@state_tracker.md", link: "/commands/state_tracker" },
            ],
          },
          {
            text: "Personal & Advanced",
            items: [
              {
                text: "Personal Commands",
                link: "/commands/personal-commands",
              },
              { text: "Command Patterns", link: "/commands/command-patterns" },
            ],
          },
        ],
        "/agents/": [
          {
            text: "Agents",
            items: [
              { text: "Overview", link: "/agents/" },
              { text: "Subagent Patterns", link: "/agents/subagent-patterns" },
            ],
          },
        ],
        "/hooks/": [
          {
            text: "Hooks",
            items: [
              { text: "Overview", link: "/hooks/" },
              { text: "Automation Recipes", link: "/hooks/automation-recipes" },
            ],
          },
        ],
        "/mcp/": [
          {
            text: "MCP Overview",
            items: [{ text: "Overview", link: "/mcp/" }],
          },
          {
            text: "MCP Servers",
            items: [
              { text: "Browser MCP", link: "/mcp/browsermcp" },
              { text: "Sequential Thinking", link: "/mcp/sequential-thinking" },
              { text: "Time Server", link: "/mcp/time" },
            ],
          },
        ],
        "/best-practices/": [
          {
            text: "Best Practices",
            items: [
              { text: "Overview", link: "/best-practices/" },
              { text: "Project Setup", link: "/best-practices/project-setup" },
              { text: "Communication", link: "/best-practices/communication" },
              { text: "Voice Input", link: "/best-practices/voice-input" },
              { text: "Workflow", link: "/best-practices/workflow" },
              { text: "Configuration", link: "/best-practices/configuration" },
            ],
          },
        ],
        "/advanced/": [
          {
            text: "Advanced Techniques",
            items: [
              { text: "Overview", link: "/advanced/" },
              {
                text: "Idea to Production",
                link: "/advanced/idea-to-production",
              },
              {
                text: "Project Lifecycle",
                link: "/advanced/project-lifecycle",
              },
              {
                text: "Command Integration",
                link: "/advanced/command-integration",
              },
              { text: "Model Selection", link: "/advanced/model-selection" },
              { text: "CLI Automation", link: "/advanced/cli-automation" },
              { text: "Custom Agents", link: "/advanced/custom-agents" },
              { text: "Automation", link: "/advanced/automation" },
              { text: "Templates", link: "/advanced/templates" },
              { text: "Architecture", link: "/advanced/architecture" },
              { text: "Code Review", link: "/advanced/code-review" },
              { text: "Debugging", link: "/advanced/debugging" },
              { text: "Context Management", link: "/advanced/context" },
              { text: "Tool Integration", link: "/advanced/tools" },
              { text: "Batch Operations", link: "/advanced/batch" },
            ],
          },
        ],
        "/use-cases/": [
          {
            text: "Use Cases",
            items: [
              { text: "Overview", link: "/use-cases/" },
              {
                text: "Migration Comparison",
                link: "/use-cases/migration-comparison",
              },
            ],
          },
        ],
        "/examples/": [
          {
            text: "Examples",
            items: [
              { text: "Overview", link: "/examples/" },
              { text: "Project Setup", link: "/examples/project-setup" },
              { text: "Workflows", link: "/examples/workflows" },
              { text: "Configurations", link: "/examples/configurations" },
              {
                text: "Real-World Case Studies",
                link: "/examples/real-world-examples",
              },
            ],
          },
        ],
        "/business/": [
          {
            text: "Business Guide",
            items: [
              { text: "Overview", link: "/business/" },
              { text: "ROI and Benefits", link: "/business/roi-and-benefits" },
              { text: "Risk Management", link: "/business/risk-management" },
              { text: "Enterprise Solutions", link: "/business/enterprise-solutions" },
              { text: "Stakeholder Guide", link: "/business/stakeholder-guide" },
            ],
          },
        ],
      },

      socialLinks: [
        {
          icon: "github",
          link: "https://github.com/moinsen-dev/claude_code_vibe_coding_guide",
        },
      ],

      footer: {
        message: "Released under2025 MIT License.",
        copyright: "Copyright © 2024 Moinsen Development Team",
      },

      search: {
        provider: "local",
      },

      editLink: {
        pattern:
          "https://github.com/moinsen-dev/claude_code_vibe_coding_guide/edit/main/docs/:path",
        text: "Edit this page on GitHub",
      },
    },

    base: "/claude_code_vibe_coding_guide/",

    head: [["meta", { name: "theme-color", content: "#3c8772" }]],

    mermaid: {
      theme: "default",
      themeVariables: {
        primaryColor: "#3c8772",
        primaryTextColor: "#ffffff",
        primaryBorderColor: "#2e6653",
        lineColor: "#555555",
        sectionBkgColor: "#f9f9f9",
        altSectionBkgColor: "#ffffff",
        gridColor: "#e0e0e0",
      },
    },
  })
);
