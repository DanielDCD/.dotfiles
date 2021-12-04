" Vim plug.
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Themes.
Plug 'dracula/vim', { 'as': 'dracula' }

"Airline.
Plug 'vim-airline/vim-airline'
  let g:airline_left_sep = "\uE0B0"
  let g:airline_right_sep = "\uE0B2"
  let g:airline#extensions#tabline#left_sep = "\uE0B4"
  let g:airline#extensions#tabline#right_sep = "\uE0B6"

" fzf.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git.
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" NERDTree.
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" vim-mundo.
Plug 'simnalamburt/vim-mundo'

" Code completion.
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
