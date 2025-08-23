# Project Setup

> **🚧 Work in Progress** - This page is being developed with comprehensive project setup guidance.

Learn how to structure your projects for optimal Claude Code integration and vibe coding flow.

## Essential Files

### CLAUDE.md - Your Project's Context Hub

Every vibe coding project starts with a well-crafted `CLAUDE.md`. This file is Claude's window into your project's soul - it should tell the story of your codebase, not just list facts.

#### Complete React Application Template

```markdown
# CLAUDE.md

This file provides guidance to Claude Code when working with code in this repository.

## Project Overview

**What it does**: Task management application with real-time collaboration and user authentication
**Target users**: Teams and individuals who need organized project tracking
**Key features**: 
- Real-time task updates via WebSocket connection
- User authentication with JWT tokens
- Drag-and-drop task organization
- Team collaboration with shared boards

## Development Commands

**Primary workflow:**
- `npm run dev` - Start Vite development server (http://localhost:5173)
- `npm test` - Run Jest tests with watch mode
- `npm run test:e2e` - Run Playwright end-to-end tests
- `npm run build` - Build for production
- `npm run preview` - Preview production build locally

**Quality assurance:**
- `npm run lint` - Run ESLint and Prettier
- `npm run type-check` - Run TypeScript compiler check
- `npm run test:coverage` - Generate test coverage report

## Architecture Notes

**Frontend Architecture:**
- **Framework**: React 18 with TypeScript
- **State Management**: Zustand for global state, React Query for server state
- **Styling**: Tailwind CSS with custom design tokens
- **Real-time**: WebSocket connection managed through custom hook
- **Authentication**: JWT stored in httpOnly cookies, handled by auth context

**Key Patterns:**
- Components follow compound pattern for complex UI (e.g., `TaskCard.Root`, `TaskCard.Header`)
- Custom hooks for all external integrations (`useWebSocket`, `useAuth`, `useLocalStorage`)
- Error boundaries wrap each major feature area
- All API calls go through centralized service layer in `/src/services/`

**File Organization:**
- `/src/components/` - Reusable UI components
- `/src/features/` - Feature-specific components and logic
- `/src/hooks/` - Custom React hooks
- `/src/services/` - API and external service integrations
- `/src/types/` - TypeScript type definitions
- `/src/utils/` - Pure utility functions

**Testing Strategy:**
- Unit tests for utilities and custom hooks
- Component tests using Testing Library
- Integration tests for user workflows
- E2E tests for critical user paths

## Development Workflow

**Starting new features:**
1. Create feature branch from `main`
2. Add types first in `/src/types/`
3. Implement service layer functions
4. Build components with tests
5. Integration testing before PR

**Code style preferences:**
- Prefer functional components with hooks
- Use TypeScript strictly (no `any` types)
- Components should be single responsibility
- Extract complex logic into custom hooks
- Keep components under 200 lines

## Common Patterns

**API Integration:**
All API calls use the service pattern:
```typescript
// services/taskService.ts
export const taskService = {
  async getTasks(): Promise<Task[]> { /* ... */ },
  async createTask(data: CreateTaskData): Promise<Task> { /* ... */ }
}
```

**Error Handling:**
Consistent error handling with custom Error classes:
```typescript
// utils/errors.ts
export class APIError extends Error {
  constructor(public status: number, message: string) {
    super(message)
  }
}
```

**Component Structure:**
```typescript
interface ComponentProps {
  // Props always explicitly typed
}

export const Component: React.FC<ComponentProps> = ({ prop }) => {
  // Custom hooks at top
  // Event handlers next
  // Early returns for loading/error states
  // Main JSX return
}
```
```

#### Node.js API Template

```markdown
# CLAUDE.md

## Project Overview

**What it does**: RESTful API for task management application with real-time features
**Architecture**: Express.js with TypeScript, PostgreSQL database, Redis for sessions/cache
**Key features**: 
- JWT-based authentication with refresh tokens
- Real-time WebSocket connections for live updates
- Role-based access control (RBAC)
- Comprehensive error handling and logging

## Development Commands

**Local development:**
- `npm run dev` - Start with nodemon and TypeScript compilation
- `npm run db:migrate` - Run Prisma database migrations
- `npm run db:seed` - Seed database with test data
- `npm run db:reset` - Reset database and reseed

**Testing:**
- `npm test` - Run Jest tests with watch mode
- `npm run test:integration` - Run integration tests against test DB
- `npm run test:coverage` - Generate coverage report

**Production:**
- `npm run build` - Compile TypeScript to JavaScript
- `npm start` - Start production server

## Architecture Notes

**Tech Stack:**
- **Runtime**: Node.js with Express.js
- **Language**: TypeScript with strict mode
- **Database**: PostgreSQL with Prisma ORM
- **Cache/Sessions**: Redis
- **Authentication**: JWT with refresh token rotation
- **Real-time**: Socket.io for WebSocket connections
- **Validation**: Zod for request/response validation

**Project Structure:**
- `/src/routes/` - Express route handlers
- `/src/controllers/` - Business logic controllers
- `/src/services/` - Business logic and external integrations
- `/src/middleware/` - Express middleware (auth, validation, error handling)
- `/src/models/` - Database models and types
- `/src/utils/` - Utility functions and helpers
- `/prisma/` - Database schema and migrations

**Security Patterns:**
- All endpoints require authentication except `/auth/login` and `/auth/register`
- Passwords hashed with bcrypt (12 rounds)
- JWT tokens expire after 15 minutes, refresh tokens after 7 days
- Rate limiting on authentication endpoints
- SQL injection prevention through Prisma ORM
- CORS configured for frontend domain only

**Error Handling:**
Centralized error handling with custom error classes:
```typescript
export class AppError extends Error {
  constructor(
    public statusCode: number,
    public message: string,
    public isOperational = true
  ) {
    super(message)
  }
}
```
```

