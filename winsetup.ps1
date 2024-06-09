# Inital setup files fo new systems
Remove-Item -Recurse -Force ~/AppData/Local/nvim
Remove-Item -Recurse -Force ~/AppData/Local/nvim-data
#mkdir -p $HOME/.vim/undodir
#mkdir -p $HOME/.scripts
#mkdir -p ~/AppData/Local/nvim
mkdir -p ~/AppData/Local/nvim-data
# NOTE: I don't think a sym link is a good idea tbh
New-Item -Path "$HOME\AppData\Local\nvim" -ItemType SymbolicLink -Target "$pwd"
#New-Item -Path "$HOME\AppData\Local\nvim" -ItemType "directory" -Force

#Copy-Item -Path "$pwd\init.vim" -Destination "$HOME\AppData\Local\nvim\init.vim"
#Copy-Item -Path "$pwd\lua" -Destination "$HOME\AppData\Local\nvim\lua\" -Recurse
#Copy-Item -Path "$pwd\after\ftplugin" -Destination "$HOME\AppData\Local\nvim\after\ftplugin" -Recurse
#Copy-Item -Path "$pwd\snippets" -Destination "$HOME\AppData\Local\nvim\snippets" -Recurse
