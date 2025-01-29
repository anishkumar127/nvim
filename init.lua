-- bootstrap lazy.nvim, LazyVim and your plugins
vim.lsp.set_log_level("off")
require("config.lazy")

vim.o.shell = "C:\\Program Files\\Git\\bin\\bash.exe"
vim.o.shellcmdflag = "-s"
 -- improve file handling on Windows:
 vim.opt.shell = "powershell"
vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
vim.opt.shellxquote = ""

--- Disable backup and swap files for faster editing
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Reduce Neovim's rendering overhead: -- Disable unused UI elements:
vim.opt.ruler = false -- Disable the ruler
vim.opt.showmode = false -- Disable mode display (handled by statusline) 



vim.diagnostic.config({
  virtual_text = false, -- Disable inline diagnostics
  update_in_insert = false, -- Don't update diagnostics while typing
})

-- For smoother scrolling, disable scroll offset or use a plugin
-- vim.opt.scrolloff = 0 -- Disable extra lines of context
-- ! comment out - 29 - 1 2025

-- Optimize Search
-- vim.opt.grepprg = "rg --vimgrep"
-- vim.opt.grepformat = "%f:%l:%c:%m"

-- Optimize Statusline
-- vim.opt.laststatus = 2 -- Only show statusline in the last window
vim.opt.showcmd = false -- Disable command display
-- vim.opt.statusline = "%f %y %m %= %p%% %l:%c"
 
-- it's should be inside the autocmd file but for now keeping it here 

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight yanked text
-- autocmd('TextYankPost', {
--   desc = 'Highlight yanked text',
--   group = augroup('YankHighlight', {}),
--   callback = function()
--     vim.highlight.on_yank()
--   end,
-- })
-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup(
    'kickstart-highlight-yank',
    { clear = true }
  ),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Disable eslint on node_modules
autocmd({'BufNewFile', 'BufRead'}, {
  pattern = {'**/node_modules/**', 'node_modules', '/node_modules/*'},
  group = augroup('DisableEslintOnNodeModules', {}),
  callback = function()
    vim.diagnostic.disable(0)
  end,
})

autocmd('FileType', {
  pattern = '*',
  group = augroup('diable-new-line-comments', {}),
  callback = function()
    vim.opt_local.formatoptions:remove('o')
    vim.opt_local.formatoptions:remove('r')
    vim.opt_local.formatoptions:remove('c')
  end,
})
-- TODO: Neovide settings
if vim.g.neovide then
    vim.o.guifont = "JetBrainsMono Nerd Font:h12" -- Change font as needed
    -- vim.g.neovide_transparency = 0.8
    vim.g.neovide_cursor_animation_length = 0.1
end