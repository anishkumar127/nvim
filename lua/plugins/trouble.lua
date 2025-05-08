return {
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      auto_close = true,
      max_items = 10,
    },
    cmd = "Trouble",
    keys = {
      { "<leader>td", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle trouble diagnostics" },
      { "<leader>tQ", "<cmd>Trouble qflist toggle<cr>", desc = "Toggle trouble QuickFixList" },
    },
  },
}