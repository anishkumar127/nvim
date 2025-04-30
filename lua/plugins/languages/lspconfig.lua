return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
        local setup_server = require("plugins.languages.lsp").setup_server
        setup_server("vtsls", require("plugins.languages.vtsls"))
        setup_server("tailwindcss", require("plugins.languages.tailwindcss"))
        -- setup_server("cssls", require("plugins.lsp.servers.cssls"))
        -- setup_server("eslint", require("plugins.lsp.servers.eslint"))
        -- setup_server("lua_ls", require("plugins.lsp.servers.lua_ls"))
        -- setup_server("gopls", require("plugins.lsp.servers.gopls"))
    end,
}