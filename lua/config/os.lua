-- ~/.config/nvim/lua/config/os.lua
local uv    = vim.uv or vim.loop
local uname = uv.os_uname()

local M = {}

M.is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
M.is_wsl     = vim.fn.has("wsl")   == 1                                    -- Neovim ≥ 0.9
            or (uname.release and uname.release:match "Microsoft")         -- fallback
            or vim.env.WSL_DISTRO_NAME ~= nil                              -- env var

--- Resolve a PowerShell executable to an absolute path (works when PATH is minimal).
---@return string?
function M.resolve_powershell()
  for _, name in ipairs({ "pwsh", "pwsh.exe", "powershell", "powershell.exe" }) do
    if vim.fn.executable(name) == 1 then
      return vim.fn.exepath(name)
    end
  end

  local candidates = {
    "C:/Program Files/PowerShell/7/pwsh.exe",
    "C:/Program Files (x86)/PowerShell/7/pwsh.exe",
    "C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe",
  }
  for _, path in ipairs(candidates) do
    if uv.fs_stat(path) then
      return path
    end
  end
end

--- Configure vim.o.shell for PowerShell on native Windows.
function M.setup_powershell()
  if not M.is_windows or M.is_wsl then
    return
  end

  local shell = M.resolve_powershell()
  if not shell then
    return
  end

  vim.o.shell = shell
  vim.o.shellcmdflag =
    "-NoProfile -NoLogo -NonInteractive -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';$PSStyle.OutputRendering='plaintext';Remove-Alias -Force -ErrorAction SilentlyContinue tee;"
  vim.o.shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
  vim.o.shellpipe = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
end

return M
