if true then return {} end;
-- return {
--   -- ➊ Pull in the adapter that makes nvim-dap speak js-debug
--   {
--     "mxsdev/nvim-dap-vscode-js",
--     dependencies = {
--       "mfussenegger/nvim-dap",
--       "williamboman/mason.nvim",
--     },
--     config = function()
--       --------------------------------------------------------------------
--       -- ➋ Point the adapter at the js-debug build installed by Mason
--       --------------------------------------------------------------------
--       local mason_registry = require("mason-registry")
--       local debugger_pkg = mason_registry.get_package("js-debug-adapter")
--       local debugger_path = debugger_pkg:get_install_path()

--       require("dap-vscode-js").setup({
--         debugger_path = debugger_path,
--         -- exactly the adapters we used in VS Code
--         adapters = { "pwa-node", "node", "pwa-chrome", "chrome" },
--       })

--       --------------------------------------------------------------------
--       -- ➌ Copy the two launch configs from launch.json
--       --------------------------------------------------------------------
--       local dap = require("dap")
--       local js_based_languages = {
--         "javascript",
--         "typescript",
--         "javascriptreact",
--         "typescriptreact",
--       }

--       for _, lang in ipairs(js_based_languages) do
--         dap.configurations[lang] = {
--           -- ---- pnpm run dev (server) ----
--           {
--             type = "pwa-node",
--             request = "launch",
--             name = "pnpm run dev (server)",
--             runtimeExecutable = "pnpm",
--             runtimeArgs = { "dev" },
--             cwd = vim.fn.getcwd(),
--             console = "integratedTerminal",
--             autoAttachChildProcesses = true,
--             skipFiles = { "<node_internals>/**" },
--             sourceMaps = true,
--           },
--           -- ---- Chrome pointing at http://localhost:3000 ----
--           {
--             type = "pwa-chrome",
--             request = "launch",
--             name = "Chrome: localhost:3000",
--             url = "http://localhost:3000",
--             webRoot = "${workspaceFolder}",
--           },
--         }
--       end
--     end,
--   },
-- }


-- return {
--   -- ➊ Pull in the adapter that makes nvim-dap speak js-debug
--   {
--     "mxsdev/nvim-dap-vscode-js",
--     dependencies = {
--       "mfussenegger/nvim-dap",
--       "williamboman/mason.nvim",
--     },
--     config = function()
--       --------------------------------------------------------------------
--       -- ➋ Point the adapter at the js-debug build installed by Mason
--       --------------------------------------------------------------------
--       local mason_registry = require("mason-registry")
--       local debugger_pkg = mason_registry.get_package("js-debug-adapter")
--       local debugger_path = debugger_pkg:get_install_path()

--       require("dap-vscode-js").setup({
--         debugger_path = debugger_path,
--         -- exactly the adapters we used in VS Code
--         adapters = { "pwa-node", "node", "pwa-chrome", "chrome" },
--       })

--       --------------------------------------------------------------------
--       -- ➌ Copy the two launch configs from launch.json
--       --------------------------------------------------------------------
--       local dap = require("dap")
--       local js_based_languages = {
--         "javascript",
--         "typescript",
--         "javascriptreact",
--         "typescriptreact",
--       }

--       for _, lang in ipairs(js_based_languages) do
--         dap.configurations[lang] = {
--           -- ---- pnpm run dev (server) ----
--           {
--             type = "pwa-node",
--             request = "launch",
--             name = "pnpm run dev (server)",
--             runtimeExecutable = "pnpm",
--             runtimeArgs = { "dev" },
--             cwd = vim.fn.getcwd(),
--             console = "integratedTerminal",
--             autoAttachChildProcesses = true,
--             skipFiles = { "<node_internals>/**" },
--             sourceMaps = true,
--           },
--           -- ---- Chrome pointing at http://localhost:3000 ----
--           {
--             type = "pwa-chrome",
--             request = "launch",
--             name = "Chrome: localhost:3000",
--             url = "http://localhost:3000",
--             webRoot = "${workspaceFolder}",
--           },
--         }
--       end
--     end,
--   },
-- }



return {
  ---------------------------------------------------------------------------
  -- 1. Turn on nvim-dap + key-maps (LazyVim “DAP extra”)
  ---------------------------------------------------------------------------
  { import = "lazyvim.plugins.extras.dap.core" },

  ---------------------------------------------------------------------------
  -- 2. Install the VS Code-style JS debugger and point it at VS Code’s copy
  ---------------------------------------------------------------------------
  {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap-vscode-js").setup({
        -- ← YOUR local path to VS Code’s built-in debugger
        debugger_path = "C:\\Users\\AnishKumar\\AppData\\Local\\nvim-data\\mason\\packages\\js-debug-adapter\\js-debug\\src\\dapDebugServer.js",
                
        -- expose the adapters you’ll use in `dap.configurations`
        adapters = { "pwa-node", "pwa-chrome", "node2", "chrome" },
      })

      ---------------------------------------------------------------------
      -- 3. (optional) Copy the two launch configs from launch.json
      ---------------------------------------------------------------------
      local dap = require("dap")
      for _, lang in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
        dap.configurations[lang] = {
          {
            name = "pnpm run dev (server)",
            type = "pwa-node",
            request = "launch",
            runtimeExecutable = "pnpm",
            runtimeArgs = { "dev" },
            cwd = vim.fn.getcwd(),
            autoAttachChildProcesses = true,
            sourceMaps = true,
            skipFiles = { "<node_internals>/**" },
          },
          {
            name = "Chrome: localhost:3000",
            type = "pwa-chrome",
            request = "launch",
            url = "http://localhost:3000",
            webRoot = "${workspaceFolder}",
          },
        }
      end
    end,
  },
}