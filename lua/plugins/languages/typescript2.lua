-- if true then return {} end
-- if vim.g.vscode then return end;
-- make whole thing better and fast speed 
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
    event = "VeryLazy", -- Load LSP on demand to improve startup time
    --- @class lspconfig
    opts = {
      -- flags = {
      --   allow_incremental_sync = true, -- send only diffs, not the whole buffer
      --   debounce_text_changes = 600,    -- wait 500 ms of idle before sending edits

      -- },
      -- Diagnostic settings
      diagnostics = {

        -- virtual_text = true, - no inline text
        virtual_text = {
          prefix = "",
        },
        update_in_insert = false,
        -- signs = true, -- show left gutter icons
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚",
            [vim.diagnostic.severity.WARN] = "󰀪",
            [vim.diagnostic.severity.INFO] = "󰋽",
            [vim.diagnostic.severity.HINT] = "󰌶",
          },
        },
        underline = {
          severity = {
            min = vim.diagnostic.severity.HINT,
          },
        },
        -- update_in_insert = false,
        severity_sort = false,
        float = {
          border = "rounded",
          focusable = false,
          style = "minimal",
          source = "always",
          
        },
      },
      -- inlay_hints = {
      --   enabled = false,
      -- },
      servers = {
        --- @deprecated -- tsserver renamed to ts_ls but not yet released, so keep this for now
        --- the proper approach is to check the nvim-lspconfig release version when it's released to determine the server name dynamically
        eslint = {
          enabled          = true,
          -- flags = {
          --   allow_incremental_sync = true,   -- send only diffs, not the whole buffer
          -- },
          -- debounce_text_changes = 600, -- wait 500 ms of idle before sending edits
          update_in_insert = false,
          capabilities     = require("blink.cmp").get_lsp_capabilities(),
        },
        vtsls = { -- TypeScript server configuration
          capabilities = require("blink.cmp").get_lsp_capabilities(),
          -- flags = {
          --   allow_incremental_sync = true,   -- send only diffs, not the whole buffer
          --   debounce_text_changes = 300, -- Increased debounce time for diagnostics
          -- },
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
          },
          settings = {
            complete_function_calls = true,
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                -- maxInlayHintLength = 30,
                completion = {
                  enableServerSideFuzzyMatch = true,
                  -- debounce_text_changes = 300, -- Increased debounce time for diagnostics
                  -- entriesLimit = 3000,
                  entriesLimit = 50,
                  includePackageJsonAutoImports = "off",
                  autoImportFileExcludePatterns = { "node_modules/*" },
                },
              },
            },
            typescript = {
              -- tsserver = {
              --   maxTsServerMemory = 8192, -- Increase memory limit (e.g., 8GB)
              -- },
              updateImportsOnFileMove = { enabled = "always" },

              inlayHints = {
                -- Disable all inlay hints
                enumMemberValues = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                parameterNames = { enabled = false },
                parameterTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                variableTypes = { enabled = false },

                -- parameterNames            = { enabled = "literals" },
                -- parameterTypes            = { enabled = true },
                -- variableTypes             = { enabled = true },
                -- propertyDeclarationTypes  = { enabled = true },
                -- functionLikeReturnTypes   = { enabled = true },
                -- enumMemberValues          = { enabled = true },
              },
              -- Additional settings you can disable for performance
              suggest = {
                -- todo: it's should be false i think
                autoImports = false,                -- Disable automatic import suggestions
                completeFunctionCalls = false,      -- Disable auto-completion of function arguments
                names = true,                      -- Disable name suggestions
                paths = false,                      -- Disable path suggestions
                includeCompletionsForModuleExports = false, -- Suggest exported members from modules
                includeCompletionsWithInsertText = true, -- Use insert text in completions (improves UX)
                includeAutomaticOptionalChainCompletions = false, -- Suggest `?.` when applicable
                classMemberSnippets = false,        -- Enable class member snippet completions
                objectLiteralMethodSnippets = true, -- Enable method snippets inside object literals
              },

              format = {
                enable = false,
                insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
                insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = false,

              },
              preferences = {
                -- importModuleSpecifierPreference = "relative", -- Simplify imports to relative paths
                importModuleSpecifier = os.getenv("LSP_TS_IMPORT_MODULE_SPECIFIER_PROJECT_RELATIVE")
                    and "project-relative"
                  or "auto",
                importModuleSpecifierEnding = "minimal", -- Avoid extra file extensions
                -- importModuleSpecifierEnding     = "minimal", -- Avoid extra file extensions
                disableSuggestions              = false, -- Disable TypeScript LSP suggestions (use a dedicated completion engine like `nvim-cmp`)
                quoteStyle                      = "single",
              },
            },
            javascript = { -- copy same settings to JS
              -- tsserver                = { maxTsServerMemory = 8192 },
              suggest                 = { autoImports = false, names = false, paths = false },
              experimental            = {
                completion = { enableServerSideFuzzyMatch = true, entriesLimit = 50 },
              },
              updateImportsOnFileMove = { enabled = "always" },
            },
            -- javascript = ts_settings,
            -- typescript = ts_settings,
          },
          keys = {

            --- new
            {
              "<leader>tR",
              function()
                vim.lsp.buf.execute_command({ command = "typescript.reloadProjects" })
              end,
              desc = "Reload TS Projects",
            },
            {
              "<leader>ct",
              function()
                vim.lsp.buf.execute_command({ command = "typescript.reloadProjects" })
              end,
              desc = "Reload TS Projects",
            },
            {
              "<leader>ti",
              function()
                vim.lsp.buf.execute_command({
                  command = "typescript.sortImports",
                  arguments = { vim.api.nvim_buf_get_name(0) },
                })
              end,
              desc = "Sort Imports (vtsls)",
            },

            -- new end
            {
              "<leader>to",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = { only = { "source.organizeImports" }, diagnostics = {} },
                })
              end,
              desc = "Organize imports",
            },
            {
              "<leader>ta",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = { only = { "source.addMissingImports" }, diagnostics = {} },
                })
              end,
              desc = "Add missing imports",
            },
            {
              "<leader>tr",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = { only = { "source.removeUnused" }, diagnostics = {} },
                })
              end,
              desc = "Remove unused imports",
            },
            {
              "<leader>tf",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = { only = { "source.fixAll" }, diagnostics = {} },
                })
              end,
              desc = "Fix all",
            },
            {
              "<leader>tt",
              "<cmd>TypescriptSelectTypeScriptVersion<cr>",
              desc = "Select TypeScript version",
            },

            ---  end
            {
              "gR",
              function()
                local params = {
                  command = "typescript.findAllFileReferences",
                  arguments = { vim.uri_from_bufnr(0) },
                }
                require("trouble").open({
                  mode = "lsp_command",
                  params = params,
                })
              end,
              desc = "File References",
            },
            {
              "<leader>ct",
              function()
                vim.lsp.buf.execute_command({ command = "typescript.restartTsServer" })
              end,
              desc = "Reload TS Projects",
            },
            {
              "<leader>co",
              function()
                vim.lsp.buf.execute_command({
                  command = "typescript.organizeImports",
                  arguments = { vim.api.nvim_buf_get_name(0) },
                })
              end,
              desc = "Organize Imports (vtsls)",
            },
            {
              "<leader>cO",
              function()
                vim.lsp.buf.execute_command({
                  command = "typescript.removeUnusedImports",
                  arguments = { vim.api.nvim_buf_get_name(0) },
                })
              end,
              desc = "Remove Unused Imports (vtsls)",
            },
            {
              "<leader>cI",
              function()
                vim.lsp.buf.execute_command({
                  command = "typescript.sortImports",
                  arguments = { vim.api.nvim_buf_get_name(0) },
                })
              end,
              desc = "Sort Imports (vtsls)",
            },
            {
              "<leader>gdd",
              function()
                -- 1. Open the diagnostic float for the current line
                local float_bufnr, float_winnr = vim.diagnostic.open_float(nil, {
                  scope = "line",
                  border = "rounded",
                  focus = true, -- Let the float take focus so we can map Esc, n, p, etc.
                })
                if not float_winnr then
                  return
                end

                -- 2. Helper function: close the float + clear these temporary mappings
                local function close_float()
                  if vim.api.nvim_win_is_valid(float_winnr) then
                    vim.api.nvim_win_close(float_winnr, true)
                  end
                  -- Remove our ephemeral keymaps
                  vim.keymap.del("n", "n", { buffer = 0 })
                  vim.keymap.del("n", "p", { buffer = 0 })
                  vim.keymap.del("n", "N", { buffer = 0 })
                  vim.keymap.del("n", "<esc>", { buffer = 0 })
                end

                -- 3. Jump to next diagnostic, refresh the float
                local function goto_next_diag()
                  vim.diagnostic.goto_next()
                  -- close + reopen float at the new position
                  if vim.api.nvim_win_is_valid(float_winnr) then
                    vim.api.nvim_win_close(float_winnr, true)
                  end
                  float_bufnr, float_winnr = vim.diagnostic.open_float(nil, {
                    scope = "line",
                    border = "rounded",
                    focus = true,
                  })
                end

                -- 4. Jump to previous diagnostic, refresh the float
                local function goto_prev_diag()
                  vim.diagnostic.goto_prev()
                  -- close + reopen float at the new position
                  if vim.api.nvim_win_is_valid(float_winnr) then
                    vim.api.nvim_win_close(float_winnr, true)
                  end
                  float_bufnr, float_winnr = vim.diagnostic.open_float(nil, {
                    scope = "line",
                    border = "rounded",
                    focus = true,
                  })
                end

                -- 5. Set up ephemeral keymaps *in this buffer* while the float is open
                vim.keymap.set("n", "n", goto_next_diag, { buffer = 0, nowait = true, silent = true })
                vim.keymap.set("n", "N", goto_prev_diag, { buffer = 0, nowait = true, silent = true })
                vim.keymap.set("n", "p", goto_prev_diag, { buffer = 0, nowait = true, silent = true })
                vim.keymap.set("n", "<esc>", close_float, { buffer = 0, nowait = true, silent = true })
              end,
              desc = "Sticky diagnostics float (next/prev with n/p, close with Esc)",
            },
          },
        },
      },
      setup = {
        --- @deprecated -- tsserver renamed to ts_ls but not yet released, so keep this for now
        --- the proper approach is to check the nvim-lspconfig release version when it's released to determine the server name dynamically
        tsserver = function()
          -- disable tsserver
          return true
        end,
        ts_ls = function()
          -- disable tsserver
          return true
        end,
      },
    },
  },


}
