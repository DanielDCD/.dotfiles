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

" Code completion.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
Plug 'SirVer/ultisnips'

" Syntax checking.
Plug 'vim-syntastic/syntastic'

" NERDTree.
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Project root.
Plug 'dbakker/vim-projectroot'

" Start screen.
Plug 'mhinz/vim-startify'

"Airline.
Plug 'vim-airline/vim-airline'

" Window management
Plug 'dstein64/vim-win'

" fzf.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/gv.vim'
Plug 'junegunn/fzf.vim'

" Git.
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" vim-mundo.
Plug 'simnalamburt/vim-mundo'

" editorconfig.
Plug 'editorconfig/editorconfig-vim'

" Surroundings.
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'

" Latex
Plug 'lervag/vimtex'

call plug#end()

" Load plugin config
colorscheme dracula
source $HOME/.vim/plugin-config/load-config.vim

" Prevent background color from disappearing while scrolling.
let &t_ut = ''

" Source Vim and Neovim common config and plugin config.
source $HOME/.vim/common-config.vim

" Mappings

" Use TAB to move between buffers in normal mode.
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>

" Eliminate <Esc> key delay.
set timeoutlen=1000 ttimeoutlen=0

