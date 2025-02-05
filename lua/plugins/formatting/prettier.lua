local supported = {
  'css',
  'handlebars',
  'html',
  'javascript',
  'javascriptreact',
  'json',
  'jsonc',
  'markdown',
  'markdown.mdx',
  'scss',
  'typescript',
  'typescriptreact',
  'yaml',
}

return {
  {
    'williamboman/mason.nvim',
    -- Ensure Prettier is installed via Mason
    opts = {
      ensure_installed = { 'prettier' },
    },
  },

  -- conform
  {
    'stevearc/conform.nvim',
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      for _, ft in ipairs(supported) do
        opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
        -- Only Prettier (removed prettierd)
        table.insert(opts.formatters_by_ft[ft], 'prettier')
      end
    end,
  },

  -- null-ls (none-ls) support
  {
    'nvimtools/none-ls.nvim',
    optional = true,
    opts = function(_, opts)
      local nls = require 'null-ls'
      opts.sources = opts.sources or {}
      -- Only Prettier (removed prettierd)
      table.insert(opts.sources, nls.builtins.formatting.prettier)
    end,
  },
}