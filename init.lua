-- bootstrap lazy.nvim, LazyVim and your plugins
vim.lsp.log.set_level("off")

_G.Utils = require("utils")

-- =============================================================================
-- Settings that ONLY apply in real Neovim (not VS Code/Antigravity/Cursor/Windsurf)
-- In Cursor: native Tab completion, LSP, diagnostics, and formatting are used.
-- blink.cmp, NeoCodeium, and other completion plugins are disabled via disable.lua.
-- =============================================================================
if not Utils.is_embedded then
  vim.env.CC = "clang"
  vim.env.CXX = "clang++"

  vim.g.blink_enabled = true

  vim.keymap.set("i", "<C-j>", function()
    require('blink.cmp').show()
  end, { silent = true, desc = "Trigger Blink completion" })

  vim.g.clipboard = {
    name = "win32yank",
    copy = { ["+"] = "win32yank.exe -i --crlf", ["*"] = "win32yank.exe -i --crlf" },
    paste = { ["+"] = "win32yank.exe -o --lf", ["*"] = "win32yank.exe -o --lf" },
    cache_enabled = 0,
  }
end

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
require("config.lazy")

-- =============================================================================
-- Neovide-specific settings (only when running inside Neovide)
-- =============================================================================
if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h9"
  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_profiler = false
  vim.g.neovide_cursor_animation_length = 0.1
  vim.g.neovide_cursor_trail_size = 0.2
  vim.g.neovide_scroll_animation_length = 0.2
  vim.g.neovide_hide_mouse_when_typing = true

  -- Neovide padding & visual effects (merged from old neovide.lua plugin)
  vim.o.linespace = 6
  vim.o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
  vim.o.winblend = 0
  vim.o.pumblend = 0
  vim.g.neovide_padding_top = 4
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  vim.g.neovide_opacity = 1
  vim.g.neovide_floating_blur_amount_x = 8
  vim.g.neovide_floating_blur_amount_y = 8
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_floating_z_height = 0
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 0
  vim.g.neovide_floating_corner_radius = 0
  vim.g.neovide_cursor_smooth_blink = true
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_cursor_vfx_particle_lifetime = 1
  vim.g.neovide_cursor_vfx_particle_density = 5

  -- Disable mini.animate with neovide
  vim.g.minianimate_disable = true
end
