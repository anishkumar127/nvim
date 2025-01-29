-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local map = vim.keymap.set
local keyset = vim.keymap.set
local opts = { noremap = true, silent = true }
local Util = require("lazyvim.util")
-- local Snacks = require("snacks")

-- keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true })
-- keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true })
-- keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true })
-- keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true })
-- keymap.set("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { silent = true })
-- keymap.set("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNavigateNext<CR>", { silent = true })

-- -- Borderless terminal
-- vim.keymap.set("n", "<C-/>", function()
--   Snacks.terminal.get(nil, { border = "none" })
-- end, { desc = "Term with border" })

-- -- Borderless lazygit
-- vim.keymap.set("n", "<leader>gg", function()
--   Snacks.terminal.get("lazygit", { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false, border = "none" })
-- end, { desc = "Lazygit (root dir)" })

keymap.del({ "n", "i", "v" }, "<A-j>")
keymap.del({ "n", "i", "v" }, "<A-k>")
keymap.del("n", "<C-Left>")
keymap.del("n", "<C-Down>")
keymap.del("n", "<C-Up>")
keymap.del("n", "<C-Right>")

-- keymap.set("n", "<M-h>", '<Cmd>lua require("tmux").resize_left()<CR>', { silent = true })
-- keymap.set("n", "<M-j>", '<Cmd>lua require("tmux").resize_bottom()<CR>', { silent = true })
-- keymap.set("n", "<M-k>", '<Cmd>lua require("tmux").resize_top()<CR>', { silent = true })
-- keymap.set("n", "<M-l>", '<Cmd>lua require("tmux").resize_right()<CR>', { silent = true })

local set_keymap = vim.api.nvim_set_keymap

-- Clear highlights on search when pressing <Esc> in normal mode
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Split windows
keymap.set('n', 'ss', ':vsplit<Return>', opts)
keymap.set('n', 'sv', ':split<Return>', opts)

-- IncRename
vim.keymap.set('n', '<leader>cr', function()
  return ':IncRename ' .. vim.fn.expand '<cword>'
end, { desc = 'LSP Rename', expr = true })

-- Better indenting
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')


-- Tabs
-- keymap.set("n", "te", ":tabedit", opts)
-- keymap.set("n", "<tab>", ":tabnext<Return>", opts)
-- keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

--- TODO: it it really working need to check it.



--

--- TODO: it it really working need to check it.
-- Tailwind Tools
map("n", "<leader>tt", "", { desc = "+Tailwind" })
map("n", "<leader>tts", "<cmd>TailwindSort<CR>", { desc = "Tailwind Sort" })
map("n", "<leader>ttS", "<cmd>TailwindSortSelection<CR>", { desc = "Tailwind Sort Selection" })
map("n", "<leader>ttc", "<cmd>TailwindConcealToggle<CR>", { desc = "Tailwind Conceal Toggle" })
map("n", "<leader>ttC", "<cmd>TailwindConcealEnable<CR>", { desc = "Tailwind Conceal Enable" })
map("n", "<leader>ttCd", "<cmd>TailwindConcealDisable<CR>", { desc = "Tailwind Conceal Disable" })
map("n", "<leader>ttco", "<cmd>TailwindColorToggle<CR>", { desc = "Tailwind Color Toggle" })
map("n", "<leader>ttcoe", "<cmd>TailwindColorEnable<CR>", { desc = "Tailwind Color Enable" })
map("n", "<leader>ttcod", "<cmd>TailwindColorDisable<CR>", { desc = "Tailwind Color Disable" })
map("n", "]tc", "<cmd>TailwindNextClass<CR>", { desc = "Tailwind Next Class" })
map("n", "[tc", "<cmd>TailwindPrevClass<CR>", { desc = "Tailwind Prev Class" })

--- TODO: it it really working need to check it.

-- Ts Import
map("n", "<leader>ti", "<cmd>Telescope import<CR>", { desc = "Import" })
-- map("n", "<leader>co", "<cmd>TSToolsOrganizeImports<cr>", { desc = "Sorts and removes unused imports" })
-- map("n", "<leader>cS", "<cmd>TSToolsSortImports<cr>", { desc = "Sorts imports" })
-- map("n", "<leader>cr", "<cmd>TSToolsRemoveUnusedImports<cr>", { desc = "Removes unused imports" })
-- map("n", "<leader>cru", "<cmd>TSToolsRemoveUnused<cr>", { desc = "Removes all unused statements" })
-- map("n", "<leader>cM", "<cmd>TSToolsAddMissingImports<cr>", { desc = "Add missing imports" })
-- map("n", "<leader>cFa", "<cmd>TSToolsFixAll<cr>", { desc = "Fixes all fixable errors" })
-- map("n", "<leader>cR", "<cmd>TSToolsRenameFile<cr>", { desc = "Rename file" })
-- map("n", "<leader>cFr", "<cmd>TSToolsFileReferences<cr>", { desc = "Find file references" })


-- TODO: need to read this cmd
-- Delete without copying to register in visual mode
map("v", "<Del>", '"_d', { noremap = true, silent = true })

-- Exit insert mode with 'jj' in insert mode
map("i", "jj", "<Esc>", { noremap = true, silent = true })

-- Exit with 'qq' in normal mode
map("n", "qq", ":q<CR>", { noremap = true, silent = true })

-- up down

map("n", "<C-A-k>", "yy[P", { noremap = true, silent = true, desc = "Duplicate line up" })
map("n", "<C-A-j>", "yy]p", { noremap = true, silent = true, desc = "Duplicate line down" })
map("v", "<C-A-k>", "yP", { noremap = true, silent = true, desc = "Duplicate selection up" })
map("v", "<C-A-j>", "y]p", { noremap = true, silent = true, desc = "Duplicate selection down" })

--- TODO: it it really working need to check it.
-- TODO: is below all really working or am i need these ?
-- Lspsaga keymaps
map("n", "<S-r>", "<cmd>Lspsaga hover_doc<CR>", { desc = "show hover doc" })
map("n", "<leader>ol", "<cmd>Lspsaga outline<CR>", { desc = "show outline" })
-- map("n", "<C-a>", "<cmd>Lspsaga code_action<CR>", { desc = "code action" })
map("n", "<C-c>d", "<cmd>Lspsaga peek_definition<CR>", { desc = "peek definition" })
map("n", "<C-c>t", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "peek type definition" })

