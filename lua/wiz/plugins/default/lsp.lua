return {
  {
    "folke/lazydev.nvim",
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types whrn the 'vim.uv' word is found?
        { path = 'luvit-meta/library', words = {'vim%.uv'} },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = 'true' },
  {
    -- Main LSP Configutration
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { "j-hui/fidget.nvim",       opts = {} },

      -- NOTE: NEODDEV NOT NEEDED`neodev` configures Lua LSP for your Neovim config, runtime and plugins
      -- used for completion, annotations and signatures of Neovim apis

      'hrsh7th/cmp-nvim-lsp',
    },
    -- NOTE config function used to be here now, now in `lsp/lsp.lua`
  },
}

-- vim: ts=2 sts=2 sw=2 et
