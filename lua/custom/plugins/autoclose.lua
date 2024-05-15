return {
	  {
    "m4xshen/autoclose.nvim",
    config = function()
      require("autoclose").setup({
        keys = {
          -- ["$"] = { escape = true, close = true, pair = "$$", disabled_filetypes = {} },
        },
      })
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et