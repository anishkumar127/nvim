
if true then return {} end
-- Always start tailwindcss-language-server on frontend files, even deep
-- inside a monorepo.  Falls back to the closest .git, then to the file’s dir.
-- return {
--   "neovim/nvim-lspconfig",
--   opts = {
--     servers = {
--       tailwindcss = {
--         filetypes = {
--           "html", "css", "scss", "sass", "postcss",
--           "javascript", "javascriptreact", "typescript",
--           "typescriptreact", "typescript.tsx", "javascript.jsx",
--           "svelte", "vue", "astro",
--         },
--         root_dir = function(fname)
--           local util = require("lspconfig.util")
--           return util.root_pattern(
--             "tailwind.config.js", "tailwind.config.cjs", "tailwind.config.ts",
--             "postcss.config.js", "postcss.config.cjs",
--             "package.json"
--           )(fname)
--           or util.find_git_ancestor(fname)
--           or util.path.dirname(fname)            -- <- last fallback
--         end,
--         init_options = {
--           userLanguages = {                       -- map TS→JS for hover
--             typescript        = "javascript",
--             typescriptreact   = "javascript",
--           },
--         },
--       },
--     },
--   },
-- }


-- lua/plugins/tailwind.lua
return {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        --- Tailwind CSS ---------------------------------------------------------
        tailwindcss = {
          -- start in React/TSX, HTML, Svelte … (same defaults, just explicit here)
          filetypes = {
            "typescriptreact", "javascriptreact", "html", "css",
            "svelte", "vue", "astro",
          },
  
          -- make it attach even if the config file lives somewhere unusual
          root_dir = function(fname)
            local util = require("lspconfig.util")
            return util.root_pattern(
              "tailwind.config.js", "tailwind.config.ts",
              "postcss.config.js", "postcss.config.ts"
            )(fname)
            or util.find_package_json_ancestor(fname)
            or util.find_git_ancestor(fname)            -- safe fall-back
            or vim.fn.getcwd()                          -- *really* fall back
          end,
        },
      },
    },
  }
  