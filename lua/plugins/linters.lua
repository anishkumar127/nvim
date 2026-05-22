-- nvim-lint — async linting
-- Disabled in embedded environments (VS Code runs its own linters)
if _G.Utils and _G.Utils.is_embedded then return {} end

return {
  {
    "mfussenegger/nvim-lint",
    event = "LazyFile",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}

      -- Dynamic function: pick oxlint if config exists, else eslint_d
      local function get_js_linter()
        local cwd = (vim.uv or vim.loop).cwd() or ""
        if vim.fn.filereadable(cwd .. "/oxlint.json") == 1 then
          return { "oxlint" }
        end
        return { "eslint_d" }
      end

      -- Fixed: BufEnter → BufReadPost
      -- BufEnter fires on EVERY window switch which is wasteful.
      -- BufReadPost fires only when a file is first read.
      vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
        group = vim.api.nvim_create_augroup("nvim-lint-detect", { clear = true }),
        callback = function()
          local linters = get_js_linter()
          require("lint").linters_by_ft["javascript"] = linters
          require("lint").linters_by_ft["javascriptreact"] = linters
          require("lint").linters_by_ft["typescript"] = linters
          require("lint").linters_by_ft["typescriptreact"] = linters
        end,
      })

      -- Trigger linting on file events
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
