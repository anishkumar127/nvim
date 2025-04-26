
-- if true then return {} end
-- return {
--   {
--     "neovim/nvim-lspconfig",
--     config = function()
--       local my = require("custom.lsp")
--       -- start whichever servers you need
--     --   for _, s in ipairs({ "tsserver"  }) do
--     --     my.setup_server(s)
--     --   end
--     end,
--   },
-- }
-- lua/plugins/typescript.lua
return {

    -- ---------------------------------------------------------------------------
    -- -- 1. Disable the outdated helper plugin (it hard-codes tsserver).
    -- ---------------------------------------------------------------------------
    -- { "jose-elias-alvarez/typescript.nvim", enabled = false },
  
    -- ---------------------------------------------------------------------------
    -- -- 2. Make sure Mason knows to install the new server name `ts_ls`.
    -- --    (Skip this block if you don't use Mason.)
    -- ---------------------------------------------------------------------------
    -- {
    --   "williamboman/mason-lspconfig.nvim",
    --   opts = {
    --     ensure_installed = { "ts_ls" },
    --   },
    -- },
  
    ---------------------------------------------------------------------------
    -- 3. Start the TypeScript LSP with the new name.
    ---------------------------------------------------------------------------
    {
      "neovim/nvim-lspconfig",
      config = function()
        -- your custom LSP helper (init.lua you moved earlier)
        local my = require("custom.lsp")
        local U = require("utils")
        -- one-liner to spin up the server
        -- my.setup_server("ts_ls")
      end,
    },
  }
  