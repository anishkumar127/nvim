if true then return {} end;
return {
  {
    "d7omdev/windows.nvim",
    event = "BufRead",
    enabled = false,
    dependencies = { "anuvyklack/middleclass", "anuvyklack/animation.nvim" },
    config = function()
      vim.o.winwidth = 100
      vim.o.winminwidth = 50
      vim.o.equalalways = false
      require("windows").setup({
        autowidth = {
          enable = false,
          winwidth = 5,
          filetype = {
            help = 2,
          },
        },
        autoheight = {
          enable = false,
          winheight = 5,
          filetype = {
            help = 1,
          },
        },
        autoboth = {
          enable = true,
        },
      })
    end,
  },
}