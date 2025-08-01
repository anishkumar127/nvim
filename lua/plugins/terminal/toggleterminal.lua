
-- if vim.g.vscode then return end;
-- return {
--   "akinsho/toggleterm.nvim",
--   version = "*",
--   opts = {
--     size = 20,                -- Height of the terminal window
--     open_mapping = [[<C-\>]], -- Keybinding to toggle terminal
--     direction = "float",      -- Can be "horizontal", "vertical", or "float"
--     shading_factor = 2,       -- Adjust terminal shading
--     persist_size = true,      -- Remember terminal size
--     persist_mode = true,      -- Remember terminal mode
--     -- log_level = "debug",:
--     start_in_insert = true,

--   },
--   keys = {
--     { "<C-\\>",     "<cmd>ToggleTerm<CR>", desc = "Toggle Terminal" }, -- Default terminal
--     { "<leader>t1", "<cmd>ToggleTerm direction=float id=1<CR>",  desc = "Open Floating Terminal 1" },
--     { "<leader>t2", "<cmd>ToggleTerm direction=horizontal id=2<CR>", desc = "Open Horizontal Terminal 2" },
--     { "<leader>t3", "<cmd>ToggleTerm direction=vertical id=3<CR>", desc = "Open Vertical Terminal 3" },
--   },
-- }
-- wokring 
-- return {
--   {
--     "akinsho/toggleterm.nvim",
--     version = "*",
--     config = function()
--       local toggleterm = require("toggleterm")
--
--       local powershell_options = {
--         shell = "pwsh.exe -nologo",
--         shellcmdflag =
--         "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
--         shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
--         shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
--         shellquote = "",
--         shellxquote = "",
--       }
--
--       for option, value in pairs(powershell_options) do
--         vim.opt[option] = value
--       end
--
--       toggleterm.setup({})
--
--       vim.keymap.set({ "n", "t" }, "<leader>vt", "<cmd>ToggleTerm size=60 direction=vertical<cr>", {})
--       vim.keymap.set({ "n", "t" }, "<leader>ft", "<cmd>ToggleTerm direction=float<cr>", {})
--     end,
--   },
-- }
--

-- working end 
-- try start

-- ~/.config/nvim/lua/plugins/toggleterm.lua
return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      --------------------------------------------------------------------
      -- Detect platform once
      --------------------------------------------------------------------
      local os = require "config.os"

      --------------------------------------------------------------------
      -- Apply PowerShell tweaks **only on real Windows**
      --------------------------------------------------------------------
      if os.is_windows and not os.is_wsl then
        local powershell_opts = {
          shell        = "pwsh.exe -nologo",
          shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned " ..
                         "-Command [Console]::InputEncoding=[Console]::" ..
                         "OutputEncoding=[System.Text.Encoding]::UTF8;",
          shellredir   = "-RedirectStandardOutput %s -NoNewWindow -Wait",
          shellpipe    = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
          shellquote   = "",
          shellxquote  = "",
        }
        for k, v in pairs(powershell_opts) do
          vim.opt[k] = v
        end
      end
      -- On WSL / Linux / macOS we leave &shell exactly as it is (bash, zsh, …)

      --------------------------------------------------------------------
      -- ToggleTerm normal setup
      --------------------------------------------------------------------
      require("toggleterm").setup({})

      --------------------------------------------------------------------
      -- Key-maps (unchanged)
      --------------------------------------------------------------------
      local map = vim.keymap.set
      map({ "n", "t" }, "<leader>vt",
          "<cmd>ToggleTerm size=60 direction=vertical<cr>",
          { desc = "Vertical terminal" })

      map({ "n", "t" }, "<leader>ft",
          "<cmd>ToggleTerm direction=float<cr>",
          { desc = "Floating terminal" })
    end,
  },
}
-- try end
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
