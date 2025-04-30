-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.g.autoformat = false


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

-- autocmd("FileType", {
--   pattern = "*",
--   group = augroup("diable-new-line-comments", {}),
--   callback = function()
--       vim.opt_local.formatoptions:remove("o")
--       vim.opt_local.formatoptions:remove("r")
--       vim.opt_local.formatoptions:remove("c")
--   end,
-- })



-- autocmd("ColorScheme", {
--   group = augroup("cursor-highlight", {}),
--   callback = function()
--       if vim.o.background == "light" then
--           vim.cmd("highlight! clear Cursor")
--       end
--   end,
-- })

-- autocmd("BufWritePost", {
--   pattern = "*",
--   group = augroup("FileDetect", {}),
--   desc = "Detect filetype on files with on extension after saving the file",
--   callback = function()
--       if vim.bo.filetype == "" then
--           vim.cmd("filetype detect")
--       end
--   end,
-- })


