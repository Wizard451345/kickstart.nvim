-- NOTE: actually works!
-- Made this as Mason does not work on all of my machines.
if not vim.g.vscode then 
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

require("lspconfig").lua_ls.setup({
	lua_ls = {
		-- NOTE: cmd and filetypes are covered by default. Just make sure to have in path!
		-- cmd = {"lua-language-server"},
		-- filetypes =  {"lua"},
		capabilities = capabilities,
		--
		before_init = require("neodev.lsp").before_init,
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
				diagnostics = { disable = { "missing-fields" } },
			},
		},
	},
})

require("wiz.plugins.lsp.lsp")

-- vim.cmd(":LspStart")
vim.cmd(":set ts=2")

-- Find name of buffer and if it is nvim, set some options
local bufname = vim.api.nvim_buf_get_name(0)
if bufname:find("nvim") then
	vim.opt_local.include = [[\v<((do|load)file|require)[^''"]*[''"]\zs[^''"]+]]
	vim.opt_local.includeexpr = "tr(v:fname,'.','/')"
	for _, path in pairs(vim.api.nvim_get_runtime_file("lua", true)) do
		vim.opt_local.path:append(path)
	end

	vim.opt_local.suffixesadd:prepend({ ".lua", "/init.lua" })
end
end
-- vim: ts=2 sts=2 sw=2 et
