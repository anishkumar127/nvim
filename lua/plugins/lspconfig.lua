local lspconfig = require("lspconfig")
local nvim_runtime_file = vim.api.nvim_get_runtime_file("", true)

table.insert(nvim_runtime_file, vim.env.VIMRUNTIME)
-- lspconfig.tsserver.setup({
--   on_attach = function(client)
--     client.server_capabilities.diagnosticProvider = false
--   end,
-- })
-- for disable right side inline erorr etc
lspconfig.gdscript.setup({
  cmd = { "nc", "localhost", "6005" }, -- Connect to Godot's language server
  filetypes = { "gd", "gdscript", "gdscript3" }, -- GDScript file types
  root_dir = lspconfig.util.root_pattern("project.godot"), -- Root is the Godot project
  on_attach = function(client, bufnr)
    -- Keybindings for LSP functionality
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts) -- Go to definition
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts) -- Show hover info
  end,
})
-- BUG: it's causing the issue of color not working
-- Add the Tailwind CSS LSP configuration
-- lspconfig.tailwindcss.setup({
--   filetypes = { "typescript", "typescriptreact", "tsx" },
--   root_dir = function(fname)
--     -- Check if the project has tailwind.config.js
--     local root = lspconfig.util.find_git_ancestor(fname) or vim.fn.getcwd()
--     return vim.fn.glob(root .. "/tailwind.config.js") ~= "" and root or nil
--   end,
-- })

return {
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    --- @class lspconfig
    opts = {
      diagnostics = {
        virtual_text = false,
      },
      inlay_hints = {
        enabled = false, -- Disable inlay_hints they have a performance cost,
        exclude = {
          "typescriptreact",
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescript.tsx",
        },
      },
      codelens = {
        enabled = false,
      },
      servers = {
        vtsls = {
          enabled = false,
        },
         lua_ls = {
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
              library = nvim_runtime_file,
            },
            completion = {
              callSnippet = "Replace",
            },
            runtime = {
              version = "LuaJIT",
            },
            hint = {
              enable = true,
              setType = true,
            },
            diagnostics = {
              globals = { "vim" },
            },
            telemetry = {
              enable = false,
            },
          },
        },
      },
      },
    },
  },
  {
    -- BUG: need to check this its show error bulb.
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({
        lightbulb = {
          enable = false,
          sign = false,
        },
        code_action = { extend_gitsigns = false, num_shortcut = true },
        diagnostic = {
          max_height = 0.8,
          max_width = 0.5,
          max_show_width = 0.5,
          keys = {
            quit = { "q", "<ESC>" },
          },
        },
      })
    end,
  },
}




