-- WARN: STILL IN PROGRESS. Seeing curent changes at the moment!
-- Stopped at keybindings ~~ 370
-- THERE are multple changed files!
-- I am thinking on restarting agian as there are a lot files changed!

--[[
  READ:
  - https://learnxinyminutes.com/docs/lua/
  `:help lua-guide`
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath) --rtp/runtimepath, list of dir where nvim is going to look. like PATH. Adds lazypath to PATH
-- SAME as vim.opt.prepend(vim.opt.rtp, lazypath) (adds to beginning of text) [PRE]

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require("lazy").setup({ --look inside lua, LAZY,and then INIT.LUA. Then run setup function.
  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- WARN: CHECK FOR ERRORS. Not tested yet!
  require("kickstart.plugins.autoformat"),
  require("kickstart.plugins.debug"),
  require("kickstart.plugins.health"),
  require("kickstart.plugins.indent_line"),
  require("kickstart.plugins.lint"),
  -- NOTE: The import below automatically adds your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo. Make sure the subdirs are in lua
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  --
  -- Best way to modularize config. Imports lua/config/plugins/*.lua
  { import = "custom.plugins" },
  { import = "custom.lsp" },
}, {})

-- TODO: options.lua. See Neovim #3 Video
require("custom.options")
require("custom.keymaps")

-- NOTE: keybindings were here.

-- TODO: Harpoon was here


-- NOTE: End of personal shortcuts

-- WARN: See main FORK, may need to modularize
-- [[ Basic Autocommands ]]
-- See :help lua-guide-autocommands

-- Highlight when yanking (copying) text
-- Try with `yap` in normal mode
-- See `:help vim.highlight.on_yank()`
-- local highlight_group =
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying text)",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- NOTE: Telescope was here.

-- NOTE: Treesitter was here.

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`

-- NOTE: Personal. Runs Colorizer
require("colorizer").setup()

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
