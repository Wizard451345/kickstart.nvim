--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

local lspconfig = require("lspconfig")

lspconfig.html.setup({
	capabilities = capabilities,
})

require("wiz.plugins.lsp.lsp")

vim.cmd(":LspStart")
vim.cmd(":set ts=2")
-- TODO: completion works but documentation does not.
