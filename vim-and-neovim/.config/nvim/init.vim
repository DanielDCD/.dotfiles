" Source Vim and Neovim common config.
source $HOME/.vim/common-config.vim

" Highlight yanked text
augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=200})
augroup END

" Install and load plugin config.
lua require 'plugin'

