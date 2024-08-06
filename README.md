# This is my personal Neovim configuration.
## Copied from Kickstart.nvim with some personal configurations

This is also the first time doing a Markdown file with my blood, sweat and tears so... IDK.

There is a lot of stuff to do that I don't know about so. I'd dumb lol.

This has:

- [x] Everything in Kickstart, including the `Lazy.nvim` package manager.
- [x] Also some plugins from Kickstart with some additional plugins.

## What I am working on right now?

I am currently doing Lua so I can understand what I am doing. I feel like I am now 'smart enough' to at least edit this configuration on my own. So expect changes soon :)
I want to say thanks to TJ for helping me learn this. :) 

TODO:
- [x] I want there to be an autoformatter. Autocomplete the `{} [] and quotes` maybe I could create a request or plug-in my own?
  > Used autoclose.nvim. Still need to tweak a little more. Especially for HTML's' < >.
- [x] Finish organizing plugins and lsp's etc. Into their respective directories. Especially now that I know how most things work.
- [x] FOR WINDOWS: I hate Mason beuh. Clangd-LSP does not work for Windows. Not reading header files, likely not reading MSYS stuff. For C/C++ LSP.
  > Note. I had MSYS2 Installed. I COPIED `C:/MSYS64/UCRT64/include` TO `$USER\AppData\Local\nvim-data\mason\packages\clangd\clangd_17.0.3\lib\clang\17\include`
  > I spent too much time to figure this out. PLZ give money
  > LSP - Lua_LS: For ARM, built from source from [HERE](https://luals.github.io/#neovim-install). After that, add this code to LSP section:
  ```lua
  require 'lspconfig'.lua_ls.setup {}
  ``` 
   > this can actually work with most languages as well!
   > If not work. May have link the binary to location. See [HERE](https://github.com/williamboman/mason.nvim/issues/1602)
  
  > LSP - BASH: For ARM, installed via the **NPM** package manager. Once installed you can add the following command to the LSP section:
  ```lua
  vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sh',
  callback = function()
  vim.lsp.start({
  name = 'bash-language-server',
  cmd = { 'bash-language-server', 'start' },
  })
  end,
  }  
  ```

I am currently practicing git commands right now. This repository has 3 branches. Main, Master and Modular. 

- The **Master** Branch is the original Kickstart repo. Keeping it on sync, whenever I have the chance. 

- The **Main** Branch is my personal configuration. To be honest, it is very similar to the Master Branch. But with slight personal touches. It is not too special though.

- The **Simple** branch is basically the Master (original) Branch but with my plugins. Will likely not be updated.

There are some things that could be required, will depend on which OS you use! Run `:checkhealth` and `:messages` when needed.
Make sure to read kickstart's README.md for more information. Likely missing some sort of dependecy issue or something. Keep your Neovim up to date!

## My Main goals with this project

My main goal for this project is to understand on what is going on. I have no idea on what going on, therefore I am also trying to understand the lua programming language.
Additionally, I want to configure my Neovim editor to make it my own and tell people that I use Neovim btw.

As a mentioned before, this project is also for practicing Git. I forgot how to make pull requests and stuff. So I am trying to remember how to do that.

