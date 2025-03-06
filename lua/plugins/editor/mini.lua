return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }

      require('mini.surround').setup {
        mappings = {
          add = 'gza',
          delete = 'gzd',
          find = 'gzf',
          find_left = 'gzF',
          highlight = 'gzh',
          replace = 'gzr',
          update_n_lines = 'gsn',
          suffix_last = 'gzl', -- Suffix to search with "prev" method
          suffix_next = 'gn',  -- Suffix to search with "next" method
        },
      }

      require('mini.move').setup {
        mappings = {
          left = 'H',
          right = 'L',
          down = 'J',
          up = 'K',
          line_left = '',
          line_right = '',
          line_down = '',
          line_up = '',
        },
      }

      local statusline = require 'mini.statusline'
      statusline.setup {
        use_icons = vim.g.have_nerd_font,
        content = {
          active = function()
            local mode, mode_hl =
                MiniStatusline.section_mode { trunc_width = 120 }
            local git = MiniStatusline.section_git { trunc_width = 40 }
            local diff = MiniStatusline.section_diff { trunc_width = 75 }
            local diagnostics =
                MiniStatusline.section_diagnostics { trunc_width = 75 }
            local lsp = MiniStatusline.section_lsp { trunc_width = 75 }
            local filename =
                MiniStatusline.section_filename { trunc_width = 140 }
            local location =
                MiniStatusline.section_location { trunc_width = 75 }
            local search =
                MiniStatusline.section_searchcount { trunc_width = 75 }

            local dap_status = ''
            if package.loaded['dap'] and require('dap').status() ~= '' then
              dap_status = '  ' .. require('dap').status()
            end

            return MiniStatusline.combine_groups {
              { hl = mode_hl,                  strings = { mode } },
              {
                hl = 'MiniStatuslineDevinfo',
                strings = { git, diff, diagnostics, lsp },
              },
              '%<', -- Mark general truncate point
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=', -- End left alignment
              { hl = 'MiniStarterItemPrefix', strings = { dap_status } },
              { hl = mode_hl,                 strings = { search, location } },
            }
          end,
        },
      }

      -- Transparent backgrounds
      vim.api.nvim_set_hl(0, "StatusLine", { bg = "none", fg = "#d8dee9" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none", fg = "#5c6370" })
      vim.api.nvim_set_hl(0, "StatusLineTerm", { bg = "none", fg = "#d8dee9" })
      vim.api.nvim_set_hl(0, "StatusLineTermNC", { bg = "none", fg = "#5c6370" })

      -- Mode-specific text colors (text only, no backgrounds)
      vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { fg = "#54C1DB", bg = "none", bold = true })
      vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", { fg = "#A9DD48", bg = "none", bold = true })
      vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", { fg = "#FD77DD", bg = "none", bold = true })
      vim.api.nvim_set_hl(0, "MiniStatuslineModeReplace", { fg = "#ff3045", bg = "none", bold = true })
      vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", { fg = "#f5dd58", bg = "none", bold = true })
      vim.api.nvim_set_hl(0, "MiniStatuslineModeTerminal", { fg = "#A9DD48", bg = "none", bold = true })
      -- Transparent center section (filename)
      vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { fg = "#d8dee9", bg = "none" })
      -- Inactive window statusline
      vim.api.nvim_set_hl(0, "MiniStatuslineInactive", { fg = "#100F14", bg = "none" })
      -- error and warning
      vim.api.nvim_set_hl(0, "MiniStatuslineError", { fg = "#ff5555", bg = "none", bold = true })
      vim.api.nvim_set_hl(0, "MiniStatuslineWarn", { fg = "#f5dd58", bg = "none", bold = true })

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },
}
