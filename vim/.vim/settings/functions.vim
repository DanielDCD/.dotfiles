" Change current working directory to project root automatically when a
" buffer is opened.
function! <SID>AutoProjectRootCD()
  try
    if &ft != 'help'
      ProjectRootCD
    endif
  catch
  " Silently ignore invalid buffers
  endtry
endfunction
autocmd BufEnter * call <SID>AutoProjectRootCD()
