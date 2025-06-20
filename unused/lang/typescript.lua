-- if true then return {} end
-- if vim.g.vscode then return end;

return {
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy", -- Load LSP on demand to improve startup time
    --- @class lspconfig
    opts = {
      -- Diagnostic settings
      diagnostics = {
        -- virtual_text = false, -- no inline text
        signs = true,         -- show left gutter icons
        virtual_lines = true, -- show inline text
        
        underline = false,
        -- update_in_insert = false,
        severity_sort = false,
        -- float = {
        --   border = "rounded",
        -- },

         -- Show diagnostics in the sign column (left gutter)
        --  signs = {
        --   -- This can be just a boolean to enable/disable signs,
        --   -- or a table with detailed configuration per severity, e.g.:
        --   severity = {
        --     -- min = vim.diagnostic.severity.WARN, -- Only show for WARN or higher
        --     -- max = vim.diagnostic.severity.ERROR,
        --   },
        --   -- If you want custom symbols for each type, you can set them up like:
        --   -- Error = " ",
        --   -- Warn  = " ",
        --   -- Hint  = " ",
        --   -- Info  = " ",
        --   -- Or define them in your sign definitions.
        -- },
          --  -- Underline problematic code
          --  underline = {
          --   -- Alternatively, just "true" to apply to all severities:
          --   severity = {
          --     min = vim.diagnostic.severity.HINT,
          --   },
          -- },

                  -- Virtual text (inline text in the buffer)
        -- virtual_text = {
        --   -- Just "true" or "false" if you want to enable/disable
        --   --
        --   -- For more granular config:
        --   prefix = "●",        -- Could be "●", "▎", "x"
        --   spacing = 2,         -- Spaces between diagnostic and code
        --   source = "if_many",  -- Show source if there’s more than one diagnostic source
        --   severity = {
        --     min = vim.diagnostic.severity.HINT,
        --     -- max = vim.diagnostic.severity.ERROR,
        --   },
        -- },

                -- Floating window for diagnostics
                -- float = {
                --   show_header = true,
                --   source = "always",       -- Show diagnostic source in floating window
                --   border = "rounded",      -- Or "single", "double", "solid", etc.
                --   focusable = false,
                --   -- max_width = 80,
                --   -- max_height = 25,
                --   -- You can override styling or highlight groups here if needed.
                -- },
  
      },

      -- 2. Some sign icon customization (optional)
      --    If you prefer different icons, just change them here.
      -- setup_diagnostic_signs = function()
      --   local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      --   for type, icon in pairs(signs) do
      --     local hl = "DiagnosticSign" .. type
      --     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      --   end
      -- end,


      --  diagnostics = {
      --   virtual_text = false, -- Disable inline diagnostic messages
      -- },
      -- codelens = {
      --   enabled = false, -- Disable codelens for performance
      -- },
      -- inlay_hints = {
      --   enabled = false, -- Disable inlay_hints they have a performance cost,
      --   exclude = {
      --     "typescriptreact",
      --     "javascript",
      --     "javascriptreact",
      --     "javascript.jsx",
      --     "typescript",
      --     "typescript.tsx",
      --   },
      -- },
      servers = {
        --- @deprecated -- tsserver renamed to ts_ls but not yet released, so keep this for now
        --- the proper approach is to check the nvim-lspconfig release version when it's released to determine the server name dynamically
        tsserver = {
          enabled = false,
        },
        ts_ls = {
          enabled = false,
        },
        denols = {
          enabled = false,
        },
        eslint = {
          enabled = true,
          update_in_insert = false
        },
        angularls = {
          enabled = false,
        },
        vtsls = {                        -- TypeScript server configuration
          flags = {
            debounce_text_changes = 200, -- Increased debounce time for diagnostics
          },
          filetypes = {
            'javascript',
            'javascriptreact',
            'javascript.jsx',
            'typescript',
            'typescriptreact',
            'typescript.tsx',
          },
          settings = {
            complete_function_calls = true,
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                maxInlayHintLength = 30,
                completion = {
                  enableServerSideFuzzyMatch = true,
                  includePackageJsonAutoImports = 'off',
                  autoImportFileExcludePatterns = { 'node_modules/*' },

                },
              },
            },
            typescript = {
              updateImportsOnFileMove = { enabled = 'always' },

              inlayHints = {
                -- Disable all inlay hints
                enumMemberValues = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                parameterNames = { enabled = false },
                parameterTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                variableTypes = { enabled = false },

              },
              -- Additional settings you can disable for performance
              suggest = {
                -- todo: it's should be false i think
                autoImports = true,           -- Disable automatic import suggestions
                completeFunctionCalls = true, -- Disable auto-completion of function arguments
                names = true,                 -- Disable name suggestions
                paths = true,                 -- Disable path suggestions
              },
              preferences = {
                importModuleSpecifierPreference = "relative", -- Simplify imports to relative paths
                importModuleSpecifierEnding     = "minimal",  -- Avoid extra file extensions
                disableSuggestions              = false,      -- Disable TypeScript LSP suggestions (use a dedicated completion engine like `nvim-cmp`)
                quoteStyle                      = "single",


              },
            },
          },
          keys = {
             {
              'gR',
              function()
                local params = {
                  command = 'typescript.findAllFileReferences',
                  arguments = { vim.uri_from_bufnr(0) },
                }
                require("trouble").open({
                  mode = "lsp_command",
                  params = params,
                })
              end,
              desc = 'File References',
            },
            {
              "<leader>ct",
              function()
                vim.lsp.buf.execute_command({ command = "typescript.reloadProjects" })
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

            -- {
            --   "<leader>cM",
            --   function()
            --     vim.lsp.buf.execute_command({
            --       command = "typescript.AddMissingImports",
            --       arguments = { vim.api.nvim_buf_get_name(0) },
            --     })
            --   end,
            --   desc = "Add missing imports",
            --   silent = true,
            -- },
            {
              '<leader>gdd',
              function()
                -- 1. Open the diagnostic float for the current line
                local float_bufnr, float_winnr = vim.diagnostic.open_float(nil, {
                  scope = 'line',
                  border = 'rounded',
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
                  vim.keymap.del('n', 'n', { buffer = 0 })
                  vim.keymap.del('n', 'p', { buffer = 0 })
                  vim.keymap.del('n', 'N', { buffer = 0 })
                  vim.keymap.del('n', '<esc>', { buffer = 0 })
                end

                -- 3. Jump to next diagnostic, refresh the float
                local function goto_next_diag()
                  vim.diagnostic.goto_next()
                  -- close + reopen float at the new position
                  if vim.api.nvim_win_is_valid(float_winnr) then
                    vim.api.nvim_win_close(float_winnr, true)
                  end
                  float_bufnr, float_winnr = vim.diagnostic.open_float(nil, {
                    scope = 'line',
                    border = 'rounded',
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
                    scope = 'line',
                    border = 'rounded',
                    focus = true,
                  })
                end

                -- 5. Set up ephemeral keymaps *in this buffer* while the float is open
                vim.keymap.set('n', 'n', goto_next_diag, { buffer = 0, nowait = true, silent = true })
                vim.keymap.set('n', 'N', goto_prev_diag, { buffer = 0, nowait = true, silent = true })
                vim.keymap.set('n', 'p', goto_prev_diag, { buffer = 0, nowait = true, silent = true })
                vim.keymap.set('n', '<esc>', close_float, { buffer = 0, nowait = true, silent = true })
              end,
              desc = 'Sticky diagnostics float (next/prev with n/p, close with Esc)',
            },
          },
        },
        -- lua_ls = {
        --   settings = {
        --     Lua = {
        --       workspace = {
        --         checkThirdParty = false,
        --         library = nvim_runtime_file,
        --         -- library = vim.api.nvim_get_runtime_file("", true), -- Runtime files

        --       },
        --       completion = {
        --         callSnippet = "Replace",
        --       },
        --       runtime = {
        --         version = "LuaJIT",
        --       },
        --       hint = {
        --         enable = true,
        --         setType = true,
        --       },
        --       diagnostics = {
        --         globals = { "vim" }, -- Recognize `vim` global
        --       },
        --       telemetry = {
        --         enable = false, -- Disable telemetry
        --       },
        --     },
        --   },
        -- },

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
        vtsls = function(_, opts)
          local on_attach = function(client, _)
            client.commands['_typescript.moveToFileRefactoring'] = function(
                command,
                _
            )
              ---@type string, string, lsp.Range
              local action, uri, range = unpack(command.arguments)

              local function move(newf)
                client.request('workspace/executeCommand', {
                  command = command.command,
                  arguments = { action, uri, range, newf },
                })
              end

              local fname = vim.uri_to_fname(uri)
              client.request('workspace/executeCommand', {
                command = 'typescript.tsserverRequest',
                arguments = {
                  'getMoveToRefactoringFileSuggestions',
                  {
                    file = fname,
                    startLine = range.start.line + 1,
                    startOffset = range.start.character + 1,
                    endLine = range['end'].line + 1,
                    endOffset = range['end'].character + 1,
                  },
                },
              }, function(_, result)
                ---@type string[]
                local files = result.body.files
                table.insert(files, 1, 'Enter new path...')
                vim.ui.select(files, {
                  prompt = 'Select move destination:',
                  format_item = function(f)
                    return vim.fn.fnamemodify(f, ':~:.')
                  end,
                }, function(f)
                  if f and f:find '^Enter new path' then
                    vim.ui.input({
                      prompt = 'Enter move destination:',
                      default = vim.fn.fnamemodify(fname, ':h') .. '/',
                      completion = 'file',
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
          local name = 'vtsls'
          vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
              local buffer = args.buf ---@type number
              local client = vim.lsp.get_client_by_id(args.data.client_id)
              if client and (not name or client.name == name) then
                return on_attach(client, buffer)
              end
            end,
          })
          -- copy typescript settings to javascript
          opts.settings.javascript = vim.tbl_deep_extend(
            'force',
            {},
            opts.settings.typescript,
            opts.settings.javascript or {}
          )
          
        end,
      },
    },
  },

  -- {
  --   'mfussenegger/nvim-dap',
  --   optional = true,
  --   dependencies = {
  --     {
  --       'williamboman/mason.nvim',
  --       opts = function(_, opts)
  --         opts.ensure_installed = opts.ensure_installed or {}
  --         table.insert(opts.ensure_installed, 'js-debug-adapter')
  --       end,
  --     },
  --   },
  --   opts = function()
  --     local dap = require 'dap'
  --     if not dap.adapters['pwa-node'] then
  --       require('dap').adapters['pwa-node'] = {
  --         type = 'server',
  --         host = 'localhost',
  --         port = '${port}',
  --         executable = {
  --           command = 'node',
  --           args = {
  --             vim.env.MASON
  --             .. '/packages/'
  --             .. 'js-debug-adapter'
  --             .. '/js-debug/src/dapDebugServer.js',
  --             '${port}',
  --           },
  --         },
  --       }
  --     end
  --     if not dap.adapters['node'] then
  --       dap.adapters['node'] = function(cb, config)
  --         if config.type == 'node' then
  --           config.type = 'pwa-node'
  --         end
  --         local nativeAdapter = dap.adapters['pwa-node']
  --         if type(nativeAdapter) == 'function' then
  --           nativeAdapter(cb, config)
  --         else
  --           cb(nativeAdapter)
  --         end
  --       end
  --     end

  --     local js_filetypes =
  --     { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' }

  --     local vscode = require 'dap.ext.vscode'
  --     vscode.type_to_filetypes['node'] = js_filetypes
  --     vscode.type_to_filetypes['pwa-node'] = js_filetypes

  --     for _, language in ipairs(js_filetypes) do
  --       if not dap.configurations[language] then
  --         dap.configurations[language] = {
  --           {
  --             type = 'pwa-node',
  --             request = 'launch',
  --             name = 'Launch file',
  --             program = '${file}',
  --             cwd = '${workspaceFolder}',
  --           },
  --           {
  --             type = 'pwa-node',
  --             request = 'attach',
  --             name = 'Attach',
  --             processId = require('dap.utils').pick_process,
  --             cwd = '${workspaceFolder}',
  --           },
  --         }
  --       end
  --     end
  --   end,
  -- },
}
