
return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = function()
    local neocodeium = require("neocodeium")

    -- 1. Run the setup function
    neocodeium.setup({
      -- You can add any custom options from the documentation here
      -- For example, to disable the "NeoCodeium: server started..." message:
      -- silent = true,
    })

    -- 2. Set your keymaps
    -- It is recommended to use Alt (A-) or another modifier key to avoid
    -- conflicts with other plugins like nvim-cmp or snippets.

    -- Accept the full suggestion
    vim.keymap.set("i", "<A-f>", function() neocodeium.accept() end, { desc = "NeoCodeium: Accept suggestion" })

    -- Accept the next word of the suggestion
    vim.keymap.set("i", "<A-w>", function() neocodeium.accept_word() end, { desc = "NeoCodeium: Accept word" })
    vim.keymap.set("i", "<A-a>", function() neocodeium.accept_line() end, { desc = "NeoCodeium: Accept line" })

    -- Cycle through available suggestions
    vim.keymap.set("i", "<A-e>", function() neocodeium.cycle_or_complete() end, { desc = "NeoCodeium: Cycle suggestions" })

    -- Clear the current suggestion
    vim.keymap.set("i", "<A-c>", function() neocodeium.clear() end, { desc = "NeoCodeium: Clear suggestion" })


  end,
}