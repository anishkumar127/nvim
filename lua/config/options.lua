-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
local is_embedded = vim.g.vscode ~= nil

-- =============================================================================
-- Universal Options (work in ALL environments)
-- =============================================================================

-- Disable unused providers for faster startup
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Disable SQL completion default maps (prevents <C-c> hijacking)
vim.g.omni_sql_no_default_maps = 1
vim.g.lazygit_config = true

-- Wildignore — stuff to ignore when tab completing
opt.wildignore = {
  "*~", "*.o", "*.obj", "*.so",
  "*vim/backups*", "*.git/**", "**/.git/**",
  "*sass-cache*", "*DS_Store*",
  "vendor/rails/**", "vendor/cache/**",
  "*.gem", "*.pyc", "log/**",
  "*.gif", "*.zip", "*.bg2", "*.gz", "*.db",
  "**/node_modules/**", "**/bin/**", "**/thesaurus/**",
  "drizzle", "drizzle/**", "CHANGELOG.md",
}

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Indentation & Tabs
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

-- General
opt.scrolloff = 8
opt.linebreak = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.breakindent = true
opt.formatoptions = vim.o.formatoptions:gsub("cro1", "")

-- =============================================================================
-- Neovim-only Options (NOT for VS Code/Antigravity/Cursor/Windsurf)
-- =============================================================================
if not is_embedded then
  opt.showtabline = 0     -- Hide tab bar (LazyVim handles it)
  opt.cmdheight = 0       -- Hide cmdline unless needed
  opt.showmode = false    -- Statusline already shows mode
  opt.wrap = false        -- No wrapping

  -- Disable builtin plugins (also disabled via lazy.nvim rtp, but this is faster)
  vim.g.loaded_matchparen = 1
  vim.g.loaded_matchit = 1
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
end
