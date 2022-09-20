require("dired").setup {
    path_separator = "/",
    show_hidden = true
}

vim.keymap.set('n', '<Leader>dr', ':Dired<CR>', {silent = true})
