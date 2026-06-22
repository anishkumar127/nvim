local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- =============================================================================
-- Plugin spec — each file has its own `is_embedded` guard, so we keep
-- the spec flat and in the EXACT same order as the original config.
-- =============================================================================
require("lazy").setup({
  spec = {
    -- Core LazyVim framework (auto-loads vscode extra when vim.g.vscode is set)
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- Custom plugins (each file guards itself for embedded environments)
    { import = "plugins.colorscheme" },
    { import = "plugins.editor" },
    { import = "plugins.ui" },
    { import = "plugins.old" },
    { import = "plugins.linters" },
    { import = "plugins.coding.inc-rename" },
    { import = "plugins.formatting.conform" },
    { import = "plugins.terminal.toggleterminal" },
    { import = "plugins.languages.typescript2" },
    { import = "plugins.languages.pretty_hover" },
    -- import/override with your plugins (top-level plugins/ directory)
    { import = "plugins" },
  },
  defaults = {
    lazy = true,
    version = false, -- always use the latest git commit
  },
  install = { colorscheme = { "rose-pine-moon" } },
  checker = { enabled = not vim.g.vscode, notify = false },
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
        -- Additional safe disabled plugins for faster startup
        "2html_plugin",
        "getscript",
        "getscriptPlugin",
        "logipat",
        "vimball",
        "vimballPlugin",
        "spellfile_plugin",
      },
    },
  },
})
