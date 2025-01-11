-- bootstrap lazy.nvim, LazyVim and your plugins
-- vim.diagnostic.config({ virtual_text = false })
vim.lsp.set_log_level("off")
--vim.env.CC = "cl"
-- vim.env.CC = "gcc"
vim.env.CC = "clang" -- Set Clang as the compiler for Tree-sitter
vim.env.CXX = "clang++" -- Set Clang++ for C++ parsing (if needed)

require("config.lazy")
-- vim.opt.shell = "C:\\Program Files\\Git\\bin\\bash.exe"
-- vim.opt.shellcmdflag = "-c"
-- vim.opt.shellquote = ""
-- vim.opt.shellxquote = ""

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

-- Optimize Search
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"

-- Optimize Statusline
-- vim.opt.laststatus = 2 -- Only show statusline in the last window
vim.opt.showcmd = false -- Disable command display
-- vim.opt.statusline = "%f %y %m %= %p%% %l:%c"