#### Full-Stack Monorepo Template

```markdown
# CLAUDE.md

## Project Overview

**What it does**: Full-stack task management application with shared TypeScript types
**Architecture**: Monorepo with frontend (React), backend (Node.js), and shared packages
**Deployment**: Docker containers with Kubernetes orchestration

## Development Commands

**Root level:**
- `npm run dev` - Start all services in development mode
- `npm run build` - Build all packages
- `npm run test` - Run tests across all packages
- `npm run lint` - Lint all packages

**Frontend (apps/web):**
- `npm run dev -w apps/web` - Start React development server
- `npm run build -w apps/web` - Build React application

**Backend (apps/api):**
- `npm run dev -w apps/api` - Start API server with hot reload
- `npm run db:migrate -w apps/api` - Run database migrations

**Shared (packages/shared):**
- `npm run build -w packages/shared` - Build shared types and utilities

## Architecture Notes

**Monorepo Structure:**
```
├── apps/
│   ├── web/          # React frontend
│   └── api/          # Node.js backend
├── packages/
│   ├── shared/       # Shared TypeScript types
│   ├── ui/           # Shared React components
│   └── config/       # Shared configurations
├── docker/           # Docker configurations
└── k8s/             # Kubernetes manifests
```

**Shared Type System:**
All API requests/responses use shared types:
```typescript
// packages/shared/src/types/api.ts
export interface CreateTaskRequest {
  title: string
  description?: string
  dueDate?: string
}

export interface TaskResponse {
  id: string
  title: string
  // ... other fields
}
```

**Development Workflow:**
1. Changes to shared types automatically update both apps
2. Shared UI components are used across web and any future apps
3. All packages use shared ESLint and TypeScript configurations
4. Docker Compose for local development environment
```

### MCP Server Configuration

Create `.mcp.json` for enhanced capabilities:

```json
{
  "mcpServers": {
    "browsermcp": {
      "command": "npx",
      "args": ["@browsermcp/mcp@latest"]
    },
    "sequential-thinking": {
      "command": "npx", 
      "args": ["-y", "@modelcontextprotocol/server-sequential-thinking"]
    },
    "time": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-time"]
    }
  }
}
```

## Directory Structure Best Practices

The way you organize your code significantly impacts how well Claude can understand and work with your project. Here are proven structures that enhance vibe coding:

### React Application Structure

```
src/
├── components/          # Reusable UI components
│   ├── ui/             # Basic UI primitives (Button, Input, etc.)
│   ├── forms/          # Form-specific components
│   └── layout/         # Layout components (Header, Sidebar, etc.)
├── features/           # Feature-based organization
│   ├── auth/           # Authentication feature
│   │   ├── components/ # Auth-specific components
│   │   ├── hooks/      # Auth-specific hooks
│   │   ├── services/   # Auth API calls
│   │   └── types/      # Auth TypeScript types
│   └── dashboard/      # Dashboard feature
│       └── ...
├── hooks/              # Shared custom hooks
├── services/           # API and external service integrations
├── types/              # Global TypeScript types
├── utils/              # Pure utility functions
├── constants/          # Application constants
└── styles/             # Global styles and themes
```

**Why this works for vibe coding:**
- **Feature-based organization** allows Claude to understand related code together
- **Clear separation of concerns** makes it easy to explain what each directory does
- **Consistent naming** helps Claude predict where to find specific functionality

### Node.js API Structure

```
src/
├── routes/             # Express route definitions
│   ├── auth.ts
│   ├── users.ts
│   └── index.ts
├── controllers/        # Business logic controllers
│   ├── AuthController.ts
│   └── UserController.ts
├── services/           # Business logic services
│   ├── AuthService.ts
│   ├── EmailService.ts
│   └── UserService.ts
├── middleware/         # Express middleware
│   ├── auth.ts
│   ├── validation.ts
│   └── errorHandler.ts
├── models/             # Database models
│   ├── User.ts
│   └── Session.ts
├── types/              # TypeScript type definitions
│   ├── api.ts          # API request/response types
│   └── database.ts     # Database types
├── utils/              # Utility functions
├── config/             # Configuration files
│   ├── database.ts
│   └── environment.ts
└── tests/              # Test files mirroring src structure
    ├── controllers/
    ├── services/
    └── utils/
```

