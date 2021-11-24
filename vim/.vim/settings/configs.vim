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

set hidden

" Search options.
set ignorecase smartcase
