--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require("lazy").setup({ --look inside lua, LAZY,and then INIT.LUA. Then run setup function.
  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- WARN: CHECK FOR ERRORS. Not tested yet!
  -- require("kickstart.plugins.autoformat"),

  -- require("kickstart.plugins.debug"),

  -- require("kickstart.plugins.health"),

  -- require("kickstart.plugins.indent_line"),

  -- require("kickstart.plugins.lint"),

  -- require("custom.options"),

  -- require("custom.keymaps"),

  -- NOTE: The import below automatically adds your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo. Make sure the subdirs are in lua
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  --
  -- Best way to modularize config. Imports lua/config/plugins/*.lua
   { import = "custom.plugins" },
  -- { import = "custom.lsp" },

-- require "custom/plugins/cmp",

}, {})

-- TODO: options.lua. See Neovim #3 Video


-- vim: ts=2 sts=2 sw=2 et