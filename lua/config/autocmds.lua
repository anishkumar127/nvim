-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.g.autoformat = false

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- 1. Create an autocmd group just for these toggles
local group = vim.api.nvim_create_augroup("DisableDiagnosticsInsertMode", {})

-- 2. Disable diagnostics on InsertEnter
vim.api.nvim_create_autocmd("InsertEnter", {
  group = group,
  callback = function()
    vim.diagnostic.disable()
  end,
})

-- 3. Enable diagnostics on InsertLeave
vim.api.nvim_create_autocmd("InsertLeave", {
  group = group,
  callback = function()
    vim.diagnostic.enable()
  end,
})

-- Highlight yanked text
autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = augroup("YankHighlight", {}),
  callback = function()
      vim.highlight.on_yank()
  end,
})
-- Disable eslint on node_modules
autocmd({"BufNewFile", "BufRead"}, {
  pattern = {"**/node_modules/**", "node_modules", "/node_modules/*"},
  group = augroup("DisableEslintOnNodeModules", {}),
  callback = function()
      vim.diagnostic.enable(false)
  end,
})


autocmd("FileType", {
  pattern = "*",
  group = augroup("diable-new-line-comments", {}),
  callback = function()
      vim.opt_local.formatoptions:remove("o")
      vim.opt_local.formatoptions:remove("r")
      vim.opt_local.formatoptions:remove("c")
  end,
})



autocmd("ColorScheme", {
  group = augroup("cursor-highlight", {}),
  callback = function()
      if vim.o.background == "light" then
          vim.cmd("highlight! clear Cursor")
      end
  end,
})

autocmd("BufWritePost", {
  pattern = "*",
  group = augroup("FileDetect", {}),
  desc = "Detect filetype on files with on extension after saving the file",
  callback = function()
      if vim.bo.filetype == "" then
          vim.cmd("filetype detect")
      end
  end,
})


-- Remove trailing whitespace on save
autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd([[silent! %s/\s\+$//e]])
  end,
})


-- Auto save buffer on leave
-- autocmd("BufLeave", {
--   pattern = "*",
--   callback = function()
--     vim.cmd("silent! wa")
--   end,
-- })



  -- Automatically sort classes in a .tsx file on save
-- autocmd("BufWritePost", {
--   pattern = { "*.tsx", "*.vue" },
--   callback = function()
--     local clients = vim.lsp.get_clients({ name = "tailwindcss" })
--     if #clients > 0 then
--       local ok, lsp = pcall(require, "tailwind-tools.lsp")
--       if ok and lsp.sort_classes then
--         pcall(lsp.sort_classes, true)
--       end
--     end
--   end,
-- })