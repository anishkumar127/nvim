return {
  "akinsho/toggleterm.nvim",
  -- version = "*"
  opts = {
    size = 20,                -- Height of the terminal window
    open_mapping = [[<C-\>]], -- Keybinding to toggle terminal
    direction = "float",      -- Can be "horizontal", "vertical", or "float"
    shading_factor = 2,       -- Adjust terminal shading
    persist_size = true,      -- Remember terminal size
    persist_mode = true,      -- Remember terminal mode
    -- log_level = "debug",:
    start_in_insert = true,

  },
  keys = {
    { "<C-\\>",     "<cmd>ToggleTerm<CR>", desc = "Toggle Terminal" }, -- Default terminal
    { "<leader>t1", "<cmd>ToggleTerm direction=float id=1<CR>",  desc = "Open Floating Terminal 1" },
    { "<leader>t2", "<cmd>ToggleTerm direction=horizontal id=2<CR>", desc = "Open Horizontal Terminal 2" },
    { "<leader>t3", "<cmd>ToggleTerm direction=vertical id=3<CR>", desc = "Open Vertical Terminal 3" },
  },
}


-- return {
--     {
--         'akinsho/toggleterm.nvim',
--         version = "*",
--         opts = function()
--             return {
--                 require('toggleterm').setup{
--                     open_mapping = '<C-\\>',
--                     autochdir = false,
--                     start_in_insert = true,
--                     shell = vim.o.shell,
--                     -- direction = 'float',
--                     -- float_opt = {
--                     --     border = 'shadow',
--                     --     width = 80,
--                     --     heigh = 120,
--                     --     title_pos = 'center',
--                     -- }
--                 }
--             }
--         end,
--     }
-- }
