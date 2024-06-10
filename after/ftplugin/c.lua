local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
	capabilities = capabilities,
	-- WARN: Will modify soon. This is a temporary solution.
	-- Will have to make a .clangd file in the root directory.
	cmd = { "clangd", "--offset-encoding=utf-16" },
})

require("wiz.plugins.lsp.lsp")

vim.cmd(":LspStart")
