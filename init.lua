--  WARN: STILL IN PROGRESS.
--  TODO: IGNORE AFTER and PLUGIN

--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font =  true

-- [[ Setting Options]]
require 'options'

-- [[ Setting Keymaps]]
require 'keymaps'

-- [[ Installs `lazy.nvim` plugin manager]]
require 'lazy-bootstrap'

-- [[ Configure and Installs Plugins ]]
require 'lazy-plugins'

-- [[ Health]]
require 'kickstart.plugins.health'

-- [[ Autocmds]]
require 'custom.autocmds'

-- Modeline!
-- vim: ts=2 sts=2 sw=2 et
