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
        autoUseWorkspaceTsdk       = false,
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
  },
}
