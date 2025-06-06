-- return   {
--       'Chaitanyabsprip/fastaction.nvim',
--       ---@type FastActionConfig
--       opts = {},
--   }
-- if true then return {} end;
-- return {
--     "rachartier/tiny-code-action.nvim",
--     dependencies = {
--         {"nvim-lua/plenary.nvim"},

--         {
--           "folke/snacks.nvim",
--           opts = {
--              picker = "snacks",
--             terminal = {},
--           }
--         }
--     },
--     event = "LspAttach",
--     opts = {},
-- }
return {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
        {"nvim-lua/plenary.nvim"},

        {
          "folke/snacks.nvim",
          opts = {
            terminal = {},
          }
        }
    },
    event = "LspAttach",
    opts = {
        picker = "snacks",
    },
}