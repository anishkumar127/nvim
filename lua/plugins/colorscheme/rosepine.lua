-- Rose Pine colorscheme
if _G.Utils and _G.Utils.is_embedded then return {} end

return {
  {
    "rose-pine/neovim",
    priority = 1000,
    lazy = false,
    config = function()
      require("rose-pine").setup({
        variant = "moon",
        dark_variant = "moon",
        dim_inactive_windows = false,
        extend_background_behind_borders = false,

        enable = {
          terminal = true,
          legacy_highlights = false,
          migrations = true,
        },

        styles = {
          bold = true,
          italic = false,
          transparency = true,
        },

        groups = {
          border = "muted",
          link = "iris",
          panel = "surface",

          error = "love",
          hint = "iris",
          info = "foam",
          note = "pine",
          todo = "rose",
          warn = "gold",

          git_add = "foam",
          git_change = "rose",
          git_delete = "love",
          git_dirty = "rose",
          git_ignore = "muted",
          git_merge = "iris",
          git_rename = "pine",
          git_stage = "iris",
          git_text = "rose",
          git_untracked = "subtle",

          h1 = "iris",
          h2 = "foam",
          h3 = "rose",
          h4 = "gold",
          h5 = "pine",
          h6 = "foam",
        },

        highlight_groups = {
          NormalFloat = { bg = "none" },
        },
      })

      vim.cmd("colorscheme rose-pine-moon")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine-moon",
    },
  },
}
