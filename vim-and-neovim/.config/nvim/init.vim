" Install plugins
lua require("install-plugins")

" Source Vim and Neovim common config and plugin config.
source $HOME/.vim/common-config.vim

" Source Neovim specific config and plugin config.
lua require("nvim-only-config")
lua require("nvim-only-plugin-config")