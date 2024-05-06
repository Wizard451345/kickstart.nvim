--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require("lazy").setup({ --look inside lua, LAZY,and then INIT.LUA. Then run setup function.


  -- NOTE: The import below automatically adds your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo. Make sure the subdirs are in lua
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  --
  -- Best way to modularize config. Imports lua/config/plugins/*.lua

  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

  -- `opts = {}` forces plguin to load

  -- "gc" to comment visual regions/lines!
  { "numToStr/Comment.nvim", opts = {} },

  --TODO: ADD EACH FILE? NO INIT?? OR MAKE "REQUIRES" in PLGUINS/INIT
  require "custom.plugins.gitsigns",
  require "custom.plugins.neogit",
  require "custom.plugins.which-key",
  require "custom.plugins.telescope",
  require "custom.plugins.lspconfig",
  require "custom.plugins.cmp",
  require "custom.plugins.colorschemes",
  require "custom.plugins.todo-comments",
  require "custom.plugins.mini-nvim",
  require "custom.plugins.treesitter",


  require "custom.plugins.nvim-tree",
  require "custom.plugins.bufferline",
  require "custom.plugins.autoclose",
  require "custom.plugins.dashboard",
  require "custom.plugins.harpoon",
  require "custom.plugins.lualine",
  require "custom.plugins.none-ls",
  require "custom.plugins.noice",
  require "custom.plugins.init",
--  require "custom.plugins.comment",

  require "kickstart.plugins.autoformat",
  require "kickstart.plugins.debug",
  require "kickstart.plugins.indent_line",
  require "kickstart.plugins.lint",
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
--       These are some example plugins that I've included in the kickstart repository.
--       Uncomment any of the lines below to enable them.
-- WARN: CHECK FOR ERRORS. Not tested yet!

--NOTE: Not a plugin bruh --> TO INIT.LUA??
--require "kickstart.plugins.health"
--require "custom.options"
--require "custom.autocmds"
--require "custom.keymaps"
--[[
   require("kickstart.plugins.autoformat")

   require("kickstart.plugins.debug")



   require("kickstart.plugins.indent_line")

   require("kickstart.plugins.lint")

   require("custom.options")
   --]]


-- TODO: options.lua. See Neovim #3 Video


-- vim: ts=2 sts=2 sw=2 et
