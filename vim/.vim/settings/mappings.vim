" Spanish acute accent mappings.
if (has("win32"))
  inoremap ´´ <Esc>
  vnoremap ´´ <Esc>
  cnoremap <silent> ´´ <C-left>"<esc> 
  nnoremap ´´ :
else
  inoremap ´ <Esc>
  vnoremap ´ <Esc>
  cnoremap <silent> ´ <C-left>"<esc> 
  nnoremap ´ :
endif

nnoremap <Space> <Nop>
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
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>

" Alternate way to save and quit.
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qall<CR>
nnoremap <leader>Qq :q!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>W :wall<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>WQ :wqall<CR>

nnoremap <silent> <leader>e :NERDTreeToggle<CR>

nnoremap <leader>f :Files<CR>

nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gca :Git commit --amend<CR>
nnoremap <leader>gcm :Git commit 
nnoremap <leader>gd :Git diff HEAD<CR>
nnoremap <leader>ga :Git add 
nnoremap <leader>gpl :Git pull 
nnoremap <leader>gps :Git push 
nnoremap <leader>gf :Git fetch<CR>
nnoremap <leader>gch :Git checkout 
nnoremap <leader>gb :Git branch 
nnoremap <leader>gr :Git remote 
nnoremap <leader>gm :Git merge 
nnoremap <leader>grb :Git rebase 

" Close current buffer.
nnoremap <silent> <leader>bd :bd<CR>
nnoremap <silent> <leader>bD :bd!<CR>

" ProjectRoot.
nnoremap <leader>dp :ProjectRootCD<cr>
nnoremap <silent> <leader>dt :ProjectRootExe NERDTree<cr>
