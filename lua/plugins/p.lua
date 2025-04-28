
if true then return {} end
-- -- lua/plugins/lsp.lua
-- local util = require("lspconfig.util")

-- return {

--   -----------------------------------------------------------------------------
--   -- nvim-lspconfig – we add ONLY the eslint server here
--   -----------------------------------------------------------------------------
--   {
--     "neovim/nvim-lspconfig",
--     event = "VeryLazy",
--     ---@type lspconfig.options
--     opts = function(_, opts)
--       -- 1. make sure the table exists
--       opts.servers = opts.servers or {}

--       -- 2. declare eslint
--       opts.servers.eslint = {
--         -- only start if an ESLint config is present
--         root_dir = util.root_pattern(
--           ".eslintrc",
--           ".eslintrc.*",
--           "eslint.config.*",
--        ".eslintrc.json", 
--           "package.json"
--         ),

--         settings = {
--           format = { enable = true },                -- let eslint format
--           codeActionOnSave = { enable = true, mode = "allFixes" },
--           workingDirectory = { mode = "auto" },
--         },

--         -- optional: run :EslintFixAll *before* every save
--         on_attach = function(_, bufnr)
--           vim.api.nvim_create_autocmd("BufWritePre", {
--             buffer = bufnr,
--             callback = function() vim.cmd("EslintFixAll") end,
--           })
--         end,
--       }
--     end,
--   },

--   -----------------------------------------------------------------------------
--   -- Mason – ensure the language-server binary is present
--   -----------------------------------------------------------------------------
--   {
--     "williamboman/mason.nvim",
--     opts = function(_, opts)
--       opts.ensure_installed = opts.ensure_installed or {}
--       vim.list_extend(opts.ensure_installed, {
--         "eslint-lsp",      -- <-- this installs the server
--       })
--     end,
--   },
-- }


-- lua/plugins/eslint.lua
local util = require("lspconfig.util")

return {

  -----------------------------------------------------------------------------
  -- 1.  Tell lsp-config to start the eslint language-server
  -----------------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.servers = opts.servers or {}

      opts.servers.eslint = {
        --------------------------------------------------------------
        -- start only inside a project that actually uses ESLint
        --------------------------------------------------------------
        root_dir = util.root_pattern(
          ".eslintrc",
          ".eslintrc.*",
          "eslint.config.*",
          "package.json"
        ),

        --------------------------------------------------------------
        -- server-side settings
        --------------------------------------------------------------
        settings = {
          format            = { enable = true },
          codeActionOnSave  = { enable = true, mode = "allFixes" },
          experimental      = { useFlatConfig = true }, -- for ESLint ≥ 8.48
        },

        --------------------------------------------------------------
        -- on-save auto-fix (runs :EslintFixAll before each write)
        --------------------------------------------------------------
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer   = bufnr,
            callback = function() vim.cmd("EslintFixAll") end,
          })
        end,
      }
    end,
  },

  -----------------------------------------------------------------------------
  -- 2.  Make sure the binary is present (Mason)
  -----------------------------------------------------------------------------
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "eslint-lsp",   -- installs vscode-eslint-language-server
      })
    end,
  },

  -----------------------------------------------------------------------------
  -- 3.  (optional) Speedy formatting with eslint_d via conform.nvim
  -----------------------------------------------------------------------------
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        javascript         = { "eslint_d" },
        javascriptreact    = { "eslint_d" },
        typescript         = { "eslint_d" },
        typescriptreact    = { "eslint_d" },
      },

      -- only run if an ESLint config exists in the project
      format_on_save = function(bufnr)
        local root = util.root_pattern(
          ".eslintrc",
          ".eslintrc.*",
          "eslint.config.*",
          "package.json"
        )(vim.api.nvim_buf_get_name(bufnr))
        return root ~= nil
      end,
    },
  },
}