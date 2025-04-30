-- if true then return {} end ;
-- local Util = require("utils")
-- local desc = Util.plugin_keymap_desc("typescript")
-- local settings = {
--     updateImportsOnFileMove = { enabled = "always" },
--     format = {
--         enable = false,
--         insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
--         insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = false,
--     },
--     preferences = {
--         importModuleSpecifier = os.getenv("LSP_TS_IMPORT_MODULE_SPECIFIER_PROJECT_RELATIVE") and "project-relative"
--             or "auto",
--     },
--     inlayHints = {
--         parameterNames = { enabled = "literals" },
--         parameterTypes = { enabled = true },
--         variableTypes = { enabled = true },
--         propertyDeclarationTypes = { enabled = true },
--         functionLikeReturnTypes = { enabled = true },
--         enumMemberValues = { enabled = true },
--     },
-- }

-- return {
--   "jose-elias-alvarez/typescript.nvim",
--   ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
--   dependencies = { "neovim/nvim-lspconfig" },
--   config = function(_, opts)
--     -- the plugin will call lspconfig.tsserver.setup({ … })
--     require("typescript").setup({ server = opts })
--   end,
--   opts = {
--     -- these get merged into the same `opts` passed to tsserver
--     flags = { allow_incremental_sync = false },
--     settings = {
--         complete_function_calls = false,
--         vtsls = {
--             enableMoveToFileCodeAction = false,
--             autoUseWorkspaceTsdk = false,
--             experimental = {
--                 completion = {
--                     -- https://github.com/yioneko/vtsls/blob/main/packages/service/configuration.schema.json#L1259-L1271
--                     enableServerSideFuzzyMatch = false,
--                     entriesLimit = 3000,
--                 },
--             },
--         },


--       javascript = settings,  -- you can factor out your `settings` above if you like
--       typescript = settings,

--     },
--   },
--   keys = {
--     {
--       "<leader>to",
--       function()
--         vim.lsp.buf.code_action({
--           apply = true,
--           context = { only = { "source.organizeImports" }, diagnostics = {} },
--         })
--       end,
--       desc = desc("Organize imports"),
--     },
--     {
--       "<leader>ta",
--       function()
--         vim.lsp.buf.code_action({
--           apply = true,
--           context = { only = { "source.addMissingImports" }, diagnostics = {} },
--         })
--       end,
--       desc = desc("Add missing imports"),
--     },
--     {
--       "<leader>tr",
--       function()
--         vim.lsp.buf.code_action({
--           apply = true,
--           context = { only = { "source.removeUnused" }, diagnostics = {} },
--         })
--       end,
--       desc = desc("Remove unused imports"),
--     },
--     {
--       "<leader>tf",
--       function()
--         vim.lsp.buf.code_action({
--           apply = true,
--           context = { only = { "source.fixAll" }, diagnostics = {} },
--         })
--       end,
--       desc = desc("Fix all"),
--     },
--     {
--       "<leader>tt",
--       "<cmd>TypescriptSelectTypeScriptVersion<cr>",
--       desc = desc("Select TypeScript version"),
--     },
--   },
-- }


-- lua/plugins/typescript_and_eslint.lua
local Util = require("utils")
local desc = Util.plugin_keymap_desc("typescript")

-- shared JS/TS language-specific settings
local ts_settings = {
  updateImportsOnFileMove = { enabled = "always" },
  format = {
    enable = false,
    insertSpaceAfterOpeningAndBeforeClosingEmptyBraces       = false,
    insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces    = false,
  },
  preferences = {
    importModuleSpecifier =
      os.getenv("LSP_TS_IMPORT_MODULE_SPECIFIER_PROJECT_RELATIVE")
      and "project-relative"
      or "auto",
    -- importModuleSpecifierPreference = "relative", -- Simplify imports to relative paths
    -- importModuleSpecifierEnding     = "minimal",  -- Avoid extra file extensions
    -- disableSuggestions              = false,      -- Disable TypeScript LSP suggestions (use a dedicated completion engine like `nvim-cmp`)
    -- quoteStyle                      = "single",

  },
  inlayHints = {
    parameterNames            = { enabled = "literals" },
    parameterTypes            = { enabled = true },
    variableTypes             = { enabled = true },
    propertyDeclarationTypes  = { enabled = true },
    functionLikeReturnTypes   = { enabled = true },
    enumMemberValues          = { enabled = true },
  },
}

