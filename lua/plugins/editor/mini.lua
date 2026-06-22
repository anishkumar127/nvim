-- Mini.nvim configuration (ai, surround, move, statusline)
if _G.Utils and _G.Utils.is_embedded then return {} end

return {
  {
    "nvim-mini/mini.nvim",
    event = "VeryLazy",
    config = function()
      -- mini.ai — enhanced text objects
      require("mini.ai").setup {
        n_lines = 500,
      }

      -- mini.surround — add/delete/replace surroundings
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

      -- mini.move — move lines/selections with H/J/K/L
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

      -- mini.statusline
      local statusline = require("mini.statusline")

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return "%2l:%-2v"
      end

      statusline.setup {
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

            -- Show DAP status if nvim-dap is loaded and active
            local dap_status = ""
            if package.loaded["dap"] then
              local ok, dap = pcall(require, "dap")
              if ok and dap.status() ~= "" then
                dap_status = "  " .. dap.status()
              end
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

      -- Highlight groups for transparent statusline
      local highlights = {
        { group = "StatusLine",         opts = { bg = "none", fg = "#d8dee9" } },
        { group = "StatusLineNC",       opts = { bg = "none", fg = "#5c6370" } },
        { group = "StatusLineTerm",     opts = { bg = "none", fg = "#d8dee9" } },
        { group = "StatusLineTermNC",   opts = { bg = "none", fg = "#5c6370" } },

        { group = "MiniStatuslineModeNormal",   opts = { fg = "#54C1DB", bg = "none", bold = true } },
        { group = "MiniStatuslineModeInsert",   opts = { fg = "#A9DD48", bg = "none", bold = true } },
        { group = "MiniStatuslineModeVisual",   opts = { fg = "#FD77DD", bg = "none", bold = true } },
        { group = "MiniStatuslineModeReplace",  opts = { fg = "#ff3045", bg = "none", bold = true } },
        { group = "MiniStatuslineModeCommand",  opts = { fg = "#f5dd58", bg = "none", bold = true } },
        { group = "MiniStatuslineModeTerminal", opts = { fg = "#A9DD48", bg = "none", bold = true } },

        { group = "MiniStatuslineFilename", opts = { fg = "#d8dee9", bg = "none" } },
        { group = "MiniStatuslineInactive", opts = { fg = "#100F14", bg = "none" } },

        { group = "MiniStatuslineError", opts = { fg = "#ff5555", bg = "none", bold = true } },
        { group = "MiniStatuslineWarn",  opts = { fg = "#f5dd58", bg = "none", bold = true } },
      }

      for _, h in ipairs(highlights) do
        vim.api.nvim_set_hl(0, h.group, h.opts)
      end
    end,
  },
}
