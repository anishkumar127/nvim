if true then return {} end

-- Show context of the current function
return {
  "nvim-treesitter/nvim-treesitter-context",
  enabled = false,
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  opts = function()
    local tsc = require("treesitter-context")
    Snacks.toggle({
      name = "Treesitter Context",
      get = tsc.enabled,
      set = function(state)
        if state then
          tsc.enable()
        else
          tsc.disable()
        end
      end,
    }):map("<leader>ut")
    return { mode = "cursor", max_lines = 3 }
  end,
}
