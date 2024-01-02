return {

--[[
--WARN: Lua-Language-Server (Installed from source on ARM). Will require to remove mason.nvim package & uninstall it's packages
require'lspconfig'.lua_ls.setup{}

--WARN: Bash-Language-Server (Installed from npm). Requires latest stable Nodejs. 

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'sh',
  callback = function()
    vim.lsp.start({
      name = 'bash-language-server',
      cmd = { 'bash-language-server', 'start' },
    })
  end,
})


--]]
}
