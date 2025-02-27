return {
	{
		'stevearc/conform.nvim',
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			formatters_by_ft = {
				lua = { 'stylua' },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
			},
			format_on_save = false, -- This disables formatting on save
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
