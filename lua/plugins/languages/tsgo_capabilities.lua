-- tsgo: diagnostics only — disable every other LSP feature on attach.
-- https://github.com/sergiornelas/nvim/tree/main/lua/plugins/lsp/capabilities
local M = {}

function M.apply(client)
  local caps = client.server_capabilities

  caps.hoverProvider = false
  caps.completionProvider = false
  caps.definitionProvider = false
  caps.declarationProvider = false
  caps.implementationProvider = false
  caps.referencesProvider = false
  caps.renameProvider = false
  caps.codeActionProvider = false
  caps.signatureHelpProvider = false
  caps.documentHighlightProvider = false

  caps.documentSymbolProvider = false
  caps.workspaceSymbolProvider = false

  caps.documentFormattingProvider = false
  caps.documentRangeFormattingProvider = false
  caps.semanticTokensProvider = nil

  caps.typeDefinitionProvider = false
  caps.callHierarchyProvider = false
  caps.selectionRangeProvider = false
  caps.inlayHintProvider = false
end

return M
