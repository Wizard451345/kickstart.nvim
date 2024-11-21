return {
    "Aasim-A/scrollEOF.nvim",
    event = { "CursorMoved", "WinScrolled" },
    opts = {},
  config = function()
    require("scrollEOF").setup()
  end,
}

--vim : ts=2 sts=2 sw=2 et
