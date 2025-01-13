-- Disable noice.nvim, it's an awesome plugin and brings a great look and feel but it's been a source of amazing amount of bugs and lags for a long time that I was attributing to other plugins.
return {
  {
    "folke/noice.nvim",
    enabled = false,
    event = "VeryLazy",
    opts = {},
  },
}