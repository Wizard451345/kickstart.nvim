return {
	{
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        theme = "hyper",
        shortcut_type = "number",
        config = {
          shortcut = {

            --Used my personal directory,$USER did not work. -- Compare GIT before changing
            {
              desc = "Files [WIN]",
              group = "Label",
              action = "Telescope find_files cwd=D:\\",
              key = "f",
            },
            {
              desc = "Config [WIN]",
              -- action "e " .. os.getenv("HOMEPATH") .. "\\AppData\\Local\\nvim\\init.lua"
              action = "e C:\\Users\\marco\\AppData\\Local\\nvim\\init.lua",
              key = "e",
            },
            { desc = "Config [LIN]", action = "e ~/config/nvim/init.lua", key = "E" },
          },
          project = {
            enable = "True",
            action = "Telescope find_files cwd=",
          },
          week_header = {
            enable = "true",
          },
        },
      })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
}

-- vim: ts=2 sts=2 sw=2 et