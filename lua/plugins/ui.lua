return {
--   {
--     "catppuccin/nvim",
--     event = "BufRead",
--     name = "catppuccin",
--     opts = {
--       -- transparent_background = true,
--     },
--   },
  {
    "mvllow/modes.nvim",
    enabled = true,
    config = function()
      require("modes").setup({
        line_opacity = 0.15,
        set_cursorline = false,
        ignore_filetypes = { "NvimTree", "TelescopePrompt", "dashboard", "minifiles" },
      })
    end,
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000, -- needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup({
        options = {
          show_source = true,
          use_icons_from_diagnostic = true,
        },
      })
    end,
  },
}