-- don't know
map("n", "<S-A-j>", "<cmd>Treewalker Down<CR>", { noremap = true, desc = "Treewalker Down" })
map("n", "<S-A-k>", "<cmd>Treewalker Up<CR>", { noremap = true, desc = "Treewalker Up" })
map("n", "<S-A-h>", "<cmd>Treewalker Left<CR>", { noremap = true, desc = "Treewalker Left" })
map("n", "<S-A-l>", "<cmd>Treewalker Right<CR>", { noremap = true, desc = "Treewalker Right" })

-- maybe conflict

-- <Alt-Left> (<M-Left>): Resize the current window wider.
-- <Alt-Right> (<M-Right>): Resize the current window narrower.
-- <Alt-Down> (<M-Down>): Resize the current window shorter.
-- <Alt-Up> (<M-Up>): Resize the current window taller.
-- Split window
keyset('n', '<leader>ss', ':split<Return><C-w>w', { desc = 'Split window horizontally' }) -- Horizontal
keyset('n', '<leader>sv', ':vsplit<Return><C-w>w', { desc = 'Split window vertically' }) -- Vertical

-- Move between qf items
keyset('n', '<C-p>', '<cmd>cprev<CR>zz', { desc = 'Previous quickfix item' })
keyset('n', '<C-n>', '<cmd>cnext<CR>zz', { desc = 'Next quickfix item' })

-- Resize splits
keyset('n', '<M-Left>', '<C-w>5>', { desc = 'Resize window (left)' })
keyset('n', '<M-Right>', '<C-w>5<', { desc = 'Resize window (right)' })
keyset('n', '<M-Down>', '<C-w>5-', { desc = 'Resize window (down)' })
keyset('n', '<M-Up>', '<C-w>5+', { desc = 'Resize window (up)' })
