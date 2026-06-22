-- Inc-rename — LSP rename UI (standalone Neovim only)
if _G.Utils and _G.Utils.is_embedded then return {} end

return {
  "smjonas/inc-rename.nvim",
  cmd = "IncRename",
  config = true,
}
