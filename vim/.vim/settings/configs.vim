set nocompatible  

" Automatic toggling between absolute and "hybrid" line numbers depending on situation. 
set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

syntax on
colorscheme dracula
set termguicolors

set hidden

set showcmd

" Search options.
set ignorecase smartcase
set hlsearch incsearch

" Undo
set undofile
set undodir=~/.vim/undo

if (has("clipboard"))
  set clipboard=unnamed
endif
