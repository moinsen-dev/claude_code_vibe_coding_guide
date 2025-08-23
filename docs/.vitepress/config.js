import { defineConfig } from "vitepress";

export default defineConfig({
  title: "Claude Code Best Practices",
  description:
    "A comprehensive guide to using Claude Code effectively in your development workflow",

  themeConfig: {
    nav: [
      { text: "Home", link: "/" },
      { text: "Getting Started", link: "/getting-started" },
      { text: "Best Practices", link: "/best-practices/" },
      { text: "Examples", link: "/examples/" },
    ],

    sidebar: [
      {
        text: "Introduction",
        items: [
          { text: "Overview", link: "/" },
          { text: "Getting Started", link: "/getting-started" },
          { text: "Quick Setup", link: "/quick-setup" },
        ],
      },
      {
        text: "Best Practices",
        items: [
          { text: "Overview", link: "/best-practices/" },
          { text: "Project Setup", link: "/best-practices/project-setup" },
          {
            text: "Effective Communication",
            link: "/best-practices/communication",
          },
          { text: "Development Workflow", link: "/best-practices/workflow" },
          { text: "Configuration", link: "/best-practices/configuration" },
        ],
      },
      {
        text: "Examples",
        items: [
          { text: "Common Patterns", link: "/examples/" },
          { text: "MCP Setup", link: "/examples/mcp-setup" },
          { text: "CLAUDE.md Templates", link: "/examples/claude-md" },
          { text: "Project Structures", link: "/examples/project-structures" },
        ],
      },
      {
        text: "Advanced",
        items: [
          { text: "Custom Agents", link: "/advanced/custom-agents" },
          { text: "Hooks and Automation", link: "/advanced/hooks" },
          { text: "Troubleshooting", link: "/advanced/troubleshooting" },
        ],
      },
    ],

    socialLinks: [
      {
        icon: "github",
        link: "https://github.com/moinsen-dev/claude_code_vibe_coding_guide",
      },
    ],

    footer: {
      message: "Released under the MIT License.",
      copyright: "Copyright © 2024-present Your Name",
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
});
