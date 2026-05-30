-- Conform.nvim — formatting with prettierd
if _G.Utils and _G.Utils.is_embedded then return {} end

return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },

    opts = {
      formatters_by_ft = {
        javascript      = { "prettierd" },
        typescript      = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        css             = { "prettierd" },
        html            = { "prettierd" },
        json            = { "prettierd" },
        yaml            = { "prettierd" },
        markdown        = { "prettierd" },
      },

      formatters = {
        prettierd = {
          prefer_local = "never",
          command = vim.fn.has("win32") == 1 and "prettierd.cmd" or "prettierd",
        },
      },

      format_on_save = false,
    },

    keys = {
      {
        "<leader>mp",
        function()
          require("conform").format({
            lsp_fallback = true,
            async = true,
          })
        end,
        desc = "Format file or range",
        mode = { "n", "v" },
      },
    },
  },
}