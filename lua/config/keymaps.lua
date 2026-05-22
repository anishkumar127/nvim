-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- =============================================================================
-- Universal Keymaps (work in ALL environments including VS Code/Antigravity)
-- =============================================================================

-- Exit insert mode with 'jj'
map("i", "jj", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })

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

-- Split window
map("n", "<leader>ss", ":split<Return><C-w>w", { desc = "Split window horizontally" })
map("n", "<leader>sv", ":vsplit<Return><C-w>w", { desc = "Split window vertically" })

-- Move between quickfix items
map("n", "<C-p>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item" })
map("n", "<C-n>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })

-- Resize splits
map("n", "<M-Left>", "<C-w>5>", { desc = "Resize window (wider)" })
map("n", "<M-Right>", "<C-w>5<", { desc = "Resize window (narrower)" })
map("n", "<M-Down>", "<C-w>5-", { desc = "Resize window (shorter)" })
map("n", "<M-Up>", "<C-w>5+", { desc = "Resize window (taller)" })

-- ====================== LSP (works in embedded too!) ======================
map("n", "<leader>ci", vim.lsp.buf.hover, { desc = "Code info (hover)" })

-- Diagnostic navigation (Neovim 0.11+ compatible)
if vim.diagnostic.jump then
  map("n", "<leader>cn", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Next diagnostic" })
  map("n", "<leader>cp", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Previous diagnostic" })
else
  -- Fallback for older Neovim versions
  map("n", "<leader>cn", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
  map("n", "<leader>cp", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
end

-- Paste copied buffer without losing register
map("x", "<leader>pp", '"_dP', { desc = "Paste without yanking replaced text" })

-- Save without formatting
map("n", "<leader>wf", ":noautocmd w<CR>", { desc = "Save without formatting" })

-- =============================================================================
-- Plugin-dependent keymaps (ONLY in real Neovim — these plugins are disabled
-- in VS Code/Antigravity/Cursor/Windsurf)
-- =============================================================================
if not (_G.Utils and _G.Utils.is_embedded) then

  -- Tiny code action (plugin disabled in embedded envs)
  map("n", "<leader>tA", function()
    require("tiny-code-action").code_action()
  end, { noremap = true, silent = true, desc = "Tiny code action" })

end