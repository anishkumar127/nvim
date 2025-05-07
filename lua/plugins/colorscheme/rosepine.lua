-- if true then return {} end
-- return {
--     "rose-pine/neovim",
--     name = "rose-pine",
--     priority = 1000,
--     opts = {
--         dark_variant = "moon",
--         styles = {italic = false},
--         disable_italics = true,
--         dim_inactive_windows = false,
-- 					extend_background_behind_borders = false,
--         enable = {
--             terminal = true,
--             legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
--             migrations = true, -- Handle deprecated options automatically
--         },
--         palette = {
--             dawn = {
--                 no_bg = "#faf4ed",
--                 cursor_bg = "#000000",
--                 cursor_fg = "#ffffff",
--             },
--             moon = {
--                 gold = "#f6d5a7",
--                 foam = "#a1d1da",
--                 iris = "#d9c7ef",
--                 rose = "#ebbcba",
--                 pine = "#437e91",
--                 no_bg = "#000000",
--                 cursor_bg = "#ffffff",
--                 cursor_fg = "#000000",
--             },
--         },
--         highlight_groups = {
--             Normal = {bg = "no_bg"},
--             Cursor = {bg = "cursor_bg", fg = "cursor_fg"},
--             Directory = {fg = "foam", bold = false},
--             StatusLine = {bg = "surface", fg = "subtle"},
--             StatusLineTerm = {link = "StatusLine"},
--             StatusLineNC = {link = "StatusLine"},
--             --- gitsigns
--             StatusLineGitSignsAdd = {bg = "surface", fg = "pine"},
--             StatusLineGitSignsChange = {bg = "surface", fg = "gold"},
--             StatusLineGitSignsDelete = {bg = "surface", fg = "rose"},
--             --- diagnostics
--             StatusLineDiagnosticSignError = {bg = "surface", fg = "love"},
--             StatusLineDiagnosticSignWarn = {bg = "surface", fg = "gold"},
--             StatusLineDiagnosticSignInfo = {bg = "surface", fg = "foam"},
--             StatusLineDiagnosticSignHint = {bg = "surface", fg = "iris"},
--             StatusLineDiagnosticSignOk = {bg = "surface", fg = "pine"},
--         },
--     },
--     config = function()
--         vim.cmd.colorscheme("rose-pine")   -- activate the theme here
--       end,
-- }

	return {
		{
			"rose-pine/neovim",
			priority = 1000,
			config = function()
				require("rose-pine").setup({
					variant = "auto", -- auto, main, moon, or dawn
					dark_variant = "main", -- main, moon, or dawn
					dim_inactive_windows = false,
					extend_background_behind_borders = false,

					enable = {
						terminal = true,
						legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
						migrations = true, -- Handle deprecated options automatically
					},

					styles = {
						bold = true,
						italic = false,
						transparency = true,
					},

					groups = {
						border = "muted",
						link = "iris",
						panel = "surface",

						error = "love",
						hint = "iris",
						info = "foam",
						note = "pine",
						todo = "rose",
						warn = "gold",

						git_add = "foam",
						git_change = "rose",
						git_delete = "love",
						git_dirty = "rose",
						git_ignore = "muted",
						git_merge = "iris",
						git_rename = "pine",
						git_stage = "iris",
						git_text = "rose",
						git_untracked = "subtle",

						h1 = "iris",
						h2 = "foam",
						h3 = "rose",
						h4 = "gold",
						h5 = "pine",
						h6 = "foam",
					},

					highlight_groups = {
						-- Comment = { fg = "foam" },
						-- VertSplit = { fg = "muted", bg = "muted" },
						NormalFloat = { bg = "none" },
					},
				})

				vim.cmd("colorscheme rose-pine")
				-- vim.cmd("colorscheme rose-pine-main")
				-- vim.cmd("colorscheme rose-pine-moon")
				-- vim.cmd("colorscheme rose-pine-dawn")
			end,
		},
		{
			"LazyVim/LazyVim",
			opts = {
				colorscheme = "rose-pine-moon",
			},
		},
	}