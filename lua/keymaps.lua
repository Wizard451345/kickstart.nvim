-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set( "n", "<Esc>" , "<cmd>nohlsearch<CR>")

-- Remap for dealing with word wrap
-- vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics [Q]uickfix list" })

-- Exit termianl mode in builtin terminal with this shourtcut! Could not work with all.
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- NOTE: Personal shortcuts starts here
-- File Explorer shortcut
vim.keymap.set("n", "<leader>cP", "<Cmd>:tabe term://powershell<CR>", { desc = "Open PS in new tab" })
vim.keymap.set("n", "<leader>cT", "<Cmd>:tabe term://zsh<CR>", { desc = "Open ZSH in new tab" })
-- NOTE: F by itself is better
vim.keymap.set("n", "<leader>f", vim.cmd.NvimTreeToggle, { desc = "File Explorer" })

-- buffer shortcuts, powered by BufferLine
vim.keymap.set("n", "<leader>bN", vim.cmd.tabe, { desc = "Open New Buffer" })
vim.keymap.set("n", "<leader>bn", vim.cmd.BufferLineCycleNext, { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bp", vim.cmd.BufferLineCyclePrev, { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>bc", vim.cmd.BufferLinePickClose, { desc = "Close Buffer" })
vim.keymap.set("n", "<leader>bs", vim.cmd.BufferLinePick, { desc = "Select Buffer" })

-- Dashboard shortcut
vim.keymap.set("n", "<leader>H", vim.cmd.Dashboard, { desc = "Open Dashboard" })

-- Lazy
vim.keymap.set("n", "<leader>L", "<Cmd>:Lazy<CR>", {desc = "Lazy Dashboard"})
-- NOTE: End of Personal Shortcuts

-- vim: ts=2 sts=2 sw=2 et
