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

-- // BUG: not working with my current config
vim.o.background = "dark"
vim.o.termguicolors = true


-- You can either toggle it off/on with <leader>uS or disable it with  in your options.lua file (this will disable all animations) or just disable the specific snacks component with 
-- vim.g.snacks_animate = false
-- opt.scroll.enabled = false
-- vim.o.lazyredraw = true -- Optimize screen redrawing
 
vim.o.updatetime = 50 -- Lower the update time for better responsiveness


-- vim.opt.guicursor = 'a:block/,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor'
vim.opt.cursorline = false -- highlight the current line
vim.opt.list = false -- Hide characters on tabs and spaces
vim.opt.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor
vim.opt.wrap = false -- Display long lines as just one line
vim.opt.sidescrolloff = 8 -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
vim.opt.linebreak = true -- Wrap long lines at a character in 'breakat'
vim.opt.textwidth = 80 -- Maximum width of text that is being inserted
vim.opt.colorcolumn = '120' -- Highlight the 120th column
vim.cmd('set fo-=1') -- Don't break lines after a one-letter word

vim.opt.showtabline = 0 -- Always show tabs
vim.opt.tabstop = 2 -- Insert 2 spaces for a tab
vim.opt.softtabstop = 2 -- Number of spaces tabs count for while editing
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.smartindent = true -- Makes indenting smart

-- vim.opt.hlsearch = false -- Highlight on search
vim.opt.incsearch = true -- While typing a search command, show where the pattern matches
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Better search


vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.formatoptions = vim.o.formatoptions:gsub('cro', '') -- Avoid comments to continue on new lines
vim.opt.updatetime = 300 -- Faster completion
vim.opt.mouse = 'a' -- Enable mouse mode
vim.opt.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim
vim.opt.cmdheight = 1 -- More space in the neovim command line for displaying messages
vim.opt.breakindent = true -- Enable break indent
vim.opt.smartcase = true -- Override `'ignorecase'` if the search pattern contains upper case characters
vim.opt.wildignore:append {'*/node_modules/*'} -- Ignore when expanding wildcards, completing file or directory names

vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.laststatus = 3 -- Global statusline when on split

vim.opt.grepprg = 'rg --vimgrep' -- Use ripgrep for grepping
vim.opt.grepformat = '%f:%l:%c:%m' -- Set the grep format
vim.opt.inccommand = 'split' -- Show live preview of substitute commands
vim.opt.swapfile = false
vim.opt.backup = false

vim.wo.foldmethod = 'expr' -- Set foldmethod to expr
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.g.markdown_recommended_style = 0 -- Disable default markdown styles (see https://www.reddit.com/r/neovim/comments/z2lhyz/comment/ixjb7je)
vim.opt.fillchars = {
  eob = ' ', -- suppress ~ at EndOfBuffer
  fold = ' ', -- space character used for folding
  foldopen = '', -- Unfolded text
  foldsep = ' ', -- Open fold middle marker
  foldclose = '', -- Folded text
}


vim.filetype.add({
  extension = {
    ['http'] = 'http',
  },
})

vim.api.nvim_set_hl(0, 'Cursor', {bg = 'NONE'})