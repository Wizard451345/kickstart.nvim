local M = {}

-- NOTE: Called in LSPCONFIG
M.servers = {
	"lua_ls",
	"cssls",
	"html",
	"bashls",
}
-- TODO: Will have to call in Treesitter
M.parsers = {
	"lua",
	"markdown",
	"javascript",
	"tsx",
	"html",
	"css",
	"json",
	"yaml",
	"dockerfile",
}

-- TODO: Probably remove soon
M.fmtNLint = {
	"prettier",
	"stylua",
}

return M
