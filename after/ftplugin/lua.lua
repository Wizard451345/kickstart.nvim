-- TODO: Move to /after?
-- require("colorizer").setup() 

	-- WARN: Verify that this command is in right spot, and comment if Mason works
	-- out of the box!
	require("lspconfig").lua_ls.setup({
		lua_ls = {
			-- NOTE: cmd and filetypes are covered by default.
			-- cmd = {"lua-language-server"},
			-- filetypes =  {"lua"},
			-- capabilities = {},
			--
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

  
-- vim: ts=2 sts=2 sw=2 et
