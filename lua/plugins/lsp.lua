-- Disable "No information available" notification on hover
-- plus define border for hover window
vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
  config = config
    or {
      border = {
        { "╭", "Comment" },
        { "─", "Comment" },
        { "╮", "Comment" },
        { "│", "Comment" },
        { "╯", "Comment" },
        { "─", "Comment" },
        { "╰", "Comment" },
        { "│", "Comment" },
      },
    }
  config.focus_id = ctx.method
  if not (result and result.contents) then
    return
  end
  local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
  if vim.tbl_isempty(markdown_lines) then
    return
  end
  return vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
end

return {
  {
    "neovim/nvim-lspconfig",
     event = "VeryLazy",  -- Load LSP on demand to improve startup time
    --- @class lspconfig
    opts = {
      --  diagnostics = {
      --   virtual_text = false, -- Disable inline diagnostic messages
      -- },
      -- codelens = {
      --   enabled = false, -- Disable codelens for performance
      -- },
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
      servers = {
        
        vtsls = { -- TypeScript server configuration
         flags = {
            debounce_text_changes = 200, -- Increased debounce time for diagnostics
          },
          settings = {
            typescript = {
              inlayHints = {
                  -- Disable all inlay hints
                enumMemberValues = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                parameterNames = { enabled = false },
                parameterTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                variableTypes = { enabled = false },
              },
                 -- Additional settings you can disable for performance
      suggest = {
        autoImports = false, -- Disable automatic import suggestions
        completeFunctionCalls = false, -- Disable auto-completion of function arguments
        names = false, -- Disable name suggestions
        -- paths = false, -- Disable path suggestions
      },
         preferences = {
        importModuleSpecifierPreference = "relative", -- Simplify imports to relative paths
        importModuleSpecifierEnding = "minimal", -- Avoid extra file extensions
        disableSuggestions = true, -- Disable TypeScript LSP suggestions (use a dedicated completion engine like `nvim-cmp`)
      },
            },
          },
        },
                 lua_ls = {
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
              library = nvim_runtime_file,
                              -- library = vim.api.nvim_get_runtime_file("", true), -- Runtime files

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
              globals = { "vim" }, -- Recognize `vim` global
            },
            telemetry = {
              enable = false,  -- Disable telemetry
            },
          },
        },
      },
      
      },
    },
  },
}
