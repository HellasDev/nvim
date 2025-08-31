-- ================================================================
-- Go Templates - Αυτόματη δημιουργία Go project structure
-- ================================================================
-- Παρέχει εντολή για τη δημιουργία ενός ολοκληρωμένου Go project:
-- • :GoCreateProject - Δημιουργεί πλήρη δομή φακέλων (cmd, internal, pkg)
-- • Αυτόματη δημιουργία main.go, go.mod, Makefile, README.md, .gitignore
-- • Έτοιμο GitHub Actions workflow για CI/CD (testing, linting, building)
-- • Best-practice project layout για κλιμακούμενες εφαρμογές
-- • Keymap <leader>gnp για γρήγορη πρόσβαση
-- • User-friendly prompts για το όνομα του project
-- • Detailed README με οδηγίες για build, run, test, lint
-- ================================================================

return {
    -- Project scaffolding and templates
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local go_templates = {}
            
            -- Create Go project structure
            go_templates.create_go_project = function()
                local project_name = vim.fn.input("Project name: ")
                if project_name == "" then
                    return
                end
                
                local project_path = vim.fn.getcwd() .. "/" .. project_name
                
                -- Create directories
                local dirs = {
                    project_path,
                    project_path .. "/cmd/" .. project_name,
                    project_path .. "/internal",
                    project_path .. "/pkg",
                    project_path .. "/api",
                    project_path .. "/web/static",
                    project_path .. "/web/templates",
                    project_path .. "/configs",
                    project_path .. "/scripts",
                    project_path .. "/test",
                    project_path .. "/docs",
                    project_path .. "/.github/workflows",
                }
                
                for _, dir in ipairs(dirs) do
                    vim.fn.mkdir(dir, "p")
                end
                
                -- Create main.go
                local main_content = string.format([[
package main

import (
	"fmt"
	"log"
)

func main() {
	fmt.Println("Hello, %s!")
}
]], project_name)
                
                local main_file = io.open(project_path .. "/cmd/" .. project_name .. "/main.go", "w")
                if main_file then
                    main_file:write(main_content)
                    main_file:close()
                end
                
                -- Create go.mod
                local mod_content = string.format("module %s\n\ngo 1.21\n", project_name)
                local mod_file = io.open(project_path .. "/go.mod", "w")
                if mod_file then
                    mod_file:write(mod_content)
                    mod_file:close()
                end
                
                -- Create Makefile
                local makefile_content = string.format([[
.PHONY: build run test clean lint

# Build the application
build:
	go build -o bin/%s cmd/%s/main.go

# Run the application
run:
	go run cmd/%s/main.go

# Run tests
test:
	go test -v ./...

# Run tests with coverage
test-coverage:
	go test -v -coverprofile=coverage.out ./...
	go tool cover -html=coverage.out -o coverage.html

# Run benchmarks
benchmark:
	go test -bench=. -benchmem ./...

# Lint the code
lint:
	golangci-lint run

# Format the code
fmt:
	go fmt ./...
	goimports -w .

# Tidy dependencies
tidy:
	go mod tidy

# Clean build artifacts
clean:
	rm -rf bin/
	rm -f coverage.out coverage.html

# Install dependencies
deps:
	go mod download

# Generate code
generate:
	go generate ./...

# Build for production
build-prod:
	CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -o bin/%s-linux cmd/%s/main.go
	CGO_ENABLED=0 GOOS=windows go build -ldflags="-w -s" -o bin/%s-windows.exe cmd/%s/main.go
	CGO_ENABLED=0 GOOS=darwin go build -ldflags="-w -s" -o bin/%s-darwin cmd/%s/main.go
]], project_name, project_name, project_name, project_name, project_name, project_name, project_name, project_name, project_name)
                
                local makefile = io.open(project_path .. "/Makefile", "w")
                if makefile then
                    makefile:write(makefile_content)
                    makefile:close()
                end
                
                -- Create README.md
                local readme_content = string.format([[
# %s

## Description
A Go application built with modern best practices.

## Project Structure
```
%s/
├── cmd/%s/          # Application entrypoints
├── internal/        # Private application code
├── pkg/             # Library code
├── api/             # API definitions
├── web/             # Web assets
├── configs/         # Configuration files
├── scripts/         # Build and deployment scripts
├── test/            # Test files and test data
├── docs/            # Documentation
└── .github/         # GitHub workflows
```

## Getting Started

### Prerequisites
- Go 1.21 or later
- Make (optional, for using Makefile commands)

### Installation
```bash
git clone <repository-url>
cd %s
go mod tidy
```

### Running the Application
```bash
# Using Go
go run cmd/%s/main.go

# Using Make
make run
```

### Building
```bash
# Development build
make build

# Production build
make build-prod
```

### Testing
```bash
# Run tests
make test

# Run tests with coverage
make test-coverage

# Run benchmarks
make benchmark
```

### Development Tools
```bash
# Format code
make fmt

# Lint code
make lint

# Tidy dependencies
make tidy
```

## Contributing
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Run `make lint` and `make test`
6. Submit a pull request

## License
MIT License
]], project_name, project_name, project_name, project_name, project_name)
                
                local readme_file = io.open(project_path .. "/README.md", "w")
                if readme_file then
                    readme_file:write(readme_content)
                    readme_file:close()
                end
                
                -- Create .gitignore
                local gitignore_content = [[# Binaries for programs and plugins
*.exe
*.exe~
*.dll
*.so
*.dylib
bin/
dist/

# Test binary, built with `go test -c`
*.test

# Output of the go coverage tool
*.out
coverage.html

# Dependency directories
vendor/

# Go workspace file
go.work

# IDE files
.vscode/
.idea/
*.swp
*.swo
*~

# OS files
.DS_Store
Thumbs.db

# Application logs
*.log

# Configuration files with sensitive data
*.env
.env.local
.env.production

# Build artifacts
tmp/
]]
                
                local gitignore_file = io.open(project_path .. "/.gitignore", "w")
                if gitignore_file then
                    gitignore_file:write(gitignore_content)
                    gitignore_file:close()
                end
                
                -- Create GitHub workflow
                local workflow_content = string.format([[
name: CI

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Set up Go
      uses: actions/setup-go@v4
      with:
        go-version: '1.21'
    
    - name: Cache Go modules
      uses: actions/cache@v3
      with:
        path: ~/go/pkg/mod
        key: ${{ runner.os }}-go-${{ hashFiles('**/go.sum') }}
        restore-keys: |
          ${{ runner.os }}-go-
    
    - name: Install dependencies
      run: go mod download
    
    - name: Run tests
      run: go test -v -race -coverprofile=coverage.out ./...
    
    - name: Upload coverage to Codecov
      uses: codecov/codecov-action@v3
      with:
        file: ./coverage.out
    
    - name: Run golangci-lint
      uses: golangci/golangci-lint-action@v3
      with:
        version: latest
    
    - name: Build
      run: go build -v ./cmd/%s/
]], project_name)
                
                local workflow_file = io.open(project_path .. "/.github/workflows/ci.yml", "w")
                if workflow_file then
                    workflow_file:write(workflow_content)
                    workflow_file:close()
                end
                
                print("Go project '" .. project_name .. "' created successfully!")
                print("Run: cd " .. project_name .. " && nvim cmd/" .. project_name .. "/main.go")
            end
            
            -- Register command
            vim.api.nvim_create_user_command("GoCreateProject", go_templates.create_go_project, {
                desc = "Create a new Go project structure"
            })
            
            -- Add keymap
            vim.keymap.set("n", "<leader>gnp", go_templates.create_go_project, { desc = "🏗️ Δημιουργία νέου Go project" })
        end,
        ft = { "go" },
    },
}