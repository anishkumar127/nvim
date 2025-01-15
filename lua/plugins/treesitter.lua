return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "cmake",
        "css",
        "diff",
        "gitignore",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
        "sql",
        "tsx",
        "typescript",
        "yaml",
      },
      config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)

        -- MDX
        vim.filetype.add({
          extension = {
            mdx = "mdx",
          },
        })
        vim.treesitter.language.register("markdown", "mdx")
      end,
    },
  },
  {
    "nvim-treesitter/playground",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = false,
  },
}
