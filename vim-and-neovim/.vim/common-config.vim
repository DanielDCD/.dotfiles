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

" Spanish acute accent mappings.
if (has("win32"))
  inoremap ´´ <Esc>
  vnoremap ´´ <Esc>
  cnoremap <silent> ´´ <C-left>"<Esc> 
  nnoremap ´´ :
else
  inoremap ´ <Esc>
  vnoremap ´ <Esc>
  cnoremap <silent> ´ <C-left>"<Esc> 
  nnoremap ´ :
endif

nnoremap <space> <nop>
let mapleader = " "

" Window navigation.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move selected line / block in visual mode.
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Use TAB to move between buffers in normal mode.
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>

" Alternate way to save and quit.
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qall<CR>
nnoremap <Leader>Qq :q!<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :wall<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>WQ :wqall<CR>

" Close current buffer.
nnoremap <silent> <Leader>bd :bd<CR>
nnoremap <silent> <Leader>bD :bd!<CR>

" Source Vim and Neovim common plugins config.
source $HOME/.vim/common-plugin-config/load-config.vim