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

set showcmd

" Search options.
set ignorecase smartcase

" Undo
set undofile
set undodir=~/.vim/undo

" Airline
let g:airline_left_sep = "\uE0B0"                                                                                
let g:airline_right_sep = "\uE0B2"                                                                               
let g:airline#extensions#tabline#left_sep = "\uE0B4"                                                             
let g:airline#extensions#tabline#right_sep = "\uE0B6"
