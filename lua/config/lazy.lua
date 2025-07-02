local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
-- vim.cmd.colorscheme("rose-pine")
-- vim.cmd("colorscheme rose-pine")
require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim",                         import = "lazyvim.plugins" },
    -- My new import
    -- custom
    { import = 'plugins.colorscheme' },
    { import = 'plugins.editor' },
    { import = "plugins.ui"},
    { import = 'plugins.old' },
    { import = 'plugins.coding.inc-rename' },
    { import = 'plugins.formatting.conform' },
    { import = 'plugins.terminal.toggleterminal' },
    { import = 'plugins.languages.typescript2' },
    -- { import = 'plugins.util.mini-hipatterns' },

    -- import/override with your plugins
    { import = "plugins" },

  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  --
  install = { colorscheme = { "rose-pine-moon" } },
  -- install = { colorscheme = { "kanagawa" }},
  -- install = {
  --   -- missing = true,
  --   colorscheme = {
  --     -- "catppuccin",
  --     -- -- "tokyonight",
  --     -- "habamax",
  --   },
  --  },
  checker = { enabled = true, notify = false }, -- automatically check for plugin updates
  performance = {
    cache = { enabled = true },
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        -- new disable
        --[[ "2html_plugin",
				"bugreport",
				"compiler",
				"ftplugin",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"matchit",
				"matchparen",
				"netrw",
				"netrwFileHandlers",
				"netrwPlugin",
				"netrwSettings",
				"optwin",
				"rplugin",
				"rrhelper",
				"spellfile_plugin",
				"synmenu",
				"syntax",
				"tar",
				"tarPlugin",
				"tohtml",
				"tutor",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin", ]]
        -- new disable
        -- 'shada',
        -- 'spellfile',
        -- "matchit",
        -- "matchparen",
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        -- new disable

        -- "2html_plugin",
        -- "bugreport",
        -- "compiler",
        -- "ftplugin",
        -- "fzf",
        -- "getscript",
        -- "getscriptPlugin",
        -- "gzip",
        -- "logipat",
        -- "matchit",
        -- "optwin",
        -- "rplugin",
        -- "rrhelper",
        -- "spellfile_plugin",
        -- "synmenu",
        -- "syntax",
        -- "tar",
        -- "tarPlugin",
        -- "tohtml",
        -- "tutor",
        -- "vimball",
        -- "vimballPlugin",
        -- "zip",
        -- "zipPlugin",
        -- "ruby",
        -- "gem",
      },
    },
  },
  --   ui = {
  --     border = "single",
  --     size = {
  --         width = 0.7,
  --         height = 0.7,
  --     },
  -- },

})

-- vim.cmd("highlight Visual ctermbg=0 guibg=#6441A5")

-- Adjust timeout settings
-- vim.o.timeoutlen = 300 -- Wait 500 ms for key sequences (lower than default)
-- vim.o.ttimeoutlen = 10 -- Wait 10 ms for terminal key codes (very short timeout)
