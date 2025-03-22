return {
    "HiPhish/rainbow-delimiters.nvim",
    enabled = true,
    config = function()
      -- This module contains a number of default definitions
      local rainbow_delimiters = require("rainbow-delimiters")
    --   local colors = dofile(vim.g.base46_cache .. "colors")
    -- Just define your colors here:
    local colors = {
        red     = "#F7768E",
        yellow  = "#E0AF68",
        blue    = "#7AA2F7",
        orange  = "#FF9E64",
        green   = "#9ECE6A",
        purple  = "#9D7CD8",
        cyan    = "#449DA6",
        magenta = "#AD8EE6",
        brown   = "#BD958B", -- or pick whatever color you like
        pink    = "#FFB5C2", -- not used by default, but available
      }
      local color_mappings = {
        RainbowRed = colors.red,
        RainbowYellow = colors.yellow,
        RainbowBlue = colors.blue,
        RainbowOrange = colors.orange,
        RainbowGreen = colors.green,
        RainbowViolet = colors.purple,
        RainbowCyan = colors.cyan,
        RainbowMagenta = colors.magenta,
        RainbowPink = colors.pink,
        RainbowBrown = colors.brown,
      }
  
      for name, color in pairs(color_mappings) do
        vim.api.nvim_set_hl(0, name, { fg = color })
      end
  
      ---@type rainbow_delimiters.config
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
        },
        priority = {
          [""] = 110,
          lua = 210,
        },
        highlight = {
          "RainbowRed",
          "RainbowYellow",
          "RainbowBlue",
          -- "RainbowOrange",
          "RainbowGreen",
          "RainbowViolet",
          "RainbowCyan",
          "RainbowMagenta",
          "RainbowBrown",
        },
      }
    end,
  }