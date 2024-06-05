--  TODO: SIMPLIFY, REMOVE COMMENTS, REORDER and FIX LSP again.

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- [[ Setting Options]]
require("options")

-- [[ Setting Keymaps]]
require("keymaps")

-- [[ Autocmds]]
require("custom.autocmds")

-- [[ Installs `lazy.nvim` plugin manager]]
require("lazy-bootstrap")

-- [[ Configure and Installs Plugins ]]
require("lazy-plugins")

-- require("custom.plugins.lsp.lsp")

-- [[ Health]]
require("kickstart.plugins.health")

-- Modeline!
-- vim: ts=2 sts=2 sw=2 et
