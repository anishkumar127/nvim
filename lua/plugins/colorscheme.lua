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

-- try working fine right.

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
--   {
--     "catppuccin/nvim",
--     lazy = false,
--     priority = 1000,
--     -- opts = function(_, opts)
--     --   opts.transparent = true
--     --   opts.italic_comments = true
--     --   opts.borderless_pickers = false
--     -- end,
--     opts = function()
--       ---@type CatppuccinOptions
--       return {
--         background = {
--           dark = "frappe",
--           light = "latte",
--         },
--         color_overrides = {
--           latte = extend_base({
--             text = "#202027",
--             subtext1 = "#263168",
--             subtext0 = "#4c4f69",
--             overlay2 = "#737994",
--             overlay1 = "#838ba7",
--             base = "#fcfcfa",
--             mantle = "#EAEDF3",
--             crust = "#DCE0E8",
--             pink = "#EA7A95",
--             mauve = "#986794",
--             red = "#EC5E66",
--             peach = "#FF8459",
--             yellow = "#CAA75E",
--             green = "#87A35E",
--           }),
--           frappe = extend_base({
--             text = "#fcfcfa",
--             surface2 = "#535763",
--             surface1 = "#3a3d4b",
--             surface0 = "#30303b",
--             base = "#202027",
--             mantle = "#1c1d22",
--             crust = "#171719",

--             -- base = "#000000",               -- Make background black
--             -- mantle = "#000000",             -- Make mantle black
--             -- crust = "#000000",              -- Make crust black
--           }),
--         },
--       }
--     end,
--   },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "catppuccin",
--     },
--   },

--   -- modicator (auto color line number based on vim mode)
--   {
--     "mawkler/modicator.nvim",
--     dependencies = "catppuccin/nvim",
--     init = function()
--       -- These are required for Modicator to work
--       vim.o.cursorline = true
--       vim.o.number = true
--       vim.o.termguicolors = true
--     end,
--     opts = {},
--   },
-- }

----------------------------------------------------

-- Example: LazyVim + Catppuccin + "HarryHopkinson" style palette

-- local harryhop_base = {
--   red      = "#e06c75",  -- Replace with your theme's red
--   maroon   = "#be5046",  -- If your theme has a maroon variant
--   peach    = "#d19a66",  -- Or your theme's orange/peach tone
--   yellow   = "#e5c07b",
--   green    = "#98c379",
--   teal     = "#56b6c2",
--   sky      = "#61afef",
--   sapphire = "#528bff",  -- A deeper/cooler variant of blue
--   blue     = "#61afef",
--   lavender = "#c678dd",
--   mauve    = "#c678dd",  -- Or another purplish hue
-- }

-- -- Helper: merges base table with overrides
-- local extend_base = function(value)
--   return vim.tbl_extend("force", harryhop_base, value)
-- end

-- return {

--   -- Catppuccin theme plugin
--   {
--     "catppuccin/nvim",
--     lazy = false,
--     priority = 1000,
--     opts = function()
--       ---@type CatppuccinOptions
--       return {
--         background = {
--           dark = "frappe",
--           light = "latte",
--         },
--         color_overrides = {
--           latte = extend_base({
--             -- If your theme has a true “light mode,” apply those backgrounds:
--             text     = "#2a2a2e",
--             subtext1 = "#3b3b40",
--             subtext0 = "#4c4f69",
--             overlay2 = "#737994",
--             overlay1 = "#838ba7",
--             base     = "#ffffff", -- main background if you use light mode
--             mantle   = "#f2f2f2",
--             crust    = "#e6e6e6",

--             -- If you want to override any HarryHop colors just for latte
--             pink     = "#e06c75",
--             mauve    = "#c678dd",
--             red      = "#e06c75",
--             peach    = "#d19a66",
--             yellow   = "#e5c07b",
--             green    = "#98c379",
--           }),
--           frappe = extend_base({
--             -- “Dark mode” overrides
--             text     = "#e2e2e2",
--             surface2 = "#535763",
--             surface1 = "#3a3d4b",
--             surface0 = "#30303b",
--             base     = "#202027", -- main background if you use dark mode
--             mantle   = "#1c1d22",
--             crust    = "#171719",
--           }),
--         },
--       }
--     end,
--   },

--   -- Automatically set colorscheme to Catppuccin
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "catppuccin",
--     },
--   },

