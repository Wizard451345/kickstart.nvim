-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Remap for dealing with word wrap
-- vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics [Q]uickfix list" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Exit terminal mode in builtin terminal with this shortcut! Could not work with all.
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- NOTE: Personal shortcuts starts here
-- File Explorer shortcut
vim.keymap.set("n", "<leader>cP", "<Cmd>:tabe term://powershell<CR>", { desc = "Open PS in new tab" })
vim.keymap.set("n", "<leader>cT", "<Cmd>:tabe term://zsh<CR>", { desc = "Open ZSH in new tab" })

vim.keymap.set("n", "<leader>cS", function()
  vim.cmd("LspStop")
  vim.cmd("echo('Stopped LSP')")
end, { desc = "Code LSP Stop" })

vim.keymap.set("n", "<leader>cR", function()
  vim.cmd("LspRestart")
  vim.cmd("echo('Restarting LSP')")
end, { desc = "Code LSP Restart" })

-- NOTE: I now like the backslash, with NO LEADER
vim.keymap.set("n", "\\", vim.cmd.NvimTreeToggle, { desc = "File Explorer" })
vim.keymap.set("n", "<leader>tu", vim.cmd.UndotreeToggle, { desc = "[T]oggle [U]ndo Tree" })

-- NOTE: Spelling
-- vim.keymap.del("n", "z=")
vim.keymap.set(
  "n",
  "s",
  "<Cmd>:Telescope spell_suggest<CR>",
  { noremap = true, silent = true, desc = "Open Spelling Menu" }
)

-- buffer shortcuts, powered by BufferLine
vim.keymap.set("n", "<leader>bT", vim.cmd.tabe, { desc = "Open New TAB" })

vim.keymap.set("n", "<leader>bn", vim.cmd.BufferLineCycleNext, { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bp", vim.cmd.BufferLineCyclePrev, { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>bc", vim.cmd.BufferLinePickClose, { desc = "Close Buffer" })
vim.keymap.set("n", "<leader>bs", vim.cmd.BufferLinePick, { desc = "Select Buffer" })
vim.keymap.set("n", "<leader>bC", vim.cmd.BufferLineCloseOthers, { desc = "Close Other Buffers" })
-- TODO: Add 'New Buffer' command here

-- Dashboard shortcut
vim.keymap.set("n", "<leader>H", vim.cmd.Dashboard, { desc = "Open Dashboard" })

-- Lazy
vim.keymap.set("n", "<leader>L", "<Cmd>:Lazy<CR>", { desc = "Lazy Dashboard" })
vim.keymap.set("n", "<leader>M", "<Cmd>:Mason<CR>", { desc = "Mason Dashboard" })

vim.keymap.set("n", "<leader>ci", vim.cmd.LspInfo, { desc = "LSP [C]ode [I]nfo" })

-- WARN: Testing
-- vim.keymap.set("n", "s", "<Cmd>:Telescope spell_suggest<CR>")

-- NOTE: End of Personal Shortcuts

-- vim: ts=2 sts=2 sw=2 et

