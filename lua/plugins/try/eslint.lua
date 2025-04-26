-- lua/plugins/lsp/servers/eslint.lua
if true then return {} end
local Util = require("utils")
local desc = Util.plugin_keymap_desc("eslint")

return {
  -- wrap your settings under "eslint" so the LSP schema is satisfied
  settings = {
    eslint = {
      format = false,
      workingDirectories = { mode = "auto" },
    },
  },

  -- optionally debounce based on your env var
  flags = os.getenv("DEBOUNCE_ESLINT") and {
    allow_incremental_sync   = false,
    debounce_text_changes    = 1000,
  } or nil,

  -- register your <leader>ef mapping
  keys = {
    {
      "<leader>ef",
      "<cmd>EslintFixAll<CR>",
      desc("Fix all"),
    },
  },
}
