-- ToggleTerm — terminal management
if _G.Utils and _G.Utils.is_embedded then return {} end

return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({})

      local map = vim.keymap.set
      map({ "n", "t" }, "<leader>vt",
          "<cmd>ToggleTerm size=60 direction=vertical<cr>",
          { desc = "Vertical terminal" })

      map({ "n", "t" }, "<leader>ft",
          "<cmd>ToggleTerm direction=float<cr>",
          { desc = "Floating terminal" })
    end,
  },
}
