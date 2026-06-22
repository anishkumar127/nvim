-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.g.autoformat = false

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local is_embedded = _G.Utils and _G.Utils.is_embedded or vim.g.vscode ~= nil

-- =============================================================================
-- Universal Autocmds (work in ALL environments)
-- =============================================================================

-- Highlight yanked text
autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = augroup("YankHighlight", {}),
  callback = function()
    if vim.hl and vim.hl.on_yank then
      vim.hl.on_yank()
    else
      vim.highlight.on_yank()
    end
  end,
})

-- Disable diagnostics ONLY inside node_modules buffers (standalone Neovim)
if not is_embedded then
  autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "**/node_modules/**", "node_modules", "/node_modules/*" },
    group = augroup("DisableEslintOnNodeModules", {}),
    desc = "Disable diagnostics for node_modules files",
    callback = function(args)
      vim.diagnostic.enable(false, { bufnr = args.buf })
    end,
  })
end

-- Detect filetype on files with no extension after saving
autocmd("BufWritePost", {
  pattern = "*",
  group = augroup("FileDetect", {}),
  desc = "Detect filetype on files with no extension after saving",
  callback = function()
    if vim.bo.filetype == "" then
      vim.cmd("filetype detect")
    end
  end,
})

-- =============================================================================
-- Neovim-only Autocmds (NOT for VS Code/Antigravity/Cursor/Windsurf)
-- =============================================================================
if not is_embedded then

  -- Disable auto-comment continuation on new lines
  autocmd("FileType", {
    pattern = "*",
    group = augroup("disable-new-line-comments", {}),
    desc = "Disable auto-comment on new lines",
    callback = function()
      vim.opt_local.formatoptions:remove("o")
      vim.opt_local.formatoptions:remove("r")
      vim.opt_local.formatoptions:remove("c")
    end,
  })

  -- Fix cursor highlight in light mode
  autocmd("ColorScheme", {
    group = augroup("cursor-highlight", {}),
    desc = "Clear cursor highlight in light backgrounds",
    callback = function()
      if vim.o.background == "light" then
        vim.cmd("highlight! clear Cursor")
      end
    end,
  })

end