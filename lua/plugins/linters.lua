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
        return { "eslint" }
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
    end,
  },
}
