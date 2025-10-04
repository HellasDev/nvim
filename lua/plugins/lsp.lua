-- ================================================================
-- LSP Configuration - Language Server Protocol setup
-- ================================================================
-- Ολοκληρωμένη διαμόρφωση LSP servers με Mason integration:
-- • Mason: Automatic installation και management των LSP servers
-- • Go: gopls με advanced features (inlay hints, code lenses, static analysis)
-- • golangci-lint-langserver για comprehensive Go linting
-- • Web development: TypeScript, HTML, CSS, JSON, ESLint
-- • Lua: lua_ls με Neovim-specific configuration
-- • Auto-installation όλων των απαραίτητων servers
-- • Enhanced capabilities για snippets και documentation
-- • Rounded borders για consistent UI styling
-- ================================================================

return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "golangci_lint_ls",
          "lua_ls",
          "jsonls",
          "html",
          "cssls",
          "ts_ls",
          "eslint",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = { "documentation", "detail", "additionalTextEdits" },
      }

      local on_attach = function(client, bufnr)
        if client.name == "lua_ls" then
          client.server_capabilities.documentFormattingProvider = false
        end
        if client.name == "ts_ls" then
          client.server_capabilities.documentFormattingProvider = false
        end
      end

      -- Configure gopls
      vim.lsp.config.gopls = {
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_markers = { "go.work", "go.mod", ".git" },
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          gopls = {
            gofumpt = true,
            codelenses = {
              gc_details = false,
              generate = true,
              regenerate_cgo = true,
              run_govulncheck = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            analyses = {
              nilness = true,
              unusedparams = true,
              unusedwrite = true,
              useany = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = false,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-server", "-node_modules" },
            semanticTokens = true,
          },
        },
      }

      -- Configure golangci_lint_ls
      vim.lsp.config.golangci_lint_ls = {
        cmd = { "golangci-lint-langserver" },
        filetypes = { "go", "gomod" },
        root_markers = { "go.work", "go.mod", ".git" },
        capabilities = capabilities,
        on_attach = on_attach,
      }

      -- Configure lua_ls
      vim.lsp.config.lua_ls = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      }

      -- Configure web servers
      vim.lsp.config.html = {
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html" },
        root_markers = { "package.json", ".git" },
        capabilities = capabilities,
        on_attach = on_attach,
      }

      vim.lsp.config.cssls = {
        cmd = { "vscode-css-language-server", "--stdio" },
        filetypes = { "css", "scss", "less" },
        root_markers = { "package.json", ".git" },
        capabilities = capabilities,
        on_attach = on_attach,
      }

      vim.lsp.config.jsonls = {
        cmd = { "vscode-json-language-server", "--stdio" },
        filetypes = { "json", "jsonc" },
        root_markers = { "package.json", ".git" },
        capabilities = capabilities,
        on_attach = on_attach,
      }

      -- Configure ts_ls
      vim.lsp.config.ts_ls = {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
        root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      }

      -- Configure eslint
      vim.lsp.config.eslint = {
        cmd = { "vscode-eslint-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue", "svelte", "astro" },
        root_markers = { ".eslintrc", ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc.json", "package.json", ".git" },
        capabilities = capabilities,
        on_attach = on_attach,
      }

      -- Enable all configured servers
      vim.lsp.enable({ "gopls", "golangci_lint_ls", "lua_ls", "html", "cssls", "jsonls", "ts_ls", "eslint" })
    end,
  },
}
