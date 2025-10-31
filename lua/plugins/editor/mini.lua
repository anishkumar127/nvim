-- if vim.g.vscode then return end;
-- return {
--   {
--     'echasnovski/mini.nvim',
--     config = function()
--       require('mini.ai').setup { n_lines = 500 }

--       require('mini.surround').setup {
--         mappings = {
--           add = 'gza',
--           delete = 'gzd',
--           find = 'gzf',
--           find_left = 'gzF',
--           highlight = 'gzh',
--           replace = 'gzr',
--           update_n_lines = 'gsn',
--           suffix_last = 'gzl', -- Suffix to search with "prev" method
--           suffix_next = 'gn',  -- Suffix to search with "next" method
--         },
--       }

--       require('mini.move').setup {
--         mappings = {
--           left = 'H',
--           right = 'L',
--           down = 'J',
--           up = 'K',
--           line_left = '',
--           line_right = '',
--           line_down = '',
--           line_up = '',
--         },
--       }

--       local statusline = require 'mini.statusline'
--       statusline.setup {
--         use_icons = vim.g.have_nerd_font,
--         content = {
--           active = function()
--             local mode, mode_hl =
--                 MiniStatusline.section_mode { trunc_width = 120 }
--             local git = MiniStatusline.section_git { trunc_width = 40 }
--             local diff = MiniStatusline.section_diff { trunc_width = 75 }
--             local diagnostics =
--                 MiniStatusline.section_diagnostics { trunc_width = 75 }
--             local lsp = MiniStatusline.section_lsp { trunc_width = 75 }
--             local filename =
--                 MiniStatusline.section_filename { trunc_width = 140 }
--             local location =
--                 MiniStatusline.section_location { trunc_width = 75 }
--             local search =
--                 MiniStatusline.section_searchcount { trunc_width = 75 }

--             local dap_status = ''
--             if package.loaded['dap'] and require('dap').status() ~= '' then
--               dap_status = '  ' .. require('dap').status()
--             end

--             return MiniStatusline.combine_groups {
--               { hl = mode_hl,                  strings = { mode } },
--               {
--                 hl = 'MiniStatuslineDevinfo',
--                 strings = { git, diff, diagnostics, lsp },
--               },
--               '%<', -- Mark general truncate point
--               { hl = 'MiniStatuslineFilename', strings = { filename } },
--               '%=', -- End left alignment
--               { hl = 'MiniStarterItemPrefix', strings = { dap_status } },
--               { hl = mode_hl,                 strings = { search, location } },
--             }
--           end,
--         },
--       }

--       -- Transparent backgrounds
--       vim.api.nvim_set_hl(0, "StatusLine", { bg = "none", fg = "#d8dee9" })
--       vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none", fg = "#5c6370" })
--       vim.api.nvim_set_hl(0, "StatusLineTerm", { bg = "none", fg = "#d8dee9" })
--       vim.api.nvim_set_hl(0, "StatusLineTermNC", { bg = "none", fg = "#5c6370" })

--       -- Mode-specific text colors (text only, no backgrounds)
--       vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { fg = "#54C1DB", bg = "none", bold = true })
--       vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", { fg = "#A9DD48", bg = "none", bold = true })
--       vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", { fg = "#FD77DD", bg = "none", bold = true })
--       vim.api.nvim_set_hl(0, "MiniStatuslineModeReplace", { fg = "#ff3045", bg = "none", bold = true })
--       vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", { fg = "#f5dd58", bg = "none", bold = true })
--       vim.api.nvim_set_hl(0, "MiniStatuslineModeTerminal", { fg = "#A9DD48", bg = "none", bold = true })
--       -- Transparent center section (filename)
--       vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { fg = "#d8dee9", bg = "none" })
--       -- Inactive window statusline
--       vim.api.nvim_set_hl(0, "MiniStatuslineInactive", { fg = "#100F14", bg = "none" })
--       -- error and warning
--       vim.api.nvim_set_hl(0, "MiniStatuslineError", { fg = "#ff5555", bg = "none", bold = true })
--       vim.api.nvim_set_hl(0, "MiniStatuslineWarn", { fg = "#f5dd58", bg = "none", bold = true })

--       -- You can configure sections in the statusline by overriding their
--       -- default behavior. For example, here we set the section for
--       -- cursor location to LINE:COLUMN
--       ---@diagnostic disable-next-line: duplicate-set-field
--       statusline.section_location = function()
--         return '%2l:%-2v'
--       end
--     end,
--   },
-- }


