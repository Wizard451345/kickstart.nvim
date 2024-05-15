return {
	{
		--see :h bufferline-configuration
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers", -- Changed from tabs.
					numbers = "ordinal",
				},
			})
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et