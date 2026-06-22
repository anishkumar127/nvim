-- Keymaps are automatically loaded on the VeryLazy event
local map = vim.keymap.set
local is_embedded = _G.Utils and _G.Utils.is_embedded

-- =============================================================================
-- Universal keymaps (Cursor + standalone Neovim)
-- =============================================================================

-- Better indenting — keep selection after indent
map("v", "<", "<gv", { desc = "Indent left, keep selection" })
map("v", ">", ">gv", { desc = "Indent right, keep selection" })

-- Clear highlights on search when pressing <Esc> in normal mode
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Duplicate line up/down
local dup_opts = { noremap = true, silent = true, desc = "Duplicate line/selection" }
map("n", "<Leader>k", "mzyyP`z", dup_opts)
map("n", "<Leader>j", "mzyyjp`z", dup_opts)
map("v", "<Leader>k", "yP", dup_opts)
map("v", "<Leader>j", "yp", dup_opts)

-- Paste without yanking replaced text
map("x", "<leader>pp", '"_dP', { desc = "Paste without yanking replaced text" })

-- jj exit insert — standalone only (Cursor uses compositeKeys in settings.json)
if not is_embedded then
  map("i", "jj", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })
end

-- Embedded maps are in config/vscode-keymaps.lua (loaded from init.lua)
if is_embedded then
  return
end

-- =============================================================================
-- Standalone Neovim / Neovide only
-- =============================================================================

map("n", "<leader>ss", ":split<Return><C-w>w", { desc = "Split window horizontally" })
map("n", "<leader>sv", ":vsplit<Return><C-w>w", { desc = "Split window vertically" })

map("n", "<C-p>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item" })
map("n", "<C-n>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })

map("n", "<M-Left>", "<C-w>5>", { desc = "Resize window (wider)" })
map("n", "<M-Right>", "<C-w>5<", { desc = "Resize window (narrower)" })
map("n", "<M-Down>", "<C-w>5-", { desc = "Resize window (shorter)" })
map("n", "<M-Up>", "<C-w>5+", { desc = "Resize window (taller)" })

map("n", "<leader>ci", vim.lsp.buf.hover, { desc = "Code info (hover)" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

if vim.diagnostic.jump then
  map("n", "<leader>cn", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Next diagnostic" })
  map("n", "<leader>cp", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Previous diagnostic" })
else
  map("n", "<leader>cn", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
  map("n", "<leader>cp", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
end

map("n", "<leader>wf", ":noautocmd w<CR>", { desc = "Save without formatting" })

map("n", "<leader>tA", function()
  require("tiny-code-action").code_action()
end, { noremap = true, silent = true, desc = "Tiny code action" })
