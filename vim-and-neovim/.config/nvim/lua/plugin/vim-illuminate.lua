-- Options
require('illuminate').configure({
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
    delay = 100,
    filetype_overrides = {},
    filetypes_denylist = {
        'dirvish',
        'fugitive',
    },
    filetypes_allowlist = {},
    modes_denylist = {},
    modes_allowlist = {},
    providers_regex_syntax_denylist = {},
    providers_regex_syntax_allowlist = {},
    under_cursor = true,
    large_file_cutoff = nil,
    large_file_overrides = nil,
    min_count_to_highlight = 1,
})

-- Highlight groups
vim.cmd([[
    hi IlluminatedWordText guibg=#44475a gui=none
    hi IlluminatedWordRead guibg=#44475a gui=none
    hi IlluminatedWordWrite guibg=#44475a gui=none
]])

