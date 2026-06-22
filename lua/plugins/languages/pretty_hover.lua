-- Pretty hover — enhanced LSP hover UI (standalone Neovim only)
if _G.Utils and _G.Utils.is_embedded then return {} end

return {
	"Fildo7525/pretty_hover",
	event = "LspAttach",
	opts = {}
}