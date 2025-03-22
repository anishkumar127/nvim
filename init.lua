-- bootstrap lazy.nvim, LazyVim and your plugins
vim.lsp.set_log_level("off")
vim.env.CC = "clang"
vim.env.CXX = "clang++"
require("config.lazy")
-- require("lspconfig").clangd.setup({})

-- vim.o.shell = "C:\\Program Files\\Git\\bin\\bash.exe"
-- vim.o.shellcmdflag = "-s"
-- improve file handling on Windows:
--  vim.opt.shell = "powershell"
-- vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
-- vim.opt.shellxquote = ""

-- vim.opt.shell = "pwsh"
-- vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
-- vim.opt.shellquote = ""
-- vim.opt.shellxquote = ""
-- vim.opt.shell = [["C:\Program Files\PowerShell\7\pwsh.exe"]]
-- vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"


-- vim.cmd [[let &shell = '"C:\Program Files\Git\bin\bash.exe"']]
-- vim.cmd [[let &shellcmdflag = '-s']]
--- Disable backup and swap files for faster editing
-- vim.opt.backup = false
-- vim.opt.writebackup = false

-- Reduce Neovim's rendering overhead: -- Disable unused UI elements:
vim.opt.ruler = false -- Disable the ruler



vim.diagnostic.config({
  virtual_text = false,     -- Disable inline diagnostics
  update_in_insert = false, -- Don't update diagnostics while typing
})

-- For smoother scrolling, disable scroll offset or use a plugin
-- vim.opt.scrolloff = 0 -- Disable extra lines of context
-- ! comment out - 29 - 1 2025

-- Optimize Search
-- vim.opt.grepprg = "rg --vimgrep"
-- vim.opt.grepformat = "%f:%l:%c:%m"


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
autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '**/node_modules/**', 'node_modules', '/node_modules/*' },
  group = augroup('DisableEslintOnNodeModules', {}),
  callback = function()
    vim.diagnostic.disable(0)
  end,
})

-- autocmd('FileType', {
--   pattern = '*',
--   group = augroup('diable-new-line-comments', {}),
--   callback = function()
--     vim.opt_local.formatoptions:remove('o')
--     vim.opt_local.formatoptions:remove('r')
--     vim.opt_local.formatoptions:remove('c')
--   end,
-- })

-- TODO: Neovide settings
if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h11"   -- Change font as needed
  -- vim.g.neovide_transparency = 0.8
  -- vim.g.neovide_cursor_animation_length = 0.1
  -- vim.g.neovide_window_blurred = true
  -- vim.g.neovide_transparency = 0.9
  -- vim.g.neovide_scroll_animation_length = 0.3
  vim.g.neovide_refresh_rate = 120
  -- vim.g.neovide_refresh_rate_idle = 5
  -- vim.g.neovide_cursor_antialiasing = true
  -- vim.g.neovide_cursor_animate_in_insert_mode = true
  -- vim.g.neovide_background_color = "#000000" -- Pure black background

  ----------- new trying
  -- vim.g.guifont = font_family .. ':h' .. font_size
  vim.g.neovide_cursor_animation_length = 0.1
  vim.g.neovide_cursor_trail_size = 0.2
  vim.g.neovide_scroll_animation_length = 0.2
  vim.g.neovide_hide_mouse_when_typing = true

  -- vim.g.neovide_transparency = 0.75
  -- vim.g.neovide_opacity = 0.75
  -- vim.g.neovide_text_background_opacity = 1.0
  -- vim.g.neovide_normal_opacity = 0.75


  -- Disable mini.animate with neovide
  vim.g.minianimate_disable = true
end



-- vim.cmd.colorscheme("catppuccin")
