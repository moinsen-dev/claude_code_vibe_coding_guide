import { defineConfig } from "vitepress";
import { withMermaid } from "vitepress-plugin-mermaid";

export default withMermaid(
  defineConfig({
    title:
      "Vibe Coding Guide - Master AI-Assisted Development with Claude Code",
    description:
      "Complete guide to vibe coding with Claude Code. Learn prompt engineering, multi-agent patterns, and achieve 3-5x productivity gains. Enterprise case studies, community resources, and proven workflows included.",

    lang: "en-US",

    // Additional SEO Configuration
    cleanUrls: true,
    lastUpdated: true,

    // Sitemap configuration
    sitemap: {
      hostname: "https://moinsen-dev.github.io/claude_code_vibe_coding_guide",
    },

    // URL rewrites for content migration
    rewrites: {
      'tips-and-tricks.html': 'tips-and-tricks/index.html'
    },

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
            { text: "Techniques", link: "/techniques/" },
            { text: "Best Practices", link: "/best-practices/" },
            { text: "Advanced", link: "/advanced/" },
          ],
        },
        {
          text: "Resources",
          items: [
            { text: "Community", link: "/community/" },
            { text: "Resources & References", link: "/resources/" },
            { text: "Use Cases", link: "/use-cases/" },
            { text: "Examples", link: "/examples/" },
            { 
              text: "Tips & Tricks", 
              items: [
                { text: "Overview", link: "/tips-and-tricks/" },
                { text: "Anthropic Official", link: "/tips-and-tricks/anthropic" },
                { text: "Community Experts", link: "/tips-and-tricks/community" },
              ] 
            },
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
                link: "/getting-started/absolute-beginner",
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
        "/techniques/": [
          {
            text: "Techniques",
            items: [
              { text: "Overview", link: "/techniques/" },
              {
                text: "Prompt Engineering",
                link: "/techniques/prompt-engineering",
              },
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
              { text: "Workflows", link: "/best-practices/workflows" },
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
                text: "Multi-Agent Patterns",
                link: "/advanced/multi-agent-patterns",
              },
              {
                text: "Security Validation",
                link: "/advanced/security-validation",
              },
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
              { text: "Context Engineering", link: "/advanced/context" },
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
                text: "SEO Implementation Case Study",
                link: "/use-cases/seo-implementation",
              },
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
              {
                text: "Enterprise Solutions",
                link: "/business/enterprise-solutions",
              },
              {
                text: "Stakeholder Guide",
                link: "/business/stakeholder-guide",
              },
            ],
          },
        ],
        "/community/": [
          {
            text: "Community",
            items: [{ text: "Community Hub", link: "/community/" }],
          },
        ],
        "/resources/": [
          {
            text: "Resources",
            items: [
              { text: "Overview", link: "/resources/" },
              { text: "References", link: "/resources/references" },
            ],
          },
        ],
        "/tips-and-tricks/": [
          {
            text: "Tips & Tricks",
            items: [
              { text: "Overview", link: "/tips-and-tricks/" },
              { text: "Anthropic Official", link: "/tips-and-tricks/anthropic" },
              { text: "Community Experts", link: "/tips-and-tricks/community" },
            ],
          },
        ],
        "/troubleshooting": [
          {
            text: "Troubleshooting",
            items: [
              { text: "Overview", link: "/troubleshooting" },
              {
                text: "Debugging AI Code",
                link: "/troubleshooting/debugging-ai-code",
              },
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
        copyright: "Copyright © 2025 Moinsen Development Team",
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

    head: [
      // SEO Meta Tags
      ["meta", { name: "theme-color", content: "#3c8772" }],
      [
        "meta",
        {
          name: "keywords",
          content:
            "Claude Code, vibe coding, AI coding, prompt engineering, multi-agent development, ChatGPT, artificial intelligence, software development, productivity, automation, enterprise AI, code generation, developer tools, machine learning, natural language programming",
        },
      ],
      ["meta", { name: "author", content: "Vibe Coding Community" }],
      ["meta", { name: "robots", content: "index,follow" }],
      ["meta", { name: "googlebot", content: "index,follow" }],

      // Open Graph Meta Tags
      ["meta", { property: "og:type", content: "website" }],
      [
        "meta",
        {
          property: "og:title",
          content:
            "Vibe Coding Guide - Master AI-Assisted Development with Claude Code",
        },
      ],
      [
        "meta",
        {
          property: "og:description",
          content:
            "Complete guide to vibe coding with Claude Code. Learn prompt engineering, multi-agent patterns, and achieve 3-5x productivity gains. Enterprise case studies, community resources, and proven workflows included.",
        },
      ],
      [
        "meta",
        {
          property: "og:url",
          content:
            "https://moinsen-dev.github.io/claude_code_vibe_coding_guide/",
        },
      ],
      ["meta", { property: "og:site_name", content: "Vibe Coding Guide" }],
      [
        "meta",
        {
          property: "og:image",
          content:
            "https://moinsen-dev.github.io/claude_code_vibe_coding_guide/vibe-coding-guide.png",
        },
      ],
      ["meta", { property: "og:image:width", content: "1200" }],
      ["meta", { property: "og:image:height", content: "630" }],
      [
        "meta",
        {
          property: "og:image:alt",
          content: "Vibe Coding Guide - Master AI-Assisted Development",
        },
      ],
      ["meta", { property: "og:locale", content: "en_US" }],

      // Twitter Card Meta Tags
      ["meta", { name: "twitter:card", content: "summary_large_image" }],
      [
        "meta",
        {
          name: "twitter:title",
          content:
            "Vibe Coding Guide - Master AI-Assisted Development with Claude Code",
        },
      ],
      [
        "meta",
        {
          name: "twitter:description",
          content:
            "Complete guide to vibe coding with Claude Code. Learn prompt engineering, multi-agent patterns, and achieve 3-5x productivity gains.",
        },
      ],
      [
        "meta",
        {
          name: "twitter:image",
          content:
            "https://moinsen-dev.github.io/claude_code_vibe_coding_guide/vibe-coding-guide.png",
        },
      ],
      [
        "meta",
        {
          name: "twitter:image:alt",
          content: "Vibe Coding Guide - Master AI-Assisted Development",
        },
      ],

      // Additional SEO Tags
      ["meta", { name: "apple-mobile-web-app-capable", content: "yes" }],
      [
        "meta",
        {
          name: "apple-mobile-web-app-status-bar-style",
          content: "black-translucent",
        },
      ],
      [
        "meta",
        { name: "viewport", content: "width=device-width, initial-scale=1.0" },
      ],

      // Canonical URL
      [
        "link",
        {
          rel: "canonical",
          href: "https://moinsen-dev.github.io/claude_code_vibe_coding_guide/",
        },
      ],

      // Favicon and App Icons
      [
        "link",
        {
          rel: "icon",
          type: "image/x-icon",
          href: "/claude_code_vibe_coding_guide/favicon.ico",
        },
      ],
      [
        "link",
        {
          rel: "apple-touch-icon",
          sizes: "180x180",
          href: "/claude_code_vibe_coding_guide/apple-touch-icon.png",
        },
      ],

      // JSON-LD Structured Data for SEO
      [
        "script",
        { type: "application/ld+json" },
        JSON.stringify({
          "@context": "https://schema.org",
          "@graph": [
            {
              "@type": "WebSite",
              "@id":
                "https://moinsen-dev.github.io/claude_code_vibe_coding_guide/#website",
              url: "https://moinsen-dev.github.io/claude_code_vibe_coding_guide/",
              name: "Vibe Coding Guide",
              description: "Complete guide to vibe coding with Claude Code",
              potentialAction: [
                {
                  "@type": "SearchAction",
                  target: {
                    "@type": "EntryPoint",
                    urlTemplate:
                      "https://moinsen-dev.github.io/claude_code_vibe_coding_guide/?q={search_term_string}",
                  },
                  "query-input": "required name=search_term_string",
                },
              ],
            },
            {
              "@type": "TechArticle",
              "@id":
                "https://moinsen-dev.github.io/claude_code_vibe_coding_guide/#article",
              isPartOf: {
                "@id":
                  "https://moinsen-dev.github.io/claude_code_vibe_coding_guide/#website",
              },
              author: {
                "@type": "Organization",
                name: "Vibe Coding Community",
                url: "https://moinsen-dev.github.io/claude_code_vibe_coding_guide/",
              },
              headline:
                "Vibe Coding Guide - Master AI-Assisted Development with Claude Code",
              description:
                "Complete guide to vibe coding with Claude Code. Learn prompt engineering, multi-agent patterns, and achieve 3-5x productivity gains.",
              keywords: [
                "Claude Code",
                "AI coding",
                "prompt engineering",
                "software development",
                "productivity",
                "automation",
              ],
              about: [
                {
                  "@type": "Thing",
                  name: "Artificial Intelligence",
                  sameAs:
                    "https://en.wikipedia.org/wiki/Artificial_intelligence",
                },
                {
                  "@type": "Thing",
                  name: "Software Development",
                  sameAs: "https://en.wikipedia.org/wiki/Software_development",
                },
                {
                  "@type": "Thing",
                  name: "Programming",
                  sameAs: "https://en.wikipedia.org/wiki/Computer_programming",
                },
              ],
              teaches: [
                "Prompt engineering techniques",
                "Multi-agent development patterns",
                "AI-assisted software development",
                "Claude Code best practices",
                "Enterprise AI implementation",
              ],
            },
            {
              "@type": "HowTo",
              name: "How to Master Vibe Coding with Claude Code",
              description:
                "Step-by-step guide to mastering AI-assisted development with Claude Code",
              image:
                "https://moinsen-dev.github.io/claude_code_vibe_coding_guide/vibe-coding-guide.png",
              totalTime: "PT30M",
              estimatedCost: {
                "@type": "MonetaryAmount",
                currency: "USD",
                value: "20",
              },
              supply: [
                {
                  "@type": "HowToSupply",
                  name: "Claude Code Subscription",
                },
                {
                  "@type": "HowToSupply",
                  name: "Development Environment",
                },
              ],
              tool: [
                {
                  "@type": "HowToTool",
                  name: "Claude Code CLI",
                },
                {
                  "@type": "HowToTool",
                  name: "VS Code or IDE",
                },
              ],
              step: [
                {
                  "@type": "HowToStep",
                  name: "Setup and Installation",
                  text: "Install Claude Code and configure your development environment",
                  url: "https://moinsen-dev.github.io/claude_code_vibe_coding_guide/getting-started",
                },
                {
                  "@type": "HowToStep",
                  name: "Learn Prompt Engineering",
                  text: "Master XML structuring and advanced prompting techniques",
                  url: "https://moinsen-dev.github.io/claude_code_vibe_coding_guide/techniques/prompt-engineering",
                },
                {
                  "@type": "HowToStep",
                  name: "Implement Workflows",
                  text: "Apply proven development workflow patterns",
                  url: "https://moinsen-dev.github.io/claude_code_vibe_coding_guide/best-practices/workflows",
                },
              ],
            },
          ],
        }),
      ],
    ],

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
