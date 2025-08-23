# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Claude Code starter template repository with minimal configuration. The repository contains only MCP (Model Context Protocol) server configuration and is intended as a foundation for new projects.

## MCP Configuration

The repository includes `.mcp.json` with three pre-configured MCP servers:

- **browsermcp**: Browser automation and web interaction capabilities
- **sequential-thinking**: Enhanced reasoning and problem-solving tools  
- **time**: Time zone conversion and current time utilities

These servers are available via `npx` and `uvx` package managers and provide additional tools for Claude Code sessions.

## Development Setup

Since this is a starter template, there are no build, test, or lint commands configured yet. Future development may require:

- Adding a `package.json` for Node.js projects
- Setting up build and test scripts
- Configuring linting and formatting tools
- Adding project-specific dependencies

The repository structure is intentionally minimal to serve as a clean starting point for various project types.