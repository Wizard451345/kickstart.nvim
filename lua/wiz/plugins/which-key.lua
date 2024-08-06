return {
  {
    "folke/which-key.nvim",
    event = "VimEnter", -- NOTE: LOADS UNTIL VimEnter Event
    config = function()
      -- Document existing key chains
      require("which-key").add({
        --[[
				["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
				["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
				["<leader>f"] = { name = "[F]ile Explorer", _ = "which_key_ignore" },
				["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
				["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
				["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
				["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
				["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
				["<leader>b"] = { name = "[B]uffers", _ = "which_key_ignore" },
				-- ["<leader>"] = { name = "VISUAL <leader>" },
      }
      --]]
        --
        { "<leader>c", group = "[C]ode" },
        { "<leader>d", group = "[D]ocument" },
        { "<leader>f", group = "[F]ormat" },
        { "<leader>g", group = "[G]it" },
        { "<leader>r", group = "[R]ename" },
        { "<leader>s", group = "[S]earch" },
        { "<leader>t", group = "[T]oggle" },
        { "<leader>w", group = "[W]orkspace" },
        { "<leader>b", group = "[B]uffers" },
        { "<leader>h", group = "Git [H]unk",        mode = { "n", "v" } },
        { "<leader>x", group = "Trouble Diagnostic" },
      })
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
