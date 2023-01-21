local neo_tree_ok, neo_tree = pcall(require, 'neo-tree')
if not neo_tree_ok then
  return
end

local options = {
  popup_border_style = 'single',
  sort_case_insensitive = true,
  default_component_configs = {
    git_status = {
      symbols = {
        added = '✚',
        modified = '',
      },
    },
  },
  window = {
    width = 30,
    mappings = {
      ['n'] = {
        'add',
        config = {
          show_path = 'none',
        },
      },
      ['N'] = 'add_directory',
      ['<leader>e'] = 'close_window',
      ['<S-Tab>'] = 'prev_source',
      ['<Tab>'] = 'next_source',
    },
  },
  filesystem = {
    follow_current_file = true,
    group_empty_dirs = true,
    hijack_netrw_behavior = 'open_current',
    window = {
      mappings = {
        ['u'] = 'navigate_up',
      },
    },
  },
  buffers = {
    follow_current_file = true,
    window = {
      mappings = {
        ['d'] = 'buffer_delete',
        ['u'] = 'navigate_up',
      },
    },
  },
  source_selector = {
    winbar = true,
    statusline = true,
  },
}

neo_tree.setup(options)

--Diagnostics icons
vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

-- Mappings
vim.keymap.set('n', '<leader>e', ':Neotree left<CR>', { silent = true })
vim.keymap.set('n', '<leader>fe', ':Neotree float<CR>', { silent = true })
