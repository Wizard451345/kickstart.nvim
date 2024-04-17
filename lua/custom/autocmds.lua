-- [[ Basic Autocommands ]]
-- See :help lua-guide-autocommands

-- Highlight when yanking (copying) text
-- Try with `yap` in normal mode
-- See `:help vim.highlight.on_yank()`
-- local highlight_group =
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying text)",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})