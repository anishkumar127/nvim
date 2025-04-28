-- return {
--     "nvim-treesitter/nvim-treesitter",
--     build = ":TSUpdate",
--     config = function ()
--         local configs = require("nvim-treesitter.configs")

--         configs.setup({
--             ensure_installed = {
--                 "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "markdown", "markdown_inline"
--             },
--             auto_install = true,
--             sync_install = false,
--             highlight = { enable = true },
--             indent = { enable = true },

--             incremental_selection = {
--                 enable = true,
--                 keymaps = {
--                     init_selection = "<Enter>", -- set to `false` to disable one of the mappings
--                     node_incremental = "<Enter>",
--                     scope_incremental = false,
--                     node_decremental = "<Backspace>",
--                 },
--             },
--         })
--     end
-- }

return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        { "windwp/nvim-ts-autotag",                  opts = {} },
        { "nvim-treesitter/nvim-treesitter-context", opts = { enable = false } },
    },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    lazy = vim.fn.argc(-1) == 0,
    config = function()
        local configs = require("nvim-treesitter.configs")
        local parsers = require("nvim-treesitter.parsers")

        configs.setup({
            ensure_installed = {
                "bash",
                "css",
                "diff",
                "dockerfile",
                "go",
                "gomod",
                "gowork",
                "graphql",
                "html",
                "javascript",
                "jsdoc",
                "json",
                "json5",
                "lua",
                "markdown",
                "markdown_inline",
                "php",
                "prisma",
                "python",
                "regex",
                "rust",
                "scss",
                "sql",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
            },
            highlight = { enable = true },
            indent = { enable = true },
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    -- init_selection = "<leader>ti",
                    -- scope_incremental = "<leader>ts",
                    -- node_incremental = "v",
                    -- node_decremental = "V",
                    --
                    init_selection = "<Enter>",          -- set to `false` to disable one of the mappings
                    node_incremental = "<Enter>",
                    scope_incremental = false,
                    node_decremental = "<Backspace>",
                },
            },
        })

        local parser_configs = parsers.get_parser_configs();
        parser_configs.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
    end,
}
