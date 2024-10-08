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

" Languae
lang en_US.UTF-8

" Clipboard
if (has("clipboard"))
  set clipboard=unnamedplus
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
let maplocalleader = "ç"

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
nnoremap <C-M-S> :wall<CR>
nnoremap <C-q> :q<CR>
nnoremap <C-M-S>q :qall<CR>

" Use TAB to move between buffers in normal mode.
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>

" Close current buffer.
nnoremap <silent> <Leader>bd :bd<CR>
nnoremap <silent> <Leader>bD :bd!<CR>

" Tab management
nnoremap <leader>tn :$tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tmp :-tabmove<CR>
nnoremap <leader>tmn :+tabmove<CR>

" Make current file
nnoremap <silent> <F29> :w \| :make<CR>

" Code running
autocmd FileType lua set makeprg=lua\ %
autocmd FileType python set makeprg=python3\ %
autocmd FileType julia set makeprg=julia\ %

