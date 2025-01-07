local map = vim.keymap.set
-- this file will hold ts stuff
return {
  {
    "davidosomething/format-ts-errors.nvim",
    event = "VeryLazy",
  },

  -- LSP
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    enabled = true,
        event = { "BufReadPre *.ts", "BufReadPre *.tsx", "BufReadPre *.js", "BufReadPre *.jsx" }, -- Lazy Loading for Performance only loaded when needed
    -- ft = {
    --   "typescript",
    --   "typescriptreact",
    --   "javascript",
    --   "javascriptreact",
    -- },

    config = function(_, opts)
      local api = require("typescript-tools.api")

      opts.handlers = {
        ["textDocument/publishDiagnostics"] = api.filter_diagnostics({
          80001, -- Ignore this might be converted to a ES export
        }),
      }

      require("typescript-tools").setup(opts)
    end,
    opts = {
      expose_as_code_action = "all",
      --  for fast function completion ,
      complete_function_calls = true,
            --  tsserver_max_memory = "auto",
           
            tsserver_max_memory = 8192,   -- 8192 4096 Allocate more memory to reduce garbage collection overhead

           
              include_completions_with_insert_text = true, -- To make suggestions lightning-fast
              tsserver_cache_size = 1000, -- Cache parsed files
              diagnostic_debounce_time = 150, -- Delay in milliseconds before diagnostics are updated
                root_dir = require("lspconfig.util").root_pattern("tsconfig.json", "package.json", ".git"), -- Limit Workspace Scope , restrict it to only the files in your current project
                  settings = {
    tsserver = {
      maxPreload = 5000,   -- Maximum number of files to preload
      preloadFiles = true, -- Enable file preloading
    },
  },
-- semantic_highlighting = false, -- 

              -- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
    -- possible values: ("off"|"all"|"implementations_only"|"references_only")
              code_lens = "off",
                -- by default code lenses are displayed on all referencable values and for some of you it can
    -- be too much this option reduce count of them by removing member references from lenses
    disable_member_code_lens = true,
      jsx_close_tag = {
        enable = true,
        filetypes = { "javascriptreact", "typescriptreact" },
      },
      on_attach = function(config, bufNr)
        -- map("n", "gD", "<cmd>TSToolsGoToSourceDefinition<CR>", {
        --   desc = "Go to source definition",
        --   silent = true,
        --   buffer = bufNr,
        -- })
        -- -- TSToolsFileReferences
        -- map("n", "gR", "<cmd>TSToolsFileReferences<CR>", {
        --   desc = "File References",
        --   silent = true,
        --   buffer = bufNr,
        -- })

        -- map(
        --   { "n", "v" },
        --   "<leader>co",
        --   "<cmd>TSToolsOrganizeImports<CR>",
        --   { desc = "Imports Organize", silent = true, buffer = bufNr }
        -- )

        -- map(
        --   { "n", "v" },
        --   "<leader>cS",
        --   "<cmd>TSToolsSortImports<CR>",
        --   { desc = "Imports Sort", silent = true, buffer = bufNr }
        -- )

        -- map({ "n", "v" }, "<leader>cr", "<cmd>TSToolsRemoveUnusedImports<CR>", {
        --   desc = "Imports remove unused",
        --   silent = true,
        --   buffer = bufNr,
        -- })

        -- map({ "n", "v" }, "<leader>cM", "<cmd>TSToolsAddMissingImports<CR>", {
        --   desc = "Add missing imports",
        --   silent = true,
        --   buffer = bufNr,
        -- })

        -- map(
        --   { "n", "v" },
        --   "<leader>rF",
        --   "<cmd>TSToolsRenameFile<CR>",
        --   { desc = "Rename File", silent = true, buffer = bufNr }
        -- )
        -- -- TSToolsFixAll
        -- map({ "n", "v" }, "<leader>cD", "<cmd>TSToolsFixAll<CR>", {
        --   desc = "Fix all diagnostics",
        --   silent = true,
        --   buffer = bufNr,
        -- })
         local keymap = vim.keymap.set
        keymap("n", "<leader>toi", ":TSToolsOrganizeImports<CR>", { desc = "Organize Imports", silent = true, buffer = bufNr })
        keymap("n", "<leader>tsi", ":TSToolsSortImports<CR>", { desc = "Sort Imports", silent = true, buffer = bufNr })
        keymap("n", "<leader>tru", ":TSToolsRemoveUnusedImports<CR>", { desc = "Remove Unused Imports", silent = true, buffer = bufNr })
        keymap("n", "<leader>trn", ":TSToolsRemoveUnused<CR>", { desc = "Remove Unused Statements", silent = true, buffer = bufNr })
        keymap("n", "<leader>tmi", ":TSToolsAddMissingImports<CR>", { desc = "Add Missing Imports", silent = true, buffer = bufNr })
        keymap("n", "<leader>tfa", ":TSToolsFixAll<CR>", { desc = "Fix All Errors", silent = true, buffer = bufNr })
        keymap("n", "<leader>tsd", ":TSToolsGoToSourceDefinition<CR>", { desc = "Go to Source Definition", silent = true, buffer = bufNr })
        keymap("n", "<leader>trf", ":TSToolsRenameFile<CR>", { desc = "Rename File", silent = true, buffer = bufNr })
        keymap("n", "<leader>tfr", ":TSToolsFileReferences<CR>", { desc = "File References", silent = true, buffer = bufNr })
      end,
    },
  },
  --   {
  -- for formating using prettier.
  --   "jose-elias-alvarez/null-ls.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   opts = function()
  --     local null_ls = require("null-ls")
  --     return {
  --       sources = {
  --         null_ls.builtins.formatting.prettier.with({
  --           filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "html", "css" },
  --         }),
  --       },
  --     }
  --   end,
  -- },
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   opts = {
  --     defaults = {
  --       file_ignore_patterns = { "node_modules", ".git/" },
  --     },
  --   },
  -- },
   {
        "dmmulroy/tsc.nvim",

        cmd = { "TSC" },

        opts = {
            -- auto_open_qflist = true,
            -- auto_close_qflist = true,
            -- auto_focus_qflist = false,
            -- use_trouble_qflist = true,
        },
    },
}