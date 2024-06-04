return {
	{ -- Theme inspired by Atom.
		"navarasu/onedark.nvim",
		priority = 1000,
		-- config = function()
		--   vim.cmd.colorscheme("onedark")
		-- end,
	},

	{
		"sainnhe/everforest",
		priority = 500,
		-- config = function()
		-- vim.cmd.colorscheme("everforest")
		-- end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("custom.plugins.theme.catppuccin")
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
