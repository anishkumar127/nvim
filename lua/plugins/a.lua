if true then return {} end
-- lua/plugins/lsp-eslint.lua
return {
  "neovim/nvim-lspconfig",

  -- Extend LazyVim’s LSP opts
  opts = function(_, opts)
    -- Make sure the `servers` table exists
    opts.servers = opts.servers or {}

    -- Add / override the eslint-LS entry
    opts.servers.eslint = {
      -- Run on the same file-types you use for tsserver / vtsls
      filetypes = {
        "javascript", "javascriptreact",
        "typescript", "typescriptreact",
        "vue", "svelte", "astro",
      },

      -- Disable formatting if you use another formatter (e.g. prettier)
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
      end,

      -- ESLint-LS specific settings
      settings = {
        -- Code-actions ------------------------------------------------------
        codeAction       = { disableRuleComment = { enable = true } },
        codeActionOnSave = { enable = true, mode = "all" },

        -- Formatting --------------------------------------------------------
        format           = false,     -- keep eslint-LS from formatting

        -- Misc --------------------------------------------------------------
        nodePath         = "",        -- let the server resolve eslint
        packageManager   = "npm",     -- or "yarn" / "pnpm"
      },
    }
  end,
}