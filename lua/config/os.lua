
-- ~/.config/nvim/lua/config/os.lua
local uv     = vim.loop
local uname  = uv.os_uname()

local M = {}

M.is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
M.is_wsl     = vim.fn.has("wsl")   == 1                                    -- Neovim ≥ 0.9
            or (uname.release and uname.release:match "Microsoft")         -- fallback
            or vim.env.WSL_DISTRO_NAME ~= nil                              -- env var

return M