return {
  {
    -- "echasnovski/mini.nvim",
    "nvim-mini/mini.nvim",
    config = function()
      -- 1. Mini modules configuration

      -- mini.ai
      require("mini.ai").setup {
        n_lines = 500,
      }

      -- mini.surround
      require("mini.surround").setup {
        mappings = {
          add = "gza",
          delete = "gzd",
          find = "gzf",
          find_left = "gzF",
          highlight = "gzh",
          replace = "gzr",
          update_n_lines = "gsn",
          suffix_last = "gzl",
          suffix_next = "gn",
        },
      }

      -- mini.move
      require("mini.move").setup {
        mappings = {
          left = "H",
          right = "L",
          down = "J",
          up = "K",
          line_left = "",
          line_right = "",
          line_down = "",
          line_up = "",
        },
      }

      -- 2. Mini statusline configuration
      local statusline = require("mini.statusline")

      -- Override default section for location
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        -- Example: show line:column with 2-digit padding
        return "%2l:%-2v"
      end

      statusline.setup {
        -- Fallback to `false` if `vim.g.have_nerd_font` isn’t defined
        use_icons = (vim.g.have_nerd_font == true),

        content = {
          active = function()
            local mode, mode_hl    = statusline.section_mode { trunc_width = 120 }
            local git              = statusline.section_git { trunc_width = 40 }
            local diff             = statusline.section_diff { trunc_width = 75 }
            local diagnostics      = statusline.section_diagnostics { trunc_width = 75 }
            local lsp              = statusline.section_lsp { trunc_width = 75 }
            local filename         = statusline.section_filename { trunc_width = 140 }
            local location         = statusline.section_location { trunc_width = 75 }
            local search           = statusline.section_searchcount { trunc_width = 75 }

            -- If nvim-dap is loaded and has status text, display it
            local dap_status = ""
            if package.loaded["dap"] and require("unused.dap.dap").status() ~= "" then
              dap_status = "  " .. require("unused.dap.dap").status()
            end

            return statusline.combine_groups {
              { hl = mode_hl, strings = { mode } },
              { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
              "%<", -- Mark general truncate point
              { hl = "MiniStatuslineFilename", strings = { filename } },
              "%=", -- End left alignment
              { hl = "MiniStarterItemPrefix", strings = { dap_status } },
              { hl = mode_hl, strings = { search, location } },
            }
          end,
        },
      }

      -- 3. Highlight groups
      local highlights = {
        -- Default statuslines
        { group = "StatusLine",         opts = { bg = "none", fg = "#d8dee9" } },
        { group = "StatusLineNC",       opts = { bg = "none", fg = "#5c6370" } },
        { group = "StatusLineTerm",     opts = { bg = "none", fg = "#d8dee9" } },
        { group = "StatusLineTermNC",   opts = { bg = "none", fg = "#5c6370" } },

        -- Mode highlights
        { group = "MiniStatuslineModeNormal",   opts = { fg = "#54C1DB", bg = "none", bold = true } },
        { group = "MiniStatuslineModeInsert",   opts = { fg = "#A9DD48", bg = "none", bold = true } },
        { group = "MiniStatuslineModeVisual",   opts = { fg = "#FD77DD", bg = "none", bold = true } },
        { group = "MiniStatuslineModeReplace",  opts = { fg = "#ff3045", bg = "none", bold = true } },
        { group = "MiniStatuslineModeCommand",  opts = { fg = "#f5dd58", bg = "none", bold = true } },
        { group = "MiniStatuslineModeTerminal", opts = { fg = "#A9DD48", bg = "none", bold = true } },

        -- Mid-sections
        { group = "MiniStatuslineFilename", opts = { fg = "#d8dee9", bg = "none" } },
        { group = "MiniStatuslineInactive", opts = { fg = "#100F14", bg = "none" } },

        -- Error / Warn
        { group = "MiniStatuslineError", opts = { fg = "#ff5555", bg = "none", bold = true } },
        { group = "MiniStatuslineWarn",  opts = { fg = "#f5dd58", bg = "none", bold = true } },
      }

      for _, h in ipairs(highlights) do
        vim.api.nvim_set_hl(0, h.group, h.opts)
      end
    end,
  },
}
