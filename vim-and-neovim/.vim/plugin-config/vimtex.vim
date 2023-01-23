" PDF viewer
if has('osx')
  let g:vimtex_view_method = "skim"
else
  let g:vimtex_view_general_viewer = 'okular'
  let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
endif

" options
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0

" Compiler
let g:vimtex_compiler_method = 'tectonic'
let g:vimtex_compiler_tectonic = {
        \ 'build_dir' : '',
        \ 'hooks' : [],
\ 'options' : [
\   '--keep-logs',
\   '--synctex'
\ ],
\}

" Conceal
set conceallevel=2
let g:tex_conceal="abdgm"
let g:tex_conceal_frac=1

" Syntax
autocmd FileType tex syntax on

" Mappings
autocmd FileType tex nnoremap <buffer> <localleader>c <Cmd>update<CR><Cmd>VimtexCompile<CR>
autocmd FileType tex nnoremap <buffer> <localleader>v <Cmd>VimtexView<CR>

