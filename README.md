# This is my personal Neovim configuration.
## Copied from Kickstartt.nvim with some personal configurations

This is also the first time doing a Markdown file with my blood, sweat and tears so... IDK.

There is a lot of stuff to do that I don't know about so. I'd dumb lol.

This has:

- [x] Everything in Kickstart, including the `Lazy.nvim` package manager.
- [x] I don't know the rest because I forgot.
- [ ] Do I know what I am doing?

## What I am working on right now?

I am currently doing Lua so I can understand what I am doing, also LSP does not work on my end, likely as a result of using an ARM based computer. Yeah. It is because of ARM :( F

TODO:
- [ ] Take note of the files in `/lua/*`. There are stuff from there that arre from Packer.nvim. ~ There is no issues as it is not called, just a reminder.
- [ ] I want there to be an autoformatter. Autocomplete the `{} [] and quotes` maybe I could create a request or plug-in my own?
- [ ] Finish organizing plugins and lsp's etc. Into their respective directories.
- [x] FOR WINDOWS: I hate Mason beuh. Clangd-LSP does not work for Windows. Not reading header files, likely not reading MSYS stuff. For C/C++ LSP.
  > Note. I had MSYS2 Installed. I COPIED `C:/MSYS64/UCRT64/include` TO `$USER\AppData\Local\nvim-data\mason\packages\clangd\clangd_17.0.3\lib\clang\17\include`
  > I spent too much time to figure this out. PLZ give money
  > Thinking on removing mason by defualy based on my own workflow. This would require a lot of moving around and comparing configs on my Windows
    > I just thought of making another branch but that may be too much. Focusing on x64 for now
- [ ] Watch Primeagen's Nvim video to mak me feel that I know what I am doing. (I don't) 

I am currently practicing git commands right now. This repository has 2 branches. Main and Master. 

- The **Master** Branch is the original Kickstart repo. I am closely following it for any changes. I am thinking on keeping it on sync.

- The **Main** Branch is my personal configuration. To be honest, it is very similar to the Master Branch. But with slight personal touches. It is not too special though.

I may have been thinking on merging these 2 branches but there is some files that may be in conflict, so for now I will keep it seperate until I feel ready enough.

## My Main goals with this project

My main goal for this project is to understand on what is going on. I have no idea on what going on, therefore I am also trying to understand the lua programming language. Additionally, I want to configure my Neovim editor to make it my own and tell people that I use Neovim btw. As a mentioned before, this project is also for practicing Git.
