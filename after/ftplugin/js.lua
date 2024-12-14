local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

local lspconfig = require("lspconfig")

lspconfig.tsserver.setup({
	capabilities = capabilities,
})

require("wiz.plugins.lsp.lsp")

-- vim.cmd(":LspStart")
vim.cmd(":set ts=2")
-- vim: set ts=2 sw=2 sts=2 et