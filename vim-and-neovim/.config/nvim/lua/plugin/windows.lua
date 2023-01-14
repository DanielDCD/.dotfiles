vim.o.winwidth = 10
vim.o.winminwidth = 10
vim.o.equalalways = false

require('windows').setup({
  autowidth = {
    enable = false,
  }
})

vim.keymap.set('n', '<C-w>m', '<cmd>WindowsMaximize<CR>')
vim.keymap.set('n', '<C-w>,', '<cmd>WindowsMaximizeVertically<CR>')
vim.keymap.set('n', '<C-w>.', '<cmd>WindowsMaximizeHorizontally<CR>')
vim.keymap.set('n', '<C-w>0', '<cmd>WindowsEqualize<CR>')

