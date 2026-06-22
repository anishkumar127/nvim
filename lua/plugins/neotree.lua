-- Neo-tree file explorer
if _G.Utils and _G.Utils.is_embedded then return {} end

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  -- Fixed: was `lazy = false` alongside `cmd = 'Neotree'` which is contradictory.
  -- `cmd` already handles lazy loading, so `lazy = true` is correct.
  lazy = true,
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    window = {
      position = "right",
    },
  },
}
