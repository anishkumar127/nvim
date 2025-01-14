-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local Util = require("lazyvim.util")
local Snacks = require("snacks")

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

keymap.set("n", "<M-h>", '<Cmd>lua require("tmux").resize_left()<CR>', { silent = true })
keymap.set("n", "<M-j>", '<Cmd>lua require("tmux").resize_bottom()<CR>', { silent = true })
keymap.set("n", "<M-k>", '<Cmd>lua require("tmux").resize_top()<CR>', { silent = true })
keymap.set("n", "<M-l>", '<Cmd>lua require("tmux").resize_right()<CR>', { silent = true })

local set_keymap = vim.api.nvim_set_keymap

-- Split windows
keymap.set("n", "ss", ":vsplit<Return>", opts)
keymap.set("n", "sv", ":split<Return>", opts)

-- Tabs
keymap.set("n", "te", ":tabedit", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- package-info keymaps
set_keymap(
  "n",
  "<leader>cpt",
  "<cmd>lua require('package-info').toggle()<cr>",
  { silent = true, noremap = true, desc = "Toggle" }
)
set_keymap(
  "n",
  "<leader>cpd",
  "<cmd>lua require('package-info').delete()<cr>",
  { silent = true, noremap = true, desc = "Delete package" }
)
set_keymap(
  "n",
  "<leader>cpu",
  "<cmd>lua require('package-info').update()<cr>",
  { silent = true, noremap = true, desc = "Update package" }
)
set_keymap(
  "n",
  "<leader>cpi",
  "<cmd>lua require('package-info').install()<cr>",
  { silent = true, noremap = true, desc = "Install package" }
)
set_keymap(
  "n",
  "<leader>cpc",
  "<cmd>lua require('package-info').change_version()<cr>",
  { silent = true, noremap = true, desc = "Change package version" }
)


-- 

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

