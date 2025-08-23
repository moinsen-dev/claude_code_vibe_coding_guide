import { defineConfig } from "vitepress";

export default defineConfig({
  title: "Vibe Coding Guide",
  description: "Master the art of vibe coding with Claude Code - achieve flow-state development through AI collaboration",

  themeConfig: {
    nav: [
      { text: "Home", link: "/" },
      { text: "Getting Started", link: "/getting-started" },
      { text: "Best Practices", link: "/best-practices/" },
      { text: "Advanced", link: "/advanced/" },
      { text: "Examples", link: "/examples/" },
      { text: "Troubleshooting", link: "/troubleshooting" }
    ],

    sidebar: {
      '/best-practices/': [
        {
          text: 'Best Practices',
          items: [
            { text: 'Overview', link: '/best-practices/' },
            { text: 'Project Setup', link: '/best-practices/project-setup' },
            { text: 'Communication', link: '/best-practices/communication' },
            { text: 'Workflow', link: '/best-practices/workflow' },
            { text: 'Configuration', link: '/best-practices/configuration' }
          ]
        }
      ],
      '/advanced/': [
        {
          text: 'Advanced Techniques',
          items: [
            { text: 'Overview', link: '/advanced/' },
            { text: 'Custom Agents', link: '/advanced/custom-agents' },
            { text: 'Automation', link: '/advanced/automation' },
            { text: 'Templates', link: '/advanced/templates' },
            { text: 'Architecture', link: '/advanced/architecture' },
            { text: 'Code Review', link: '/advanced/code-review' },
            { text: 'Debugging', link: '/advanced/debugging' },
            { text: 'Context Management', link: '/advanced/context' },
            { text: 'Tool Integration', link: '/advanced/tools' },
            { text: 'Batch Operations', link: '/advanced/batch' }
          ]
        }
      ],
      '/examples/': [
        {
          text: 'Examples',
          items: [
            { text: 'Overview', link: '/examples/' },
            { text: 'Project Setup', link: '/examples/project-setup' },
            { text: 'Workflows', link: '/examples/workflows' },
            { text: 'Configurations', link: '/examples/configurations' }
          ]
        }
      ]
    },

    socialLinks: [
      {
        icon: "github",
        link: "https://github.com/moinsen-dev/claude_code_vibe_coding_guide",
      },
    ],

    footer: {
      message: "Released under the MIT License.",
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
});
