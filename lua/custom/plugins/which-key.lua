return {
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      -- Document existing key chains
      require("which-key").register({
        ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
        ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
        ["<leader>f"] = { name = "[F]ile Explorer", _ = "which_key_ignore" },
        ["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
        -- Has something about "mode = v" May need to see Docs
        -- ["<leader>h"] = { name = "Git [H]unk", _ = "which_key_ignore" },
        -- ["<leader>h"] = { name ="Git [H]unk" }, { mode = "v" },
        ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
        ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
        ["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
        ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
        ["<leader>b"] = { name = "[B]uffers", _ = "which_key_ignore" },
        -- ["<leader>"] = { name = "VISUAL <leader>" },
      })
      --visual mode
      require("which-key").register({
        ["<leader>h"] = { "Git [H]unk" },
      }, { mode = "v" })
    end,
  },
}
--[[
    ["<leader>"] = { name = "VISUAL <leader>" },
    ["<leader>h"] = { "Git [H]unk" },
  }, { mode = "v" }),
  --]]
-- register which-key VISUAL mode
-- required for visual <leader>hs (hunk stage) to work
-- vim: ts=2 sts=2 sw=2 et
