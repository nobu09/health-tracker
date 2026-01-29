# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Setup & Running
```bash
bin/setup                        # Install dependencies & prepare database
bin/dev                          # Start Rails server
docker-compose up                # Run backend (port 3000) & frontend (port 5173)
```

### Backend (Rails)
```bash
bin/rails server                 # Start development server
bin/rails db:prepare             # Create/migrate database
bin/rails test                   # Run unit/integration tests
bin/rails test:system            # Run system tests (Capybara + Selenium)
bin/rails test test/models/user_test.rb              # Run single test file
bin/rails test test/models/user_test.rb:10           # Run single test at line
```

### Frontend (React)
```bash
cd frontend && npm install       # Install dependencies
npm run dev                      # Start Vite dev server
npm run build                    # Build for production
npm run lint                     # Run ESLint
```

### Quality & Security
```bash
bin/rubocop                      # Lint Ruby code
bin/brakeman                     # Security analysis
bin/bundler-audit                # Audit gems for vulnerabilities
bin/ci                           # Run full CI pipeline locally
```

## Architecture

### Tech Stack
- **Backend**: Rails 8.1, Ruby 4.0, SQLite3
- **API**: GraphQL-only (graphql-ruby with Dataloader)
- **Frontend**: React 19 + TypeScript + Vite + Tailwind CSS (in `/frontend`)
- **Background Jobs**: Solid Queue, Solid Cache, Solid Cable

### API Design
- Single `/graphql` endpoint (POST)
- GraphiQL available at `/graphiql` in development
- Relay-style object identification with GlobalID
- Dataloader for batch-loading (N+1 prevention)

### Project Structure
- `/app/graphql/` - GraphQL schema, types, mutations, resolvers
- `/frontend/` - Separate React SPA (communicates via GraphQL)
- `/config/ci.rb` - CI pipeline configuration

### Key Files
- `app/graphql/health_tracker_schema.rb` - GraphQL schema definition
- `app/graphql/types/query_type.rb` - Query types
- `app/graphql/types/mutation_type.rb` - Mutations
- `config/routes.rb` - Routes (minimal: GraphQL endpoint + health check)
