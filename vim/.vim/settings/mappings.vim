inoremap ´ <Esc>
vnoremap ´ <Esc>
cnoremap ´ <Esc>

nnoremap <Space> <Nop>
let mapleader = " "

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
