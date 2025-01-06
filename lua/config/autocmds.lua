-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local autocmd = vim.api.nvim_create_autocmd

-- Automatically sort classes in a .tsx file on save
autocmd("BufWritePost", {
  pattern = { "*.tsx" },
  callback = function()
    local clients = vim.lsp.get_clients()
    for _, client in ipairs(clients) do
      if client.name == "tailwindcss" then
        local lsp = require("tailwind-tools.lsp")
        lsp.sort_classes(true)
        break
      end
    end
  end,
})