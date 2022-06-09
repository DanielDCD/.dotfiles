-- Options
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {},
  extensions = {}
}

-- Shortcuts
vim.cmd([[
    nnoremap <Leader>fñ :Telescope<CR>
    nnoremap <Leader>ff :Telescope find_files<CR>
    nnoremap <Leader>fof :Telescope oldfiles<CR>
    nnoremap <Leader>fgr :Telescope grep_string<CR>
    nnoremap <Leader>flg :Telescope live_grep<CR>
    nnoremap <Leader>fgf :Telescope git_files<CR>
    nnoremap <Leader>fzb :Telescope current_buffer_fuzzy_find<CR>
    nnoremap <Leader>fsh :Telescope search_history<CR>
    nnoremap <Leader>fls :Telescope lsp_document_symbols<CR>
    nnoremap <Leader>flws :Telescope lsp_workspace_symbols<CR>
    nnoremap <Leader>fldws :Telescope lsp_dynamic_workspace_symbols<CR>
    nnoremap <Leader>fld :Telescope diagnostics<CR>
    nnoremap <Leader>fb :Telescope buffers<CR>
    nnoremap <Leader>fcm :Telescope commands<CR>
    nnoremap <Leader>ftg :Telescope tags<CR>
    nnoremap <Leader>ftb :Telescope current_buffer_tags<CR>
    nnoremap <Leader>fch :Telescope command_history<CR>
    nnoremap <Leader>fmk :Telescope marks<CR>
    nnoremap <Leader>fr :Telescope registers<CR>
    nnoremap <Leader>fll :Telescope loclist<CR>
    nnoremap <Leader>fjl :Telescope jumplist<CR>
    nnoremap <Leader>fvo :Telescope vim_options<CR>
    nnoremap <Leader>fty :Telescope filetypes<CR>
    nnoremap <Leader>fss :Telescope spell_suggest<CR>
    nnoremap <Leader>fgc :Telescope git_commits<CR>
    nnoremap <Leader>fgbc :Telescope git_bcommits<CR>
    nnoremap <Leader>fgbr :Telescope git_branches<CR>
    nnoremap <Leader>fgst :Telescope git_status<CR>
    nnoremap <Leader>fgsh :Telescope git_stash<CR>
    nnoremap <Leader>fht :Telescope help_tags<CR>
    nnoremap <Leader>fmp :Telescope man_pages<CR>
]])
