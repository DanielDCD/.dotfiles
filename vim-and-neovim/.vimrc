" Vim plug auto installer.
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim-Plug.
call plug#begin('$HOME/.vim/plugged')
" Themes.
Plug 'dracula/vim', { 'as': 'dracula' }

"Airline.
Plug 'vim-airline/vim-airline'

" fzf.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/gv.vim'
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

" Snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" Syntax checking.
Plug 'vim-syntastic/syntastic'

" editorconfig.
Plug 'editorconfig/editorconfig-vim'

" Surroundings.
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'

" Start screen.
Plug 'mhinz/vim-startify'

" Project root.
Plug 'dbakker/vim-projectroot'
call plug#end()

" Prevent background color from disappearing while scrolling.
let &t_ut = ''

" Source Vim and Neovim common config and plugin config.
source $HOME/.vim/common-config.vim

" Source vim specific plugin config.
source $HOME/.vim/vim-only-plugin-config/load-config.vim
