-- WARN: STILL IN PROGRESS.

--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font =  true

require 'lazy-bootstrap'

require 'lazy-plugins'

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`

-- Modeline!
-- vim: ts=2 sts=2 sw=2 et