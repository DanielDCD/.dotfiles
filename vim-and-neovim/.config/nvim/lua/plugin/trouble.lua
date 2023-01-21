local trouble_ok, trouble = pcall(require, 'trouble')
if not trouble_ok then
  return
end

local options = {}

trouble.setup(options)

vim.api.nvim_set_keymap(
  'n',
  '<leader>tro',
  '<cmd>TroubleToggle<cr>',
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>trw',
  '<cmd>TroubleToggle workspace_diagnostics<cr>',
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>trd',
  '<cmd>TroubleToggle document_diagnostics<cr>',
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>trl',
  '<cmd>TroubleToggle loclist<cr>',
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>trq',
  '<cmd>TroubleToggle quickfix<cr>',
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
  'n',
  'gR',
  '<cmd>TroubleToggle lsp_references<cr>',
  { silent = true, noremap = true }
)
