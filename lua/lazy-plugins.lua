--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require("lazy").setup({ --look inside lua, LAZY,and then INIT.LUA. Then run setup function.

	-- NOTE: The import below automatically adds your own plugins, configuration, etc from `lua/wiz/plugins/*.lua`
	--    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
	--    up-to-date with whatever is in the kickstart repo. Make sure the subdirs are in lua
	--
	--    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
	--
	-- Best way to modularize config. Imports lua/config/plugins/*.lua

	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	-- `opts = {}` forces plugin to load

	-- "gc" to comment visual regions/lines!
	{ "numToStr/Comment.nvim", opts = {} },

	--TODO: ADD EACH FILE? NO INIT?? OR MAKE "REQUIRES" in PLGUINS/INIT
	require("wiz.plugins.gitsigns"),
	require("wiz.plugins.neogit"),
	require("wiz.plugins.which-key"),
	require("wiz.plugins.telescope"),
	require("wiz.plugins.lsp"),
	require("wiz.plugins.conform"),
	require("wiz.plugins.cmp"),
	require("wiz.plugins.colorschemes"),
	require("wiz.plugins.todo-comments"),
	require("wiz.plugins.mini-nvim"),
	require("wiz.plugins.treesitter"),

	require("wiz.plugins.nvim-tree"),
	require("wiz.plugins.bufferline"),
	require("wiz.plugins.autoclose"),
	require("wiz.plugins.dashboard"),
	require("wiz.plugins.harpoon"),
	require("wiz.plugins.lualine"),
	require("wiz.plugins.none-ls"),
	require("wiz.plugins.noice"),
	require("wiz.plugins.init"),
	require("wiz.plugins.colorizer"),
	require("wiz.plugins.trouble"),
	require("wiz.plugins.scrollEOF"),
	--  require "wiz.plugins.comment",

	require("kickstart.plugins.autoformat"),
	require("kickstart.plugins.debug"),
	require("kickstart.plugins.indent_line"),
	require("kickstart.plugins.lint"),
}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
--       These are some example plugins that I've included in the kickstart repository.
--       Uncomment any of the lines below to enable them.
-- WARN: CHECK FOR ERRORS. Not tested yet!

--NOTE: Not a plugin bruh --> TO INIT.LUA??
--require "kickstart.plugins.health" HEALTH IN INIT.LUA. (Has not plugins)
--require "wiz.options"
--require "wiz.autocmds"
--require "wiz.keymaps"
--[[
   require("kickstart.plugins.autoformat")

   require("kickstart.plugins.debug")



   require("kickstart.plugins.indent_line")

   require("kickstart.plugins.lint")

   require("wiz.options")
   --]]

-- TODO: options.lua. See Neovim #3 Video

-- vim: ts=2 sts=2 sw=2 et
