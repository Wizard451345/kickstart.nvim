return {

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- WARN: Automatically install LSPs to stdpath for neovim, DOES NOT WORK WITH ARM CPU's :(((
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  --WARN: Lua-Language-Server (Installed from source on ARM). Will require to remove mason.nvim package & uninstall it's packages
  require 'lspconfig'.lua_ls.setup {}

  --WARN: Bash-Language-Server (Installed from npm). Requires latest stable Nodejs.

  --[[
  vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sh',
  callback = function()
  vim.lsp.start({
  name = 'bash-language-server',
  cmd = { 'bash-language-server', 'start' },
  })
  end,
}
--]]
}
