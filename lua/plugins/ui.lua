return {
  -- {
  --   "catppuccin/nvim",
  --   event = "BufRead",
  --   name = "catppuccin",
  --   opts = {
  --     -- transparent_background = true,
  --   },
  -- },
  {
    "mvllow/modes.nvim",
    enabled = true,
    config = function()
      require("modes").setup({
        line_opacity = 0.50,
        set_cursorline = false,
        -- set_cursor = true,
        ignore_filetypes = { "NvimTree", "TelescopePrompt", "dashboard", "minifiles" },
      })
    end,
  },
  {
    -- BUG: need to check this its show inline error when hover to line..
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000, -- needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "modern",
  --       hi = {
	-- 	error = "DiagnosticError",
	-- 	warn = "DiagnosticWarn",
	-- 	info = "DiagnosticInfo",
	-- 	hint = "DiagnosticHint",
	-- 	arrow = "NonText",
	-- 	background = "CursorLine", -- Can be a highlight or a hexadecimal color (#RRGGBB)
	-- 	mixing_color = "None", -- Can be None or a hexadecimal color (#RRGGBB). Used to blend the background color with the diagnostic background color with another color.
	-- },
        options = {
          show_source = true,
          use_icons_from_diagnostic = true,
              --       overflow = {
		-- 	-- Manage the overflow of the message.
		-- 	--    - wrap: when the message is too long, it is then displayed on multiple lines.
		-- 	--    - none: the message will not be truncated.
		-- 	--    - oneline: message will be displayed entirely on one line.
		-- 	mode = "wrap",
		-- },
		-- Filter by severity.
		-- severity = {
		-- 	vim.diagnostic.severity.ERROR,
		-- 	vim.diagnostic.severity.WARN,
		-- 	vim.diagnostic.severity.INFO,
		-- 	vim.diagnostic.severity.HINT,
		-- },
      },
      })
    end,
  },
}