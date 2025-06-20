
if true then return {} end
return {
    {
      "davidosomething/format-ts-errors.nvim",
      event = "VeryLazy",
      config = function()
        require("format-ts-errors").setup({
          add_markdown = true,
          start_indent_level = 0,
        })
      end,
    },
}  