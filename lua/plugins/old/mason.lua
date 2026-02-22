-- if true then return {} end
-- it think i need to find the alternative for this.
return {
  {
    -- "williamboman/mason.nvim",
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- "bash-language-server",
        -- "chrome-debug-adapter",
        -- "eslint-lsp",
        -- "js-debug-adapter",
        -- "json-lsp",
        -- "lua-language-server",
        "prettierd",
        -- "ruff",
        -- "ruff-lsp",
        -- "shellcheck",
        -- "shfmt",
        -- "stylua",
        "tailwindcss-language-server",
        -- "vtsls",
        -- "yaml-language-server",
      },
    },
  },
   -- tell nvim-lspconfig to start it next to vtsls/tsserver
   {
    "neovim/nvim-lspconfig",
    opts = {
      
      servers = {
        -- tailwindcss is now fully handled by LazyVim's extras module
        -- no need to duplicate it here
      },
    },
  },

}
