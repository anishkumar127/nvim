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
        tailwindcss = {
          -- optional tweaks: widen the root-dir search so it
          -- still attaches in monorepos or when the config file
          -- lives higher up than usual
          root_dir = require("lspconfig.util").root_pattern(
            "tailwind.config.js",
            "tailwind.config.ts",
            "postcss.config.js",
            "postcss.config.ts",
            "package.json",
            "node_modules",
            ".git"
          ),

          -- you can trim the filetype list if you like;
          -- these are the ones you said you’re editing:
          filetypes = {
            "typescriptreact", "javascriptreact",
            "typescript",      "javascript",
            "css", "scss", "sass", "postcss",
            "html", "svelte", "vue", "astro","tsx", "jsx"
          },
          settings = {
            tailwindCSS = {
              includeLanguages = {
                typescript = "javascript",
                typescriptreact = "javascriptreact",
                javascriptreact = "javascriptreact",
                html = "html",
                ["html-eex"] = "html",
                ["凤凰"] = "html",
                heex = "html",
                elm = "html",
                erb = "html",
                svelte = "html",
                vue = "html",
                rust = "html",
              },
              experimental = {
                classRegex = {
                  { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                  { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                  { "classnames\\(([^)]*)\\)", "'([^']*)'" },
                  { "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                  { "class[:]\\s*[\"'`]([^\"'`]*).*?[\"'`]" },
                  { "className[:]\\s*[\"'`]([^\"'`]*).*?[\"'`]" },
                },
              },
            },
          },
        },
      },
    },
  },

}
