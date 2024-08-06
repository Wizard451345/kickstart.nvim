return {
  "f3fora/cmp-spell",
  dependencies = { "hrsh7th/nvim-cmp" },
  cmd = { "Spell", "SpellToggle" },
  -- I don't need this on all files
  ft = { "markdown", "tex", "text" },
  config = function()
    vim.opt.spell = true
    vim.opt.spelllang = { "en_us" }

    -- enable spell
    vim.api.nvim_create_user_command("Spell", function()
      vim.cmd("set spell")
    end, {})

    -- disble spell
    vim.api.nvim_create_user_command("NoSpell", function()
      vim.cmd("set nospell")
    end, {})

    -- toggle spell
    vim.api.nvim_create_user_command("SpellToggle", function()
      vim.cmd("set invspell")
    end, {})
  end,
}
-- vim: ts=2 sts=2 sw=2 et-- vim: ts=2 sts=2 sw=2 et
