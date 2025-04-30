-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local map = vim.keymap.set
local keyset = vim.keymap.set

-- -- Borderless terminal
-- vim.keymap.set("n", "<C-/>", function()
--   Snacks.terminal.get(nil, { border = "none" })
-- end, { desc = "Term with border" })

-- -- Borderless lazygit
-- vim.keymap.set("n", "<leader>gg", function()
--   Snacks.terminal.get("lazygit", { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false, border = "none" })
-- end, { desc = "Lazygit (root dir)" })

-- keymap.del({ "n", "i", "v" }, "<A-j>")
-- keymap.del({ "n", "i", "v" }, "<A-k>")
-- keymap.del("n", "<C-Left>")
-- keymap.del("n", "<C-Down>")
-- keymap.del("n", "<C-Up>")
-- keymap.del("n", "<C-Right>")

-- Clear highlights on search when pressing <Esc> in normal mode
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- IncRename
-- vim.keymap.set('n', '<leader>cr', function()
--   return ':IncRename ' .. vim.fn.expand '<cword>'
-- end, { desc = 'LSP Rename', expr = true })

-- Better indenting shit > left right move the indents
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')


-- Delete without copying to register in visual mode
-- map("v", "<Del>", '"_d', { noremap = true, silent = true })

-- Exit insert mode with 'jj' in insert mode
map("i", "jj", "<Esc>", { noremap = true, silent = true })

-- Exit with 'qq' in normal mode
-- map("n", "qq", ":q<CR>", { noremap = true, silent = true })

-- up down the line as a copy above or down.

local opts = { noremap = true, silent = true, desc = "Duplicate line/selection" }

-- Duplicate current line up (Normal mode)
vim.keymap.set("n", "<Leader>k", "mzyyP`z", opts)

-- Duplicate current line down (Normal mode)
vim.keymap.set("n", "<Leader>j", "mzyyjp`z", opts)

-- Duplicate selection up (Visual mode)
vim.keymap.set("v", "<Leader>k", "yP", opts)

-- Duplicate selection down (Visual mode)
vim.keymap.set("v", "<Leader>j", "yp", opts)


-- Split window
keyset('n', '<leader>ss', ':split<Return><C-w>w', { desc = 'Split window horizontally' }) -- Horizontal
keyset('n', '<leader>sv', ':vsplit<Return><C-w>w', { desc = 'Split window vertically' })  -- Vertical

-- Move between qf items
keyset('n', '<C-p>', '<cmd>cprev<CR>zz', { desc = 'Previous quickfix item' })
keyset('n', '<C-n>', '<cmd>cnext<CR>zz', { desc = 'Next quickfix item' })

-- Resize splits
keyset('n', '<M-Left>', '<C-w>5>', { desc = 'Resize window (left)' })
keyset('n', '<M-Right>', '<C-w>5<', { desc = 'Resize window (right)' })
keyset('n', '<M-Down>', '<C-w>5-', { desc = 'Resize window (down)' })
keyset('n', '<M-Up>', '<C-w>5+', { desc = 'Resize window (up)' })




------------------ LSP ------------------

vim.keymap.set("n", "<leader>ci", vim.lsp.buf.hover, { desc = "Code info" })
-- vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Code definition" })
-- vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, { desc = "Code references" })
-- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>cn", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>cp", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })

-- vim.keymap.set("v", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- -- In visual mode, remap `p` to paste without overwriting the default register
-- vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true, desc = "Visual paste without yank" })
