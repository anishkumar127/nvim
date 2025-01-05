return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "left",
      mappings = {
        ["Y"] = "none",
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        -- visible = true,
        hide_by_name = {
          ".git",
          ".DS_Store",
          "CHANGELOG.md"
        },
        always_show = {
          ".env",
        },
      },
    },
  },
}