### Full-Stack Monorepo Structure

```
packages/
├── web/                # React frontend
│   ├── src/
│   ├── public/
│   └── package.json
├── api/                # Node.js backend  
│   ├── src/
│   ├── prisma/
│   └── package.json
├── shared/             # Shared TypeScript types
│   ├── src/
│   │   ├── types/      # API types, database types
│   │   └── utils/      # Shared utilities
│   └── package.json
├── ui/                 # Shared React components
│   ├── src/
│   │   ├── components/
│   │   └── styles/
│   └── package.json
└── config/             # Shared configurations
    ├── eslint/
    ├── typescript/
    └── jest/
```

**Monorepo advantages for vibe coding:**
- **Shared types** ensure consistent communication between frontend/backend
- **Atomic changes** across packages can be made in single commits
- **Consistent tooling** across all packages

### Configuration Files Organization

```
project-root/
├── .claude/            # Claude Code configuration
│   └── settings.local.json
├── .github/            # GitHub-specific files
│   ├── workflows/      # GitHub Actions
│   └── ISSUE_TEMPLATE/
├── .vscode/            # VS Code settings
│   ├── settings.json
│   └── extensions.json
├── config/             # Application configuration
│   ├── webpack.config.js
│   ├── jest.config.js
│   └── tsconfig.json
├── docs/               # Project documentation
│   ├── api.md
│   ├── deployment.md
│   └── architecture.md
├── scripts/            # Build and utility scripts
│   ├── build.sh
│   └── deploy.sh
├── .env.example        # Environment variables template
├── .gitignore
├── .mcp.json           # MCP server configuration
├── CLAUDE.md           # Claude Code project context
├── package.json
└── README.md
```

## Environment Setup

### Essential Development Tools

**Required Tools:**
```bash
# Node.js (use nvm for version management)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
nvm install --lts

# Git with proper configuration
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --global init.defaultBranch main

# Claude Code
npm install -g @anthropic/claude-code
```

**Recommended VS Code Extensions:**
```json
{
  "recommendations": [
    "ms-vscode.vscode-typescript-next",
    "bradlc.vscode-tailwindcss",
    "esbenp.prettier-vscode",
    "ms-vscode.vscode-eslint",
    "ms-playwright.playwright",
    "ms-vscode.vscode-json"
  ]
}
```

### Project Initialization Checklist

**For Every New Project:**

1. **Set up version control**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   ```

2. **Create CLAUDE.md** (use templates above)

3. **Configure MCP servers** in `.mcp.json`

4. **Set up development scripts** in `package.json`:
   ```json
   {
     "scripts": {
       "dev": "vite",
       "build": "vite build",
       "test": "vitest",
       "test:e2e": "playwright test",
       "lint": "eslint src --ext ts,tsx --report-unused-disable-directives",
       "format": "prettier --write src/**/*.{ts,tsx,json,md}",
       "type-check": "tsc --noEmit"
     }
   }
   ```

5. **Configure pre-commit hooks**:
   ```bash
   npx husky-init && npm install
   ```

6. **Set up environment variables**:
   ```bash
   cp .env.example .env
   # Edit .env with your values
   ```

### Environment Optimization for Vibe Coding

**Shell Configuration** (add to `.bashrc` or `.zshrc`):
```bash
# Claude Code aliases
alias cc="claude"
alias ccd="claude --debug"

# Git aliases that work well with Claude
alias gs="git status"
alias gd="git diff"
alias gl="git log --oneline -10"

# Development shortcuts
alias dev="npm run dev"
alias test="npm test"
alias build="npm run build"
```

**Git Configuration for Better Context**:
```bash
# Better git diff for Claude to read
git config --global diff.algorithm histogram

# More detailed commit template
git config --global commit.template ~/.git-commit-template
```

**Create `~/.git-commit-template`**:
```
# Type: Brief description (50 chars max)
#
# Longer explanation if needed (wrap at 72 chars)
#
# - What changed and why
# - Any breaking changes
# - Related issue numbers
#
# Types: feat, fix, docs, style, refactor, test, chore
```

### Team Environment Synchronization

**Shared Configuration Files:**

`.nvmrc`:
```
v18.17.0
```

`package.json` engines:
```json
{
  "engines": {
    "node": ">=18.17.0",
    "npm": ">=9.0.0"
  }
}
```

**Development Container** (`.devcontainer/devcontainer.json`):
```json
{
  "name": "Node.js Development",
  "image": "node:18",
  "features": {
    "ghcr.io/devcontainers/features/git:1": {}
  },
  "postCreateCommand": "npm install",
  "customizations": {
    "vscode": {
      "extensions": [
        "ms-vscode.vscode-typescript-next",
        "esbenp.prettier-vscode"
      ]
    }
  }
}
```

This setup ensures every team member has a consistent environment that works optimally with Claude Code.

## Related Topics

- [Communication Best Practices](/best-practices/communication)
- [Development Workflow](/best-practices/workflow)
- [Configuration Options](/best-practices/configuration)