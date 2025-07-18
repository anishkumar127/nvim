return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
        local setup_server = require("unused.lang.lsp").setup_server
        setup_server("vtsls", require("unused.lang.vtsls"))
        setup_server("tailwindcss", require("unused.lang.tailwindcss"))
        -- setup_server("cssls", require("plugins.lsp.servers.cssls"))
        -- setup_server("eslint", require("plugins.lsp.servers.eslint"))
        -- setup_server("lua_ls", require("plugins.lsp.servers.lua_ls"))
        -- setup_server("gopls", require("plugins.lsp.servers.gopls"))
    end,
}