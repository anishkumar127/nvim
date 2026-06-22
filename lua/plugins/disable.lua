-- Plugin disables and overrides
local is_embedded = _G.Utils and _G.Utils.is_embedded or vim.g.vscode ~= nil

if is_embedded then
  -- Cursor/VS Code: LazyVim's vscode extra whitelists plugins, but explicitly
  -- disable anything that fights native IDE completion, LSP, or UI.
  return {
    { "saghen/blink.cmp", enabled = false },
    { "mason-org/mason.nvim", enabled = false },
    { "mason-org/mason-lspconfig.nvim", enabled = false },
    { "monkoose/neocodeium", enabled = false },
    { "Fildo7525/pretty_hover", enabled = false },
    { "lewis6991/gitsigns.nvim", enabled = false },
    { "smjonas/inc-rename.nvim", enabled = false },
    { "akinsho/toggleterm.nvim", enabled = false },
    { "nvimdev/lspsaga.nvim", enabled = false },
    { "stevearc/conform.nvim", enabled = false },
    { "folke/trouble.nvim", enabled = false },
    { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  }
end

return {
  -- mini.statusline replaces lualine
  { "nvim-lualine/lualine.nvim", enabled = false },
  -- mini.lua configures surround; avoid double-setup from LazyVim extra
  { "echasnovski/mini.surround", enabled = false },
}
