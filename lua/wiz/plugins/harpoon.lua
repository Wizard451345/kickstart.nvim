return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

  config = function ()
    local harpoon = require("harpoon")
    harpoon:setup({})

    -- Harpoon telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end

    -- Harpoon Shortcuts
    vim.keymap.set("n", "<leader>cH", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window" })
    vim.keymap.set("n", "<leader>cA", function()
      harpoon:list():append()
    end, { desc = "Harpoon Mark File" })
    -- vim.keymap.set("n", "<leader>cH", function()
    --  harpoon.ui:toggle_quick_menu(harpoon:list())
    -- end, { desc = "Harpoon Menu" })
    vim.keymap.set("n", "<leader><Left>", function()
      harpoon:list():prev()
    end, { desc = "Harpoon CyclePrev" })
    vim.keymap.set("n", "<leader><Right>", function()
      harpoon:list():next()
    end, { desc = "Harpoon CycleNext" })

  end,
}

-- vim: ts=2 sts=2 sw=2 et