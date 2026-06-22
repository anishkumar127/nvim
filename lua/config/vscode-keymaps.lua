-- Keymaps for Cursor / VS Code embedded Neovim (vscode-neovim extension).
-- Loaded early from init.lua when vim.g.vscode is set.
--
-- NOTE: "jj" to exit insert mode CANNOT be a normal Neovim mapping here.
-- Configure it in Cursor settings.json via vscode-neovim.compositeKeys (see init.lua comment).

if not (_G.Utils and _G.Utils.is_embedded) then
  return
end

local map = vim.keymap.set
local vscode = require("vscode")

local function call(cmd, opts)
  return function()
    vscode.call(cmd, opts)
  end
end

local function setup()
  -- ===========================================================================
  -- LSP / diagnostics (leader c*)
  -- ===========================================================================
  map("n", "<leader>ci", call("editor.action.showHover"), { desc = "Hover docs" })
  map("n", "<leader>ca", call("editor.action.quickFix"), { desc = "Code action" })
  map("n", "<leader>cn", call("editor.action.marker.nextInFiles"), { desc = "Next diagnostic" })
  map("n", "<leader>cp", call("editor.action.marker.prevInFiles"), { desc = "Prev diagnostic" })
  map("n", "<leader>cd", call("editor.action.marker.this"), { desc = "Diagnostic under cursor" })
  map("n", "<leader>cr", call("editor.action.rename"), { desc = "Rename symbol" })
  map("n", "<leader>cf", call("editor.action.formatDocument"), { desc = "Format file" })
  map("n", "<leader>cs", call("workbench.action.gotoSymbol"), { desc = "Symbols in file" })
  map("n", "<leader>cS", call("workbench.action.showAllSymbols"), { desc = "Symbols in workspace" })
  map("n", "<leader>cj", call("editor.action.revealDefinition"), { desc = "Go to definition" })
  map("n", "<leader>ck", call("editor.action.goToTypeDefinition"), { desc = "Go to type definition" })
  map("n", "<leader>cR", call("editor.action.goToReferences"), { desc = "Find references" })
  map("n", "<leader>cI", call("editor.action.goToImplementation"), { desc = "Go to implementation" })
  map("n", "<leader>cD", call("editor.action.revealDeclaration"), { desc = "Go to declaration" })

  -- LazyVim-style single-key LSP (normal mode)
  map("n", "gd", call("editor.action.revealDefinition"), { desc = "Go to definition" })
  map("n", "gr", call("editor.action.goToReferences"), { desc = "References" })
  map("n", "gD", call("editor.action.revealDeclaration"), { desc = "Declaration" })
  map("n", "gi", call("editor.action.goToImplementation"), { desc = "Implementation" })
  map("n", "K", call("editor.action.showHover"), { desc = "Hover" })

  -- ===========================================================================
  -- Search / files (leader f*)
  -- ===========================================================================
  map("n", "<leader><space>", call("workbench.action.quickOpen"), { desc = "Find file" })
  map("n", "<leader>ff", call("workbench.action.quickOpen"), { desc = "Find file" })
  map("n", "<leader>fr", call("workbench.action.openRecent"), { desc = "Recent files" })
  map("n", "<leader>/", call("workbench.action.findInFiles"), { desc = "Find in files" })
  map("n", "<leader>fg", call("workbench.action.findInFiles"), { desc = "Grep workspace" })
  map("n", "<leader>fb", call("editor.action.toggleRenderWhitespace"), { desc = "Toggle whitespace" })
  map("n", "<leader>ss", call("workbench.action.gotoSymbol"), { desc = "Symbols in file" })
  map("n", "<leader>sS", call("workbench.action.showAllSymbols"), { desc = "Symbols in workspace" })

  -- ===========================================================================
  -- Windows / tabs / terminal
  -- ===========================================================================
  map("n", "<leader>ft", call("workbench.action.terminal.toggleTerminal"), { desc = "Toggle terminal" })
  map("n", "<leader>fT", call("workbench.action.terminal.toggleTerminal"), { desc = "Toggle terminal" })
  map("n", "<C-/>", call("workbench.action.terminal.toggleTerminal"), { desc = "Toggle terminal" })
  map("n", "<leader>wv", call("workbench.action.splitEditorRight"), { desc = "Split right" })
  map("n", "<leader>ws", call("workbench.action.splitEditorDown"), { desc = "Split down" })
  map("n", "<leader>wc", call("workbench.action.closeActiveEditor"), { desc = "Close editor" })
  map("n", "<leader>wo", call("workbench.action.closeOtherEditors"), { desc = "Close other editors" })
  map("n", "<S-h>", call("workbench.action.previousEditor"), { desc = "Prev editor tab" })
  map("n", "<S-l>", call("workbench.action.nextEditor"), { desc = "Next editor tab" })
  map("n", "<leader>bd", call("workbench.action.closeActiveEditor"), { desc = "Close buffer" })

  -- ===========================================================================
  -- Git / SCM (leader g*)
  -- ===========================================================================
  map("n", "<leader>gg", call("workbench.view.scm"), { desc = "Source control" })
  map("n", "<leader>gp", call("workbench.view.scm"), { desc = "Git panel" })
  map("n", "<leader>gs", call("git.stage"), { desc = "Git stage" })
  map("n", "<leader>gu", call("git.unstage"), { desc = "Git unstage" })
  map("n", "<leader>gc", call("git.commit"), { desc = "Git commit" })
  map("n", "<leader>gd", call("editor.action.dirtydiff.next"), { desc = "Next git change" })
  map("n", "<leader>gD", call("editor.action.dirtydiff.previous"), { desc = "Prev git change" })

  -- ===========================================================================
  -- Editing / buffers
  -- ===========================================================================
  map("n", "<leader>w", call("workbench.action.files.save"), { desc = "Save" })
  map("n", "<leader>wf", call("workbench.action.files.save"), { desc = "Save (no format)" })
  map("n", "<leader>q", call("workbench.action.closeActiveEditor"), { desc = "Close file" })
  map("n", "<leader>qq", call("workbench.action.closeAllEditors"), { desc = "Close all" })
  map("n", "<leader>fn", call("workbench.action.files.newUntitledFile"), { desc = "New file" })
  map("n", "<leader>u", call("undo"), { desc = "Undo" })
  map("n", "<leader>U", call("redo"), { desc = "Redo" })

  -- Problems / output
  map("n", "<leader>xx", call("workbench.actions.view.problems"), { desc = "Problems panel" })
  map("n", "<leader>xq", call("workbench.action.output.toggleOutput"), { desc = "Output panel" })

  -- Explorer
  map("n", "<leader>e", call("workbench.view.explorer"), { desc = "Explorer" })
  map("n", "<leader>E", call("workbench.view.explorer"), { desc = "Explorer" })
end

-- Run after LazyVim defaults so our maps win on conflicts
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimKeymapsDefaults",
  callback = setup,
})

-- Fallback if LazyVim event already fired
vim.defer_fn(setup, 0)
