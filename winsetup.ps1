# Inital setup files fo new systems
Remove-Item -Recurse -Force ~/AppData/Local/nvim
Remove-Item -Recurse -Force ~/AppData/Local/nvim-data
mkdir -p $HOME/.vim/undodir
mkdir -p $HOME/.scripts
# NOTE: I don't think a sym link is a good idea tbh
New-Item -Path "$HOME\AppData\Local\nvim" -ItemType SymbolicLink -Target "$pwd"
