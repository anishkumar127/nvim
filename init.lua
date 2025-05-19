-- bootstrap lazy.nvim, LazyVim and your plugins
vim.lsp.set_log_level("off")

vim.env.CC = "clang"
vim.env.CXX = "clang++"

vim.g.blink_enabled = true

-- vim.keymap.set("i", "<Tab>", function()
--   require("blink.cmp").show()
-- end, { silent = true, desc = "Open completion menu" })

vim.keymap.set("i", "<C-j>", function()
  require('blink.cmp').show()
end, { silent = true, desc = "Trigger Blink completion" })

_G.Utils = require("utils")

vim.g.clipboard = {
  name = "win32yank",
  copy = { ["+"] = "win32yank.exe -i --crlf", ["*"] = "win32yank.exe -i --crlf" },
  paste = { ["+"] = "win32yank.exe -o --lf", ["*"] = "win32yank.exe -o --lf" },
  cache_enabled = 0,
}

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- vim.g.mapleader = ","
-- vim.g.maplocalleader = "\\"
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
-- vim.opt.ruler = false -- Disable the ruler

-- Optimize Search
-- vim.opt.grepprg = "rg --vimgrep"
-- vim.opt.grepformat = "%f:%l:%c:%m"

-- TODO: Neovide settings
if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h11" -- Change font as needed
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
