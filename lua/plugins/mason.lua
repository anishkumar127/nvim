-- if true then return {} end

return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- "bash-language-server",
        "chrome-debug-adapter",
        -- "eslint-lsp",
        "js-debug-adapter",
        "json-lsp",
        "lua-language-server",
        "prettier",
        -- "prettierd",
        -- "ruff",
        -- "ruff-lsp",
        "shellcheck",
        "shfmt",
        "stylua",
        "tailwindcss-language-server",
        "vtsls",
        "yaml-language-server",
      },
    },
  },
}
