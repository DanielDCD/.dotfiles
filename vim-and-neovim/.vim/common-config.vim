set nocompatible  

" Automatic toggling between absolute and "hybrid" line numbers depending on situation. 
set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

syntax on
set termguicolors

set hidden

set showcmd

set noshowmode

" Search options.
set ignorecase smartcase
set hlsearch incsearch

" Undo
set undofile
set undodir=~/.vim/undo

if (has("clipboard"))
  set clipboard=unnamed
endif

" Identation
filetype indent on
filetype plugin indent on
set smartindent
set autoindent

" Mouse
set mouse=a

" Number format
set nrformats+=unsigned

" Spanish acute accent mappings.
if (has("win32"))
  inoremap ´´ <Esc>
  vnoremap ´´ <Esc>
  cnoremap <silent> ´´ <C-left>"<Esc> 
  nnoremap ´´ :
elseif (has("linux"))
  inoremap ´ <Esc>
  vnoremap ´ <Esc>
  cnoremap <silent> ´ <C-left>"<Esc> 
  nnoremap ´ :
endif

nnoremap <space> <nop>
let mapleader = " "

" Enter command mode
nnoremap <leader><leader> :

" Window navigation.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move selected line / block in visual mode.
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Save and quit.
nnoremap <C-s> :w<CR>
nnoremap <C-k>s :wall<CR>
nnoremap <C-q> :q<CR>
nnoremap <C-k>q :qall<R>

" Close current buffer.
nnoremap <silent> <Leader>bd :bd<CR>
nnoremap <silent> <Leader>bD :bd!<CR>

