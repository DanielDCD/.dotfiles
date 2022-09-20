local project = require('project_nvim')

project.setup()

-- Telescope integration
require('telescope').load_extension('projects')
vim.keymap.set('n', '<leader>pr', '<cmd>Telescope projects<CR>', {silent = true})
