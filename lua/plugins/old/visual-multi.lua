-- return {
--   "mg979/vim-visual-multi",
-- }


-- in your plugin spec, e.g. for lazy.nvim or packer.nvim:
return {
  "mg979/vim-visual-multi",
  init = function()
    -- turn off all built-ins so <C-n>/<C-p> do nothing:
    vim.g.VM_default_mappings = 0

    -- now map only what you need:
    vim.g.VM_maps = {
      ["Find Under"]         = "<C-]>",  -- was <C-n>
      ["Find Subword Under"] = "<C-[>",  -- was <C-p>

      -- (optional) re-enable arrow-key cursors if you like:
      ["Add Cursor Down"]    = "<C-Down>",
      ["Add Cursor Up"]      = "<C-Up>",
      -- add any others you actually use…
    }
  end,
}
