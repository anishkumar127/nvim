-- TypeScript / JavaScript LSP configuration
-- VS Code/Antigravity/Cursor/Windsurf have their own TS server — skip this entirely.
if _G.Utils and _G.Utils.is_embedded then return {} end

-- ============================================================================
-- TOGGLE THIS TO SWITCH BETWEEN `vtsls` AND `typescript-tools.nvim`
-- true = Use typescript-tools (blazing fast, lightweight, great for huge projects)
-- false = Use vtsls (standard VS Code typescript server ported to Neovim)
-- ============================================================================
local use_ts_tools = false

return {
  -- Option A: nvim-lspconfig (for vtsls)
  {
    "neovim/nvim-lspconfig",
    enabled = not use_ts_tools,
    dependencies = { "saghen/blink.cmp" },
    event = "VeryLazy",
    opts = {
      diagnostics = {
        virtual_text = {
          prefix = "",
        },
        update_in_insert = false,
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
        severity_sort = false,
        float = {
          border = "rounded",
          focusable = false,
          style = "minimal",
          source = "always",
        },
      },
      servers = {
        eslint = { enabled = false },
        tsserver = { enabled = false },
        ts_ls = { enabled = false },
        denols = { enabled = false },
        angularls = { enabled = false },
        vtsls = {
          capabilities = require("blink.cmp").get_lsp_capabilities(),
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
                completion = {
                  enableServerSideFuzzyMatch = false,
                },
              },
            },
            typescript = {
              tsserver = {
                maxTsServerMemory = 8192,
              },
              updateImportsOnFileMove = { enabled = "always" },
              inlayHints = {
                enumMemberValues = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                parameterNames = { enabled = false },
                parameterTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                variableTypes = { enabled = false },
              },
              format = {
                enable = false,
                insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
                insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = false,
              },
              preferences = {
                importModuleSpecifier = os.getenv("LSP_TS_IMPORT_MODULE_SPECIFIER_PROJECT_RELATIVE")
                    and "project-relative"
                  or "auto",
                importModuleSpecifierEnding = "minimal",
                disableSuggestions = false,
                quoteStyle = "single",
              },
            },
            javascript = {
              tsserver = { maxTsServerMemory = 4192 },
              updateImportsOnFileMove = { enabled = "always" },
            },
          },
          keys = {
            {
              "<leader>tR",
              function() vim.lsp.buf.execute_command({ command = "typescript.reloadProjects" }) end,
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
              desc = "Restart TS Server",
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
                local float_bufnr, float_winnr = vim.diagnostic.open_float(nil, {
                  scope = "line",
                  border = "rounded",
                  focus = true,
                })
                if not float_winnr then
                  return
                end

                local function close_float()
                  if vim.api.nvim_win_is_valid(float_winnr) then
                    vim.api.nvim_win_close(float_winnr, true)
                  end
                  pcall(vim.keymap.del, "n", "n", { buffer = 0 })
                  pcall(vim.keymap.del, "n", "p", { buffer = 0 })
                  pcall(vim.keymap.del, "n", "N", { buffer = 0 })
                  pcall(vim.keymap.del, "n", "<esc>", { buffer = 0 })
                end

                local function goto_next_diag()
                  if vim.diagnostic.jump then
                    vim.diagnostic.jump({ count = 1 })
                  else
                    vim.diagnostic.goto_next()
                  end
                  if vim.api.nvim_win_is_valid(float_winnr) then
                    vim.api.nvim_win_close(float_winnr, true)
                  end
                  float_bufnr, float_winnr = vim.diagnostic.open_float(nil, {
                    scope = "line",
                    border = "rounded",
                    focus = true,
                  })
                end

                local function goto_prev_diag()
                  if vim.diagnostic.jump then
                    vim.diagnostic.jump({ count = -1 })
                  else
                    vim.diagnostic.goto_prev()
                  end
                  if vim.api.nvim_win_is_valid(float_winnr) then
                    vim.api.nvim_win_close(float_winnr, true)
                  end
                  float_bufnr, float_winnr = vim.diagnostic.open_float(nil, {
                    scope = "line",
                    border = "rounded",
                    focus = true,
                  })
                end

                vim.keymap.set("n", "n", goto_next_diag, { buffer = 0, nowait = true, silent = true })
                vim.keymap.set("n", "N", goto_prev_diag, { buffer = 0, nowait = true, silent = true })
                vim.keymap.set("n", "p", goto_prev_diag, { buffer = 0, nowait = true, silent = true })
                vim.keymap.set("n", "<esc>", close_float, { buffer = 0, nowait = true, silent = true })
              end,
              desc = "Sticky diagnostics float (n/p to navigate, Esc to close)",
            },
          },
        },
      },
      setup = {
        tsserver = function()
          return true
        end,
        ts_ls = function()
          return true
        end,
        vtsls = function(_, opts)
          local on_attach = function(client, _)
            client.commands["_typescript.moveToFileRefactoring"] = function(command, _)
              ---@type string, string, lsp.Range
              local action, uri, range = unpack(command.arguments)

              local function move(newf)
                client.request("workspace/executeCommand", {
                  command = command.command,
                  arguments = { action, uri, range, newf },
                })
              end

              local fname = vim.uri_to_fname(uri)
              client.request("workspace/executeCommand", {
                command = "typescript.tsserverRequest",
                arguments = {
                  "getMoveToRefactoringFileSuggestions",
                  {
                    file = fname,
                    startLine = range.start.line + 1,
                    startOffset = range.start.character + 1,
                    endLine = range["end"].line + 1,
                    endOffset = range["end"].character + 1,
                  },
                },
              }, function(_, result)
                ---@type string[]
                local files = result.body.files
                table.insert(files, 1, "Enter new path...")
                vim.ui.select(files, {
                  prompt = "Select move destination:",
                  format_item = function(f)
                    return vim.fn.fnamemodify(f, ":~:.")
                  end,
                }, function(f)
                  if f and f:find("^Enter new path") then
                    vim.ui.input({
                      prompt = "Enter move destination:",
                      default = vim.fn.fnamemodify(fname, ":h") .. "/",
                      completion = "file",
                    }, function(newf)
                      return newf and move(newf)
                    end)
                  elseif f then
                    move(f)
                  end
                end)
              end)
            end
          end

          local name = "vtsls"
          vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
              local buffer = args.buf ---@type number
              local client = vim.lsp.get_client_by_id(args.data.client_id)
              if client and (not name or client.name == name) then
                return on_attach(client, buffer)
              end
            end,
          })
          -- Copy typescript settings to javascript
          opts.settings.javascript = vim.tbl_deep_extend(
            "force",
            {},
            opts.settings.typescript,
            opts.settings.javascript or {}
          )
        end,
      },
    },
  },

  -- Option B: typescript-tools.nvim (Blazing Fast TS Server Alternative)
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    enabled = use_ts_tools,
    opts = {
      capabilities = require("blink.cmp").get_lsp_capabilities(),
      settings = {
        separate_diagnostic_server = true,
        publish_diagnostic_on = "insert_leave",
        tsserver_logs = "off",
        tsserver_max_memory = 8192,
        code_lens = "off",
        disable_member_code_lens = true,
        jsx_close_tag = {
          enable = true,
          filetypes = { "javascriptreact", "typescriptreact" },
        },
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "none",
          includeCompletionsForModuleExports = true,
          quotePreference = "single",
        },
      },
      on_attach = function(client, bufnr)
        local wk = require("which-key")
        wk.add({
          { "<leader>t", group = "+typescript" },
          { "<leader>to", "<cmd>TSToolsOrganizeImports<cr>", desc = "Organize Imports", buffer = bufnr },
          { "<leader>ta", "<cmd>TSToolsAddMissingImports<cr>", desc = "Add Missing Imports", buffer = bufnr },
          { "<leader>tr", "<cmd>TSToolsRemoveUnusedImports<cr>", desc = "Remove Unused Imports", buffer = bufnr },
          { "<leader>ti", "<cmd>TSToolsSortImports<cr>", desc = "Sort Imports", buffer = bufnr },
          { "<leader>tf", "<cmd>TSToolsFixAll<cr>", desc = "Fix All", buffer = bufnr },
          { "<leader>gR", "<cmd>TSToolsFileReferences<cr>", desc = "File References", buffer = bufnr },
          { "<leader>tR", "<cmd>TSToolsRenameFile<cr>", desc = "Rename File", buffer = bufnr },
        })
      end,
    },
    config = function(_, opts)
      vim.diagnostic.config({
        virtual_text = { prefix = "" },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
      require("typescript-tools").setup(opts)
    end,
  },
}
