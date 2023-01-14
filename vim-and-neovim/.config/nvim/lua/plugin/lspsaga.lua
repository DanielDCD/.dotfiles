local keymap = vim.keymap.set
local saga = require('lspsaga')

-- Colorscheme
local colors = require('dracula').colors()

-- Lps finder
keymap('n', 'gñ', '<cmd>Lspsaga lsp_finder<CR>', { silent = true })

-- Code action
keymap('n', '<M-CR>', '<cmd>Lspsaga code_action<CR>', { silent = true })

-- Rename
keymap('n', '<F2>', '<cmd>Lspsaga rename<CR>', { silent = true })

-- Definition preview
keymap('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', { silent = true })

-- Go to definition
keymap('n', 'gD', '<cmd>Lspsaga goto_definition<CR>', { silent = true })

-- Show line diagnostics
keymap('n', 'gl', '<cmd>Lspsaga show_line_diagnostics<CR>', { silent = true })

-- Show cursor diagnostic
keymap('n', 'gc', '<cmd>Lspsaga show_cursor_diagnostics<CR>', { silent = true })

-- Show buffer diagnostic
keymap('n', 'gB', '<cmd>Lspsaga show_buf_diagnostics<CR>', { silent = true })

-- Diagnsotic jump
keymap('n', '[e', '<cmd>Lspsaga diagnostic_jump_next<CR>', { silent = true })
keymap('n', ']e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', { silent = true })

-- Only jump to error
keymap('n', '[E', function()
  require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap('n', ']E', function()
  require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Outline
keymap('n', '<leader>o', '<cmd>Lspsaga outline<CR>', { silent = true })

-- Hover Doc
keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { silent = true })

-- Floaterm
keymap({ 'n' }, '<leader>tf', '<cmd>Lspsaga term_toggle<CR>')

-- Call hierarchy
keymap('n', '<Leader>ci', '<cmd>Lspsaga incoming_calls<CR>')
keymap('n', '<Leader>co', '<cmd>Lspsaga outgoing_calls<CR>')

-- Options
saga.setup({
  code_action = {
    keys = {
      quit = '<Esc>',
    },
  },
  rename = {
    quit = '<Esc>',
  },
  outline = {
    win_width = 30,
    auto_close = true,
    keys = {
      expand_collapse = '<CR>',
    },
  },
  symbol_in_winbar = {
    enable = false,
  },
  definition = {
    quit = '<C-q>',
  },
  callhierarchy = {
    keys = {
      quit = '<C-q>'
    }
  },
  ui = {
    border = 'single',
    preview = ' ',
    code_action = '',
    diagnostic = 'ﴫ',
    colors = {
      normal_bg = colors.bg,
      title_bg = colors.purple,
      red = colors.red,
      magenta = colors.pink,
      orange = colors.orange,
      yellow = colors.yellow,
      green = colors.green,
      cyan = colors.cyan,
      blue = colors.bright_blue,
      purple = colors.purple,
      white = colors.white,
      black = colors.black,
    },
  },
})
