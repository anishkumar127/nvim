-- if true then return {} end
return {
	{
		"m4xshen/hardtime.nvim",
		lazy = false,
		dependencies = {
			{
				"rcarriga/nvim-notify",
				config = function()
					vim.notify = require("notify")
				end,
			},
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "<leader>ht", "<cmd>Hardtime toggle<CR>", desc = "Toggle Hardtime" },
		},
		opts = {
			hint = true,
			disabled_keys = {
				["<Up>"]    = {},
				["<Down>"]  = {},
				["<Left>"]  = {},
				["<Right>"] = {},
				["<C-n>"]   = { "n", "x", "o" },
				["<C-p>"]   = { "n", "x", "o" },
				-- ["<C-n>"]   = false,
				-- ["<C-p>"]   = false,
				-- ["<C-N>"]   = false,
				-- ["<C-P>"]   = false,
				-- ["CTRL-N"]  = false,
				-- ["CTRL-P"]  = false,
				-- ["<C-n>"] = { "n", "x" },
				-- ["<C-p>"] = { "n", "x" },
				-- ["<C-n>"]   = false,   -- allow Ctrl-n :contentReference[oaicite:0]{index=0}
				-- ["<C-p>"]   = false,   -- allow Ctrl-p :contentReference[oaicite:1]{index=1}
				--    ["<C-n>"] = { "n" },
				-- ["<C-p>"] = { "n" },
			},
		},
	},
}
