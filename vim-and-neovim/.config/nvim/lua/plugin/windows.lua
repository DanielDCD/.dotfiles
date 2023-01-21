local windows_ok, windows = pcall(require, 'windows')
if not windows_ok then
  return
end

vim.o.winwidth = 10
vim.o.winminwidth = 10
vim.o.equalalways = false

local options = {
  autowidth = {
    enable = false,
  },
}

windows.setup(options)

vim.keymap.set('n', '<C-w>m', '<cmd>WindowsMaximize<CR>')
vim.keymap.set('n', '<C-w>,', '<cmd>WindowsMaximizeVertically<CR>')
vim.keymap.set('n', '<C-w>.', '<cmd>WindowsMaximizeHorizontally<CR>')
vim.keymap.set('n', '<C-w>0', '<cmd>WindowsEqualize<CR>')
