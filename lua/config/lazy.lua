local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim",                                   import = "lazyvim.plugins" },
    -- import any extras modules here
    -- { import = "lazyvim.plugins.extras.editor.harpoon2" },
    -- { import = "lazyvim.plugins.extras.editor.aerial" },
    -- { import = "lazyvim.plugins.extras.editor.navic" },
    -- { import = "lazyvim.plugins.extras.editor.refactoring" },
    { import = "lazyvim.plugins.extras.lang.json" },
    -- ! comment out but maybe in future need to uncomment for working of custom.
    -- { import = "lazyvim.plugins.extras.dap.core" },
    -- { import = "lazyvim.plugins.extras.editor.fzf" },
    -- { import = "lazyvim.plugins.extras.formatting.prettier" },
    -- { import = "lazyvim.plugins.extras.lang.markdown" },
    -- { import = "lazyvim.plugins.extras.lang.tailwind" },
    -- { import = "lazyvim.plugins.extras.lang.typescript" },
    -- { import = "lazyvim.plugins.extras.ui.treesitter-context" },
    -- { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
    -- { import = "lazyvim.plugins.extras.test.core" },
    -- { import = "lazyvim.plugins.extras.lang.yaml" },
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.util.dot" },
    { import = "lazyvim.plugins.extras.vscode" },
    -- { import = 'plugins.editor.lazygit' },
    -- { import = 'plugins.editor.gitsigns' },
    -- { import = 'plugins.editor.grug-far' },
    -- { import = 'plugins.editor.indent-line' },
    -- { import = 'plugins.editor.snacks' },
    -- My new import
    -- custom
    { import = 'plugins.coding.inc-rename' },
    -- { import = 'plugins.coding.todo-comments' },
    { import = 'plugins.coding.treesitter' },
    { import = 'plugins.coding.trouble' },
    -- { import = 'plugins.linting.core' },
    -- { import = 'plugins.test.core' },
    -- { import = 'plugins.ui.treesitter-context' },
    { import = 'plugins.util.mini-hipatterns' },
    -- { import = 'plugins.dap.core' },
    -- { import = 'plugins.editor.snacks' },
    { import = 'plugins.editor.gitsigns' },
    { import = 'plugins.editor.grug-far' },
    -- { import = 'plugins.editor.indent-line' },
    { import = 'plugins.editor.lazygit' },
    { import = 'plugins.editor.mini' },
    -- { import = 'plugins.editor.overseer' },
    -- { import = 'plugins.editor.fzf' },
    -- { import = 'plugins.formatting.conform' },
    -- { import = 'plugins.formatting.prettier' },
    { import = 'plugins.terminal.toggleterminal' },
    -- { import = 'plugins.languages.markdown' },
    -- { import = 'plugins.languages.mdx' },
    { import = 'plugins.languages.typescript' },

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
    install = {colorscheme = {} },
  checker = { enabled = true, notify = false }, -- automatically check for plugin updates
  performance = {
    -- cache = { enabled = true },
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
        'spellfile',
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- vim.cmd("highlight Visual ctermbg=0 guibg=#6441A5")

-- Adjust timeout settings
vim.o.timeoutlen = 300 -- Wait 500 ms for key sequences (lower than default)
vim.o.ttimeoutlen = 10 -- Wait 10 ms for terminal key codes (very short timeout)
