-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
end ---@diagnositc disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath) --rtp/runtimepath, list of dir where nvim is going to look. like PATH. Adds lazypath to PATH
-- SAME as vim.opt.prepend(vim.opt.rtp, lazypath) (adds to beginning of text) [PRE]

-- vim: ts=2 sts=2 sw=2 et