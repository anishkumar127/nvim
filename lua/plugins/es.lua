if true then return {} end

-- -- lua/plugins/lsp/servers/eslint.lua
-- local Util = require("utils")
-- local desc = Util.plugin_keymap_desc("eslint")

-- return {
--   -- Plugin to manage ESLint LSP server
--   "neovim/nvim-lspconfig",
--   ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" }, -- whatever you use
--   opts = {
--     servers = {
--       eslint = {
--         settings = {
--           eslint = {
--             format = false,
--             workingDirectories = { mode = "auto" },
--           },
--         },
--         flags = os.getenv("DEBOUNCE_ESLINT") and {
--           allow_incremental_sync = false,
--           debounce_text_changes = 1000,
--         } or nil,
--       },
--     },
--   },
--   keys = {
--     {
--       "<leader>ce",
--       "<cmd>EslintFixAll<CR>",
--       desc = desc("Fix all"),
--     },
--   },
-- }

-- lua/plugins/lsp/servers/eslint.lua
local Util = require("utils")
local desc = Util.plugin_keymap_desc("eslint")

return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers = opts.servers or {}
    opts.servers.eslint = {
      settings = {
        eslint = {
          format = false, -- disable formatting by eslint (use prettier separately)
          workingDirectories = { mode = "auto" },
        },
      },
      flags = os.getenv("DEBOUNCE_ESLINT") and {
        allow_incremental_sync = false,
        debounce_text_changes = 1000,
      } or nil,
      on_attach = function(client, bufnr)
        -- Optional: auto-fix eslint on save
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    }
  end,
  keys = {
    {
      "<leader>ce",
      "<cmd>EslintFixAll<CR>",
      desc = desc("Fix all ESLint issues"),
    },
  },
}