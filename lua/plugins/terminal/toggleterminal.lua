-- ToggleTerm — terminal management
if _G.Utils and _G.Utils.is_embedded then return {} end

return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      local os = require("config.os")

      -- Apply PowerShell tweaks only on real Windows (not WSL)
      if os.is_windows and not os.is_wsl then
        local powershell_opts = {
          shell        = "pwsh.exe -nologo",
          shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned " ..
                         "-Command [Console]::InputEncoding=[Console]::" ..
                         "OutputEncoding=[System.Text.Encoding]::UTF8;",
          shellredir   = "-RedirectStandardOutput %s -NoNewWindow -Wait",
          shellpipe    = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
          shellquote   = "",
          shellxquote  = "",
        }
        for k, v in pairs(powershell_opts) do
          vim.opt[k] = v
        end
      end

      require("toggleterm").setup({})

      local map = vim.keymap.set
      map({ "n", "t" }, "<leader>vt",
          "<cmd>ToggleTerm size=60 direction=vertical<cr>",
          { desc = "Vertical terminal" })

      map({ "n", "t" }, "<leader>ft",
          "<cmd>ToggleTerm direction=float<cr>",
          { desc = "Floating terminal" })
    end,
  },
}
