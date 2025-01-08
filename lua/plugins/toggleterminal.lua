return {
  "akinsho/toggleterm.nvim",
  -- version = "*"
  opts = {
    size = 20,                     -- Height of the terminal window
    open_mapping = [[<C-\>]],      -- Keybinding to toggle terminal
    direction = "horizontal",      -- Can be "horizontal", "vertical", or "float"
    -- shell = "C:\\Program Files\\Git\\bin\\bash.exe", -- Use Git Bash
    shading_factor = 2,            -- Adjust terminal shading
    persist_size = true,           -- Remember terminal size
    persist_mode = true,           -- Remember terminal mode
    -- log_level = "debug",:

  },
  keys = {
    { "<C-\\>", "<cmd>ToggleTerm<CR>", desc = "Toggle Terminal" }, -- Default terminal
    { "<leader>t1", ":ToggleTerm 1<CR>", desc = "Open Terminal 1" },
    { "<leader>t2", ":ToggleTerm 2<CR>", desc = "Open Terminal 2" },
    { "<leader>t3", ":ToggleTerm 3<CR>", desc = "Open Terminal 3" },
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