-- if true then return {} end
-- ---@type vim.lsp.Config
-- return {
-- 	cmd = { 'tsgo', '--lsp', '--stdio' },
-- 	filetypes = {
-- 		'javascript',
-- 		'javascriptreact',
-- 		'javascript.jsx',
-- 		'typescript',
-- 		'typescriptreact',
-- 		'typescript.tsx',
-- 	},
-- 	root_markers = {
-- 		'tsconfig.json',
-- 		'jsconfig.json',
-- 		'package.json',
-- 		'.git',
-- 		'tsconfig.base.json',
-- 	},
-- }


---@type vim.lsp.Config
return {
  cmd = { "tsgo", "--lsp", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_markers = {
    "tsconfig.json",
    "jsconfig.json",
    "package.json",
    ".git",
    "tsconfig.base.json",
  },
}