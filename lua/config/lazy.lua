local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- =============================================================================
-- Build the plugin spec dynamically based on environment
-- =============================================================================
local is_embedded = _G.Utils and _G.Utils.is_embedded or vim.g.vscode ~= nil

local spec = {
  -- Core LazyVim framework (always loaded)
  { "LazyVim/LazyVim", import = "lazyvim.plugins" },
}

if not is_embedded then
  -- These plugins need a real Neovim UI (terminal or Neovide).
  -- They break, crash, or conflict inside VS Code/Antigravity/Cursor/Windsurf.
  local ui_plugins = {
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "plugins.colorscheme" },
    { import = "plugins.ui" },
    { import = "plugins.terminal.toggleterminal" },
    { import = "plugins.formatting.conform" },
    { import = "plugins.linters" },
  }
  for _, p in ipairs(ui_plugins) do
    spec[#spec + 1] = p
  end
end

-- These plugins work fine in all environments
local universal_plugins = {
  { import = "plugins.editor" },
  { import = "plugins.old" },
  { import = "plugins.coding.inc-rename" },
  { import = "plugins.languages.typescript2" },
  { import = "plugins.languages.pretty_hover" },
  -- import/override with your plugins (top-level plugins/ directory)
  { import = "plugins" },
}
for _, p in ipairs(universal_plugins) do
  spec[#spec + 1] = p
end

-- =============================================================================
-- Lazy.nvim setup
-- =============================================================================
require("lazy").setup({
  spec = spec,
  defaults = {
    lazy = false,
    version = false, -- always use the latest git commit
  },
  install = { colorscheme = { "rose-pine-moon" } },
  checker = { enabled = true, notify = false },
  performance = {
    cache = { enabled = true },
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        -- Additional disabled plugins for faster startup
        "2html_plugin",
        "getscript",
        "getscriptPlugin",
        "logipat",
        "vimball",
        "vimballPlugin",
        "rplugin",
        "rrhelper",
        "spellfile_plugin",
      },
    },
  },
})
