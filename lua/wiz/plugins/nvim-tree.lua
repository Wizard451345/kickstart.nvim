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

			local function change_root_to_global_cwd()
				local api = require("nvim-tree.api")
				local global_cwd = vim.fn.expand("%:p:h") -- Get the current file's directory
				api.tree.change_root(global_cwd)
			end

			vim.keymap.set("n", "<leader> <C-c>", change_root_to_global_cwd, { desc = "Change Root To Global CWD" })
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
