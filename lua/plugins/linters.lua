-- VS Code Guard: Do not load background linters if running inside VS Code!
-- VS Code has its own native ESLint extensions that handle this correctly.
if vim.g.vscode then return {} end

return {
  {
    "mfussenegger/nvim-lint",
    event = "LazyFile",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      
      -- Dynamic function to pick oxlint if available, else eslint
      local function get_js_linter()
        local cwd = vim.uv.cwd() or ""
        -- Check for oxlint config file
        local has_oxlint_json = vim.fn.filereadable(cwd .. "/oxlint.json") == 1
        
        if has_oxlint_json then
          return { "oxlint" }
        end
        
        -- You could also check package.json for "oxlint" here if needed
        return { "eslint_d" }
      end
      -- Hook into BufEnter to dynamically swap between oxlint and eslint per project
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
        callback = function()
          local linters = get_js_linter()
          require("lint").linters_by_ft["javascript"] = linters
          require("lint").linters_by_ft["javascriptreact"] = linters
          require("lint").linters_by_ft["typescript"] = linters
          require("lint").linters_by_ft["typescriptreact"] = linters
        end,
      })

      -- ACTUALLY TRIGGER LINTING ON FILE EVENTS
      -- If we don't call `try_lint()`, nvim-lint never runs!
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
