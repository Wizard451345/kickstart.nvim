return {
	-- NOTE: READ DOCS FOR BETTER RECIPES!
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({
				view = {
					side = "right", -- I like it to show on right. Like a boss
				},
			})
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et

