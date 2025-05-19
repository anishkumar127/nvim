
return {
  "mfussenegger/nvim-dap",
  dependencies = { "mxsdev/nvim-dap-vscode-js" },
  config = function()
    local dap, dapjs = require("dap"), require("dap-vscode-js")
    dapjs.setup({ adapters = { "pwa-node", "pwa-chrome" } })
    for _, language in ipairs({ "javascript", "typescript" }) do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch Node",
          program = "${file}",
          cwd = vim.fn.getcwd(),
        },
        {
          type = "pwa-chrome",
          request = "launch",
          name = "Debug in Chrome",
          url = "http://localhost:3000",
          webRoot = "${workspaceFolder}",
        },
      }
    end
    vim.keymap.set("n", "<F5>",     dap.continue)
    vim.keymap.set("n", "<F10>",    dap.step_over)
    vim.keymap.set("n", "<F11>",    dap.step_into)
    vim.keymap.set("n", "<F12>",    dap.step_out)
    vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end)
  end,
}