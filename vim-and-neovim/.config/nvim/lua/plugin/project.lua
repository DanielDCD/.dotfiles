local project_ok, project = pcall(require, 'project_nvim')
if not project_ok then
  return
end

project.setup()

-- Telescope integration
local telescope_ok, telescope = pcall(require, 'telescope')
if not telescope_ok then
  return
end
telescope.load_extension('projects')
vim.keymap.set('n', '<leader>pr', '<cmd>Telescope projects<CR>', { silent = true })
