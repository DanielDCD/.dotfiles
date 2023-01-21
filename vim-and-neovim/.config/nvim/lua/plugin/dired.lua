local dired_ok, dired = pcall(require, 'dired')
if not dired_ok then
  return
end

local options = {
  path_separator = '/',
  show_hidden = true,
}

dired.setup(options)

vim.keymap.set('n', '<Leader>dr', ':Dired<CR>', { silent = true })