return {
  "jose-elias-alvarez/typescript.nvim",
  ft = {
    "javascript", "javascriptreact",
    "typescript", "typescriptreact",
    "vue", "svelte", "astro",
    "typescript.tsx", "javascript.jsx",
  },
  dependencies = { "neovim/nvim-lspconfig" },

  -- Start tsserver/vtsls *and* eslint in the same place
  config = function(_, opts)
    ---------------------------------------------------------------------------
    -- 1.  TypeScript / Vtsls via typescript.nvim
    ---------------------------------------------------------------------------
    require("typescript").setup({ server = opts })

    ---------------------------------------------------------------------------
    -- 2.  ESLint language-server
    ---------------------------------------------------------------------------
    require("lspconfig").eslint.setup({
      filetypes = {
        "javascript", "javascriptreact",
        "typescript", "typescriptreact",
        "vue", "svelte", "astro",
        "typescript.tsx", "javascript.jsx",
      },

      -- disable formatting if you use something else (e.g. prettier)
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
      end,

      settings = {
        -- enable code-actions
        codeAction        = { disableRuleComment = { enable = true } },
        codeActionOnSave  = { enable = true, mode = "all" },

        -- keep eslint-LS from formatting
        format            = false,

        -- misc
        nodePath          = "",      -- let the server resolve eslint
        packageManager    = "npm",   -- or "yarn" / "pnpm"
      },
    })
  end,

  ---------------------------------------------------------------------------
  -- Options passed straight into tsserver / vtsls
  ---------------------------------------------------------------------------
  opts = {
    flags = { allow_incremental_sync = false },
    settings = {
      complete_function_calls = false,
      vtsls = {
        enableMoveToFileCodeAction = false,
        autoUseWorkspaceTsdk       = true, -- previously was disabled this.
        experimental = {
          completion = {
            enableServerSideFuzzyMatch = false,
            entriesLimit              = 3000,
          },
        },
      },
      javascript = ts_settings,
      typescript = ts_settings,
    },
  },

  ---------------------------------------------------------------------------
  -- Useful keymaps
  ---------------------------------------------------------------------------
  keys = {
    -- new start
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
      desc = desc("Organize imports"),
    },
    {
      "<leader>ta",
      function()
        vim.lsp.buf.code_action({
          apply = true,
          context = { only = { "source.addMissingImports" }, diagnostics = {} },
        })
      end,
      desc = desc("Add missing imports"),
    },
    {
      "<leader>tr",
      function()
        vim.lsp.buf.code_action({
          apply = true,
          context = { only = { "source.removeUnused" }, diagnostics = {} },
        })
      end,
      desc = desc("Remove unused imports"),
    },
    {
      "<leader>tf",
      function()
        vim.lsp.buf.code_action({
          apply = true,
          context = { only = { "source.fixAll" }, diagnostics = {} },
        })
      end,
      desc = desc("Fix all"),
    },
    {
      "<leader>tt",
      "<cmd>TypescriptSelectTypeScriptVersion<cr>",
      desc = desc("Select TypeScript version"),
    },
    
     {
      "<leader>gdd",
      function()
        -----------------------------------------------------------------------
        -- 1. open the diagnostic float for the current line
        -----------------------------------------------------------------------
        local float_bufnr, float_winnr = vim.diagnostic.open_float(nil, {
          scope  = "line",
          border = "rounded",
          focus  = true, -- float takes focus so mappings work there
        })
        if not float_winnr then
          return
        end

        -----------------------------------------------------------------------
        -- helper: close float + clear temporary mappings
        -----------------------------------------------------------------------
        local function close_float()
          if vim.api.nvim_win_is_valid(float_winnr) then
            vim.api.nvim_win_close(float_winnr, true)
          end
          for _, key in ipairs({ "n", "N", "p", "<esc>" }) do
            pcall(vim.keymap.del, "n", key, { buffer = 0 })
          end
        end

        -----------------------------------------------------------------------
        -- jump helpers that also refresh the float
        -----------------------------------------------------------------------
        local function refresh_float()
          if vim.api.nvim_win_is_valid(float_winnr) then
            vim.api.nvim_win_close(float_winnr, true)
          end
          float_bufnr, float_winnr = vim.diagnostic.open_float(nil, {
            scope  = "line",
            border = "rounded",
            focus  = true,
          })
        end

        local function goto_next_diag()
          vim.diagnostic.goto_next({ wrap = false })
          refresh_float()
        end

        local function goto_prev_diag()
          vim.diagnostic.goto_prev({ wrap = false })
          refresh_float()
        end

        -----------------------------------------------------------------------
        -- 5. ephemeral keymaps valid only while the float is open
        -----------------------------------------------------------------------
        local opts = { buffer = 0, nowait = true, silent = true }
        vim.keymap.set("n", "n",   goto_next_diag, opts)
        vim.keymap.set("n", "N",   goto_prev_diag, opts)
        vim.keymap.set("n", "p",   goto_prev_diag, opts)
        vim.keymap.set("n", "<esc>", close_float,  opts)
      end,
      desc = "Sticky diagnostics float (next/prev with n/p, close with Esc)",
    },

  },
}
