-- Mappings
local opts = { noremap=true, silent=true }
map = vim.api.nvim_set_keymap
map('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', '<M-CR>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

-- auto-format
vim.cmd('autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)')
vim.cmd('autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)')
vim.cmd('autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)')
