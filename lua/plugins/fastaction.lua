-- Tiny Code Action — enhanced code action UI
if _G.Utils and _G.Utils.is_embedded then return {} end

return {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        {
          "folke/snacks.nvim",
          opts = {
            terminal = {},
          },
        },
    },
    event = "LspAttach",
    opts = {
        picker = "snacks",
    },
}