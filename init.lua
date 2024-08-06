-- TODO:
-- FIX CODE FOLDING. zc zC closes similar indents but have to close twice.
-- Organize which-keys and keymaps for better experience
-- Add more snippets
-- cmp not loading sometimes. lua_ls timeout / slow?

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- [[ Setting Options]]
require("options")

-- [[ Setting Keymaps]]
require("keymaps")

-- [[ Autocmds]]
require("wiz.autocmds")

-- [[ Installs `lazy.nvim` plugin manager]]
require("lazy-bootstrap")

-- [[ Configure and Installs Plugins ]]
require("lazy-plugins")

-- require("wiz.plugins.lsp.lsp")

-- [[ Health]]
require("kickstart.plugins.health")

-- Modeline!
-- vim: ts=2 sts=2 sw=2 et
