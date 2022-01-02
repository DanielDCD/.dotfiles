inoremap ´ <Esc>
vnoremap ´ <Esc>
cnoremap ´ <Esc>

nnoremap <Space> <Nop>
let mapleader = " "

" Use TAB to move between buffers in normal mode.
nnoremap <TAB> :bnext<CR> 
nnoremap <S-TAB> :bprevious<CR>

# Alternate way to save and quit.
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qall<CR>
nnoremap <leader>qqq :q!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>W :wall<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>WQ :wqall<CR>

nnoremap <leader>e :NERDTreeToggle<CR> 

nnoremap <leader>f :Files<CR> 
