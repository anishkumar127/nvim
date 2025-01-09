-- someone posted on github for improve the performance of tsx file so that im creating this file.
-- it's not showing below status bar default which not looking got not git branch etc.
-- return {
--   {
--     "nvim-lualine/lualine.nvim",
--     event = "VeryLazy",
--     opts = function()
--       return {
--         --[[add your custom lualine config here]]
--       }
--     end,
--   },
-- }

-- not working 
-- return {
--   "nvim-lualine/lualine.nvim",
--   event = "VeryLazy",
--   opts = {
--     options = {
--       section_separators = { left = "", right = "" },
--       component_separators = { left = "|", right = "|" },
--     },
--     sections = {
--       lualine_b = { "branch", "diff" },
--       lualine_x = {
--         -- stylua: ignore
--         {
--           function() return require("noice").api.status.command.get() end,
--           cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
--           color = function() return LazyVim.ui.fg("Statement") end,
--         },
--         -- stylua: ignore
--         {
--           function() return require("noice").api.status.mode.get() end,
--           cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
--           color = function() return LazyVim.ui.fg("Constant") end,
--         },
--         -- stylua: ignore
--         {
--           function() return "  " .. require("dap").status() end,
--           cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
--           color = function() return LazyVim.ui.fg("Debug") end,
--         },
--         -- stylua: ignore
--         {
--           require("lazy.status").updates,
--           cond = require("lazy.status").has_updates,
--           color = function() return LazyVim.ui.fg("Special") end,
--         },
--       },
--       lualine_y = {}, -- removes cursor location
--       lualine_z = {}, -- removes time
--     },
--   },
-- }
--- for making dealy - Disable lualine sections and increase refresh timeouts
return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      refresh = {
        statusline = 1500,
        tabline = 1500,
        winbar = 1500,
      },
      sections = {
        lualine_a = { "branch" },
        lualine_b = {},
        lualine_x = {},
        --   lualine_y = {}, -- removes cursor location
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {},  -- removes time
      },
      extensions = {},
    },  
  },
}