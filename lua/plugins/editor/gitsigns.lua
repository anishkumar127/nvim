-- Gitsigns — git decorations in the sign column
return {
  {
    "lewis6991/gitsigns.nvim",
    opts = function(_, opts)
      opts.signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      }
      opts.signs_staged = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      }
      opts.on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, options)
          options = options or {}
          options.buffer = bufnr
          vim.keymap.set(mode, l, r, options)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal { "]c", bang = true }
          else
            gitsigns.nav_hunk("next")
          end
        end, { desc = "Jump to next git change" })

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal { "[c", bang = true }
          else
            gitsigns.nav_hunk("prev")
          end
        end, { desc = "Jump to previous git change" })

        -- Actions (visual mode)
        map("v", "<leader>ghs", function()
          gitsigns.stage_hunk { vim.fn.line("."), vim.fn.line("v") }
        end, { desc = "Git: Stage hunk" })
        map("v", "<leader>ghr", function()
          gitsigns.reset_hunk { vim.fn.line("."), vim.fn.line("v") }
        end, { desc = "Git: Reset hunk" })

        -- Actions (normal mode)
        map("n", "<leader>ghs", gitsigns.stage_hunk, { desc = "Git: Stage hunk" })
        map("n", "<leader>ghr", gitsigns.reset_hunk, { desc = "Git: Reset hunk" })
        map("n", "<leader>ghu", gitsigns.undo_stage_hunk, { desc = "Git: Undo stage" })
        map("n", "<leader>ghp", gitsigns.preview_hunk, { desc = "Git: Preview hunk" })
        map("n", "<leader>gbs", gitsigns.stage_buffer, { desc = "Git: Stage buffer" })
        map("n", "<leader>gbr", gitsigns.reset_buffer, { desc = "Git: Reset buffer" })
        -- Fixed: <leader>gbl was mapped to BOTH blame_line AND toggle_blame
        map("n", "<leader>gbl", gitsigns.blame_line, { desc = "Git: Blame line" })
        map("n", "<leader>gbt", gitsigns.toggle_current_line_blame, { desc = "Git: Toggle blame" })
        map("n", "<leader>gdi", gitsigns.diffthis, { desc = "Git: Diff index" })
        map("n", "<leader>gdc", function() gitsigns.diffthis("@") end, { desc = "Git: Diff commit" })
        map("n", "<leader>gds", gitsigns.toggle_deleted, { desc = "Git: Toggle deleted" })
      end
    end,
  },
}
