-- if true then return {} end
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      local Keys = require("lazyvim.plugins.lsp.keymaps").get()
      vim.list_extend(Keys, {
        { "K", false },
      })
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    enabled = true,
    config = function()
      require("lspsaga").setup({
        ui = {
          border = "single",
        },
        lightbulb = {
          enable = false,
          sign = false,
        },
        code_action = { extend_gitsigns = false, num_shortcut = true },
        diagnostic = {
          show_layout = "float",
          max_height = 0.8,
          max_width = 0.1,
          keys = {
            quit = { "q", "<ESC>" },
          },
        },
      })
    end,
  },

  ----------- adding new 
  {
    "davidosomething/format-ts-errors.nvim",
    event = "VeryLazy",
    config = function()
      require("format-ts-errors").setup({
        add_markdown = true,
        start_indent_level = 0,
      })
    end,
  },
}