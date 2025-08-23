# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a VitePress documentation site focused on Claude Code best practices and development workflows. The project provides comprehensive guides, examples, and proven patterns for effective AI-assisted development.

## Development Commands

- `npm run dev` - Start VitePress development server
- `npm run build` - Build documentation site for production
- `npm run preview` - Preview built site locally

## Architecture

The project uses VitePress for static site generation with the following structure:

- `/docs/` - Main documentation content (Markdown files)
  - `index.md` - Homepage with hero section and features
  - `getting-started.md` - Initial setup and configuration guide
  - `best-practices/` - Core practice guides and recommendations
  - `examples/` - Practical code examples and templates
  - `advanced/` - Advanced techniques and configurations
- `package.json` - Node.js project configuration with VitePress dependency
- `README.md` - Project overview and Claude Code best practices summary

## Content Guidelines

When working with documentation content:

- All content is in Markdown format optimized for VitePress
- Use frontmatter for page configuration and metadata
- Follow the established tone: practical, actionable guidance
- Include code examples and real-world scenarios
- Reference official Claude Code documentation where appropriate
- Focus on proven patterns rather than theoretical concepts