-- return {
--   {
--     "scottmckendry/cyberdream.nvim",
--     lazy = false,
--     priority = 1000,
--     opts = function(_, opts)
--       opts.transparent = true
--       opts.italic_comments = true
--       opts.borderless_pickers = false
--     end,
--   },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "cyberdream",
--     },
--   },

--   -- modicator (auto color line number based on vim mode)
--   {
--     "mawkler/modicator.nvim",
--     dependencies = "scottmckendry/cyberdream.nvim",
--     init = function()
--       -- These are required for Modicator to work
--       vim.o.cursorline = false
--       vim.o.number = true
--       vim.o.termguicolors = true
--     end,
--     opts = {},
--   },
-- }
-- local base = {
--   red = "#ff657a",
--   maroon = "#F29BA7",
--   peach = "#ff9b5e",
--   yellow = "#eccc81",
--   green = "#a8be81",
--   teal = "#9cd1bb",
--   sky = "#A6C9E5",
--   sapphire = "#86AACC",
--   blue = "#5d81ab",
--   lavender = "#66729C",
--   mauve = "#b18eab",
-- }

-- local extend_base = function(value)
--   return vim.tbl_extend("force", base, value)
-- end

-- return {

--     "catppuccin",
--       lazy = false,
--     priority = 1000,
--   optional = true,
--   opts = function()
--     ---@type CatppuccinOptions
--     return {
--       background = {
--         dark = "frappe",
--         light = "latte",
--       },
--       color_overrides = {
--         latte = extend_base({
--           text = "#202027",
--           subtext1 = "#263168",
--           subtext0 = "#4c4f69",
--           overlay2 = "#737994",
--           overlay1 = "#838ba7",
--           base = "#fcfcfa",
--           mantle = "#EAEDF3",
--           crust = "#DCE0E8",
--           pink = "#EA7A95",
--           mauve= "#986794",
--           red = "#EC5E66",
--           peach = "#FF8459",
--           yellow = "#CAA75E",
--           green = "#87A35E",
--         }),
--         frappe = extend_base({
--           text = "#fcfcfa",
--           surface2 = "#535763",
--           surface1 = "#3a3d4b",
--           surface0 = "#30303b",
--           base = "#202027",
--           mantle = "#1c1d22",
--           crust = "#171719",
--         }),
--       },
--     }
--     end,

--     {
--       "LazyVim/LazyVim",
--       opts = {
--         colorscheme = "catppuccin",
--       },
--     },
-- }

-- try

local base = {
  red = "#ff657a",
  maroon = "#F29BA7",
  peach = "#ff9b5e",
  yellow = "#eccc81",
  green = "#a8be81",
  teal = "#9cd1bb",
  sky = "#A6C9E5",
  sapphire = "#86AACC",
  blue = "#5d81ab",
  lavender = "#66729C",
  mauve = "#b18eab",
}

local extend_base = function(value)
  return vim.tbl_extend("force", base, value)
end

return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    -- opts = function(_, opts)
    --   opts.transparent = true
    --   opts.italic_comments = true
    --   opts.borderless_pickers = false
    -- end,
    opts = function()
      ---@type CatppuccinOptions
      return {
        background = {
          dark = "frappe",
          light = "latte",
        },
        color_overrides = {
          latte = extend_base({
            text = "#202027",
            subtext1 = "#263168",
            subtext0 = "#4c4f69",
            overlay2 = "#737994",
            overlay1 = "#838ba7",
            base = "#fcfcfa",
            mantle = "#EAEDF3",
            crust = "#DCE0E8",
            pink = "#EA7A95",
            mauve = "#986794",
            red = "#EC5E66",
            peach = "#FF8459",
            yellow = "#CAA75E",
            green = "#87A35E",
          }),
          frappe = extend_base({
            text = "#fcfcfa",
            surface2 = "#535763",
            surface1 = "#3a3d4b",
            surface0 = "#30303b",
            base = "#202027",
            mantle = "#1c1d22",
            crust = "#171719",

            -- base = "#000000",               -- Make background black
            -- mantle = "#000000",             -- Make mantle black
            -- crust = "#000000",              -- Make crust black
          }),
        },
      }
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  -- modicator (auto color line number based on vim mode)
  {
    "mawkler/modicator.nvim",
    dependencies = "catppuccin/nvim",
    init = function()
      -- These are required for Modicator to work
      vim.o.cursorline = false
      vim.o.number = true
      vim.o.termguicolors = true
    end,
    opts = {},
  },
}
