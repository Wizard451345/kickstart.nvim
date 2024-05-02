return {
	{
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      "nvim-telescope/telescope.nvim",
    },
    -- config = true,
    config = function ()
      -- Neogit and Shortcut
      local neogit = require("neogit")
      vim.keymap.set("n", "<leader>gO", function()
        neogit.open({ kind = "split" })
      end, { desc = "Open Neogit" })
    end
  },
}