--   -- Example: modicator (auto-color line number based on mode)
--   {
--     "mawkler/modicator.nvim",
--     dependencies = "catppuccin/nvim",
--     init = function()
--       -- Required for modicator
--       vim.o.cursorline = false
--       vim.o.number = true
--       vim.o.termguicolors = true
--     end,
--     opts = {},
--   },

-- }


---------- new try exact vs code


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
      opts = function()
        return {
          -- Make sure your dark background is set to "frappe" so these overrides apply
          background = {
            dark = "frappe",
            light = "latte",
          },
          color_overrides = {
            -- Light variant is optional—if you rarely switch to light mode, you can omit it entirely.
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
            -- Here’s the Gruvbox-inspired “vim-dark-hard” overrides
            -- frappe = extend_base({
            --   -- Main UI “background” layers
            --   base = "#1d2021",     -- overall background
            --   mantle = "#1d2021",   -- same or slightly darker
            --   crust = "#1d2021",    -- same or slightly darker
            --   surface0 = "#282828",
            --   surface1 = "#3c3836",
            --   surface2 = "#504945",
  
            --   -- Text / foreground tints
            --   text = "#ebdbb2",     -- main FG
            --   subtext0 = "#a89984",
            --   subtext1 = "#928374",
            --   overlay1 = "#665c54",
            --   overlay2 = "#7c6f64",
  
            --   -- Accents mapped to Gruvbox
            --   red      = "#fb4934",
            --   maroon   = "#cc241d",
            --   green    = "#b8bb26",
            --   teal     = "#8ec07c",
            --   yellow   = "#fabd2f",
            --   peach    = "#fe8019",
            --   blue     = "#458588",
            --   sapphire = "#458588", -- or pick a different teal/blue you prefer
            --   sky      = "#83a598",
            --   mauve    = "#d3869b",
            --   pink     = "#d3869b",
            --   lavender = "#bdae93",
            -- }),
            frappe = extend_base({
              -- Main UI “background” layers
              base     = "#1d2021", -- overall background
              mantle   = "#1d2021", -- same or slightly darker
              crust    = "#1d2021", -- same or slightly darker
              surface0 = "#282828",
              surface1 = "#3c3836",
              surface2 = "#504945",
  
              -- Text / foreground tints
              text     = "#ebdbb2", -- main FG
              subtext0 = "#a89984",
              subtext1 = "#928374",
              overlay1 = "#665c54",
              overlay2 = "#7c6f64",
  
              -- Accents mapped to Gruvbox
              red      = "#fb4934", -- try catch const   @keyword,
              maroon   = "#cc241d",
              green    = "#b8bb26",
              teal     = "#8ec07c",
              yellow   = "#fabd2f", -- function , typescript ,
              peach    = "#5d81ab", -- return response status code  @string
              blue     = "#458588", -- function , typescript ,   @function
              sapphire = "#458588", -- or pick a different teal/blue you prefer
              sky      = "#83a598",
              mauve    = "#fb4934", -- try catch const
              pink     = "#d3869b",
              lavender = "#bdae93",
            }),
          },
          -- Some other advanced features: -- temporary
          transparent_background = false, -- or true if you want no background
          term_colors = true,       -- if you want your `:terminal` to use these colors
          show_end_of_buffer = false, -- show actual EOB chars or not
          dim_inactive = {
            enabled = false,        -- dims background of inactive windows
            percentage = 0.15,
          },
  
          integrations = {
            treesitter = true,
            native_lsp = {
              enabled = true,
              virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = {},
              },
              underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = {},
              },
            },
            markdown = true,
            cmp = true,
            gitsigns = true,
            telescope = true,
          },
  
          styles = {
            comments = { "italic" },
            conditionals = { "bold" },
            loops = {},
            functions = { "bold" },
            keywords = {},
            strings = {},
            variables = {},
          },
          -- temporary
        }
      end,
    },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "catppuccin",
      },
    },
  
    -- Modicator plugin (auto-color line number based on Vim mode)
    {
      "mawkler/modicator.nvim",
      dependencies = "catppuccin/nvim",
      init = function()
        -- Required for Modicator to work properly
        vim.o.cursorline = true
        vim.o.number = true
        vim.o.termguicolors = true
      end,
      opts = {},
    },
  }