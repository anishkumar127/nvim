if true then return {} end
-- return {
--     {
--         "pmizio/typescript-tools.nvim",
--         dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },

--         enabled = vim.g.has_node,

--         ft = {
--             "typescript",
--             "typescriptreact",
--             "javascript",
--             "javascriptreact",
--         },

--         config = function(_, opts)
--             local api = require("typescript-tools.api")

--             opts.handlers = {
--                 ["textDocument/publishDiagnostics"] = api.filter_diagnostics({
--                     80001, -- Ignore this might be converted to a ES export
--                 }),
--             }

--             require("typescript-tools").setup(opts)
--         end,
--         opts = {
--             expose_as_code_action = "all",
--             complete_function_calls = false,
--              tsserver_max_memory = "auto",
--               include_completions_with_insert_text = true,
--               -- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
--     -- possible values: ("off"|"all"|"implementations_only"|"references_only")
--               code_lens = "off",
--                 -- by default code lenses are displayed on all referencable values and for some of you it can
--     -- be too much this option reduce count of them by removing member references from lenses
--     disable_member_code_lens = true,
--             jsx_close_tag = {
--                 enable = true,
--                 filetypes = { "javascriptreact", "typescriptreact" },
--             },
--             on_attach = function(config, bufNr)
--                 vim.keymap.set(
--                     { "n", "v" },
--                     "<leader>io",
--                     ":TSToolsOrganizeImports<CR>",
--                     { desc = "Imports Organize", silent = true, buffer = bufNr }
--                 )

--                 vim.keymap.set(
--                     { "n", "v" },
--                     "<leader>is",
--                     ":TSToolsSortImports<CR>",
--                     { desc = "Imports Sort", silent = true, buffer = bufNr }
--                 )

--                 vim.keymap.set(
--                     { "n", "v" },
--                     "<leader>ir",
--                     ":TSToolsRemoveUnusedImports<CR>",
--                     {
--                         desc = "Imports remove unused",
--                         silent = true,
--                         buffer = bufNr,
--                     }
--                 )

--                 vim.keymap.set(
--                     { "n", "v" },
--                     "<leader>ia",
--                     ":TSToolsAddMissingImports<CR>",
--                     {
--                         desc = "Imports Add All missing",
--                         silent = true,
--                         buffer = bufNr,
--                     }
--                 )

--                 vim.keymap.set(
--                     { "n", "v" },
--                     "<leader>rf",
--                     ":TSToolsRenameFile<CR>",
--                     { desc = "Rename File", silent = true, buffer = bufNr }
--                 )
--             end,
--         },
--     },

--     {
--         "dmmulroy/tsc.nvim",

--         cmd = { "TSC" },

--         opts = {
--             auto_open_qflist = true,
--             auto_close_qflist = true,
--             auto_focus_qflist = false,
--             use_trouble_qflist = true,
--         },
--     },
-- }