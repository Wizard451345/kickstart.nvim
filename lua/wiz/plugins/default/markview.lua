return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  ft = "markdown",

  dependencies = {
    -- You may not need this if you don't lazy load
    -- Or if the parsers are in your $RUNTIMEPATH
    "nvim-treesitter/nvim-treesitter",

    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("markview").setup({
      modes = { "n", "i", "no", "c" },
      hybrid_modes = { "i" },

      -- This is nice to have
      callbacks = {
        on_enable = function(_, win)
          vim.wo[win].conceallevel = 2
          vim.wo[win].concealcursor = "nc"
        end,
      },
    })
  end,
}
-- vim: ts=2 sts=2 sw=2 et
