-- NeoCodeium — AI code completion
-- Disabled in embedded environments (VS Code/Antigravity/Cursor/Windsurf)
-- because those editors have their own AI completion engines.
if _G.Utils and _G.Utils.is_embedded then return {} end

return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = function()
    local neocodeium = require("neocodeium")

    neocodeium.setup({})

    -- Accept the full suggestion
    vim.keymap.set("i", "<A-f>", function() neocodeium.accept() end, { desc = "NeoCodeium: Accept suggestion" })

    -- Accept word / line
    vim.keymap.set("i", "<A-w>", function() neocodeium.accept_word() end, { desc = "NeoCodeium: Accept word" })
    vim.keymap.set("i", "<A-a>", function() neocodeium.accept_line() end, { desc = "NeoCodeium: Accept line" })

    -- Cycle through suggestions
    vim.keymap.set("i", "<A-e>", function() neocodeium.cycle_or_complete() end, { desc = "NeoCodeium: Cycle suggestions" })

    -- Clear current suggestion
    vim.keymap.set("i", "<A-c>", function() neocodeium.clear() end, { desc = "NeoCodeium: Clear suggestion" })
  end,
}