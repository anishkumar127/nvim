-- bootstrap lazy.nvim, LazyVim and your plugins
-- vim.diagnostic.config({ virtual_text = false })
vim.lsp.set_log_level("off")

require("config.lazy")
-- vim.opt.shell = "C:\\Program Files\\Git\\bin\\bash.exe"
-- vim.opt.shellcmdflag = "-c"
-- vim.opt.shellquote = ""
-- vim.opt.shellxquote = ""

vim.o.shell = "C:\\Program Files\\Git\\bin\\bash.exe"
vim.o.shellcmdflag = "-s"