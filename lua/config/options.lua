-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.conceallevel = 0
opt.laststatus = 3
opt.cmdheight = 0

-- vim.g.root_spec = { "cwd" }
vim.g.omni_sql_no_default_maps = 1
-- vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.lazygit_config = true

--
-- Disable virtual text
vim.diagnostic.config({ virtual_text = false })
vim.opt.swapfile = false -- Disable swap file

-- stuff to ignore when tab completing
vim.opt.wildignore = {
  "*~",
  "*.o",
  "*.obj",
  "*.so",
  "*vim/backups*",
  "*.git/**",
  "**/.git/**",
  "*sass-cache*",
  "*DS_Store*",
  "vendor/rails/**",
  "vendor/cache/**",
  "*.gem",
  "*.pyc",
  "log/**",
  "*.gif",
  "*.zip",
  "*.bg2",
  "*.gz",
  "*.db",
  "**/node_modules/**",
  "**/bin/**",
  "**/thesaurus/**",
}

vim.o.spell = false
vim.lsp.set_log_level("off")


