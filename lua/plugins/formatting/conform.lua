if vim.g.vscode then return end;
-- return {
-- 	{
-- 		'stevearc/conform.nvim',
-- 		event = { "BufReadPre", "BufNewFile" },
-- 		opts = {
-- 			-- formatters_by_ft = {
-- 			-- 	javascript = { "prettier" },
-- 			-- 	typescript = { "prettier" },
-- 			-- 	javascriptreact = { "prettier" },
-- 			-- 	typescriptreact = { "prettier" },
-- 			-- 	css = { "prettier" },
-- 			-- 	html = { "prettier" },
-- 			-- 	json = { "prettier" },
-- 			-- 	yaml = { "prettier" },
-- 			-- 	markdown = { "prettier" },
-- 			-- },
-- 			format_on_save = false, -- This disables formatting on save
-- 		},
-- 		keys = {
-- 			{
-- 				"<leader>mp",
-- 				function()
-- 					require("conform").format({
-- 						lsp_fallback = true,
-- 						async = true,
-- 					})
-- 				end,
-- 				desc = "Format file or range (in visual mode)",
-- 				mode = { "n", "v" },
-- 			},
-- 		},

-- 	},
-- }

return {
	{
	  "stevearc/conform.nvim",
	  event = { "BufReadPre", "BufNewFile" },
  
	  opts = {
		-- Use prettierd for every file type Prettier supports
		formatters_by_ft = {
		  javascript        = { "prettierd" },
		  typescript        = { "prettierd" },
		  javascriptreact   = { "prettierd" },
		  typescriptreact   = { "prettierd" },
		  css               = { "prettierd" },
		  html              = { "prettierd" },
		  json              = { "prettierd" },
		  yaml              = { "prettierd" },
		  markdown          = { "prettierd" },
		},
  
		-- Optional: make sure Conform never falls back to the
		-- local node_modules copy (avoids “path with spaces” issues)
		formatters = {
		  prettierd = {
			prefer_local = "never",                  -- <— key line
			command      = vim.fn.has("win32") == 1  -- Windows shim
						 and "prettierd.cmd"
						 or  "prettierd",
		  },
		},
  
		format_on_save = false,   -- keep your original setting
	  },
  
	  keys = {
		{
		  "<leader>mp",
		  function()
			require("conform").format({
			  lsp_fallback = true,
			  async = true,
			})
		  end,
		  desc = "Format file or range (in visual mode)",
		  mode = { "n", "v" },
		},
	  },
	},
  }
  