-- // TODO: It's for below status bar some things hide show.
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
-- return {
--   {
--     "nvim-lualine/lualine.nvim",
--     opts = {
--       refresh = {
--         statusline = 1500,
--         tabline = 1500,
--         winbar = 1500,
--       },
--       sections = {
--         lualine_a = { "branch" },
--         lualine_b = {},
--         lualine_x = {},
--         --   lualine_y = {}, -- removes cursor location
--         lualine_y = {
--           { "progress", separator = " ", padding = { left = 1, right = 0 } },
--           { "location", padding = { left = 0, right = 1 } },
--         },
--         lualine_z = {},  -- removes time
--       },
--       extensions = {},
--     },  
--   },
-- }
-- don't know why but it's feel less lag above one.
local colors = {
  blue = "#80a0ff",
  cyan = "#79dac8",
  black = "#080808",
  white = "#c6c6c6",
  red = "#ff5189",
  violet = "#d183e8",
  grey = "#303030",
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

local lualine_require = require("lualine_require")
lualine_require.require = require

local icons = require("lazyvim.config").icons

vim.o.laststatus = vim.g.lualine_laststatus

return {
  {
    "nvim-lualine/lualine.nvim",
    -- Bubbles config for lualine
    -- Author: lokesh-krishna
    -- MIT license, see LICENSE for more details.

    -- stylua: ignore
    require('lualine').setup {
      options = {
        theme = bubbles_theme,
        component_separators = '',
        section_separators = { left = '|', right = '|' },
      },
      -- refresh = {
      --   statusline = 1500,
      --   tabline = 1500,
      --   winbar = 1500,
      -- },
      sections = {
        -- lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
        lualine_a = { },
        -- lualine_b = { 'filename', 'branch' },
        lualine_c = {
          -- '%=', --[[ add your center compoentnts here in place of this comment ]]
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
        },
        -- lualine_x = {
        -- -- stylua: ignore
        -- {
        --   function() return require("noice").api.status.command.get() end,
        --   cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
        -- },
        -- -- stylua: ignore
        -- {
        --   function() return require("noice").api.status.mode.get() end,
        --   cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
        -- },
        -- -- stylua: ignore
        -- {
        --   function() return "  " .. require("dap").status() end,
        --   cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
        -- },
        -- -- {
        -- --   require("lazy.status").updates,
        -- --   cond = require("lazy.status").has_updates,
        -- -- },
        -- {
        --   "diff",
        --   symbols = {
        --     added = icons.git.added,
        --     modified = icons.git.modified,
        --     removed = icons.git.removed,
        --   },
        --   source = function()
        --     local gitsigns = vim.b.gitsigns_status_dict
        --     if gitsigns then
        --       return {
        --         added = gitsigns.added,
        --         modified = gitsigns.changed,
        --         removed = gitsigns.removed,
        --       }
        --     end
        --   end,
        -- },
        -- },
        lualine_x={},
        lualine_y = {
          -- 'filetype',
          -- 'progress',
          --   { "progress", separator = " | ", padding = { left = 1, right = 0 } },
          --   { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          -- { 'location', separator = { right = '█' }, left_padding = 2,
          --   function()
          --     return " " .. os.date("%R")
          --   end,
          -- },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {  },
        -- lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {  },
      -- extensions = { "neo-tree", "lazy" },
    }
,
  },
}