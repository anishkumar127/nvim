-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

vim.g.lazygit_config = true
vim.g.snacks_animate = false
opt.laststatus = 3

opt.clipboard = "unnamedplus"

-- Make cursor blink
-- opt.guicursor = {
--   "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50",
--   "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
--   "sm:block-blinkwait175-blinkoff150-blinkon175",
-- }

opt.linebreak = true
-- Set tab width
opt.expandtab = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2 
opt.autoindent = true

-- Disable highlighting if file is over 10 MB
vim.api.nvim_command('autocmd BufReadPost * if getfsize(expand("%:p")) > 10000 * 1024 | TSBufDisable highlight | endif')

vim.cmd([[cab Wq wq]])

-- Disable virtual text
vim.diagnostic.config({ virtual_text = false })

vim.cmd([[tnoremap <C-A-_> pwd\|wl-copy<CR><C-\><C-n>:cd <C-r>+<CR>]])


vim.opt.pumblend = 0 -- disable transparency in popup menu
vim.opt.swapfile = false -- Disable swap file


-- Wildmenu {{{
vim.opt.wildignorecase = true

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
-- }}}



-- Set fast matchparen timeouts - for performance issue.
-- https://vi.stackexchange.com/a/5318/12823
vim.g.matchparen_timeout = 2
vim.g.matchparen_insert_timeout = 2

-- just trying to disable it
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- Syntax off, spell off, foldenable off - performance
vim.opt.syntax = "off"
vim.o.foldenable = false
vim.o.spell = false
vim.lsp.set_log_level("off")

-- From time to time rm -rf ~/.cache/nvim ~/.local/share/nvim/ ~/.local/state/nvim