local keymap = vim.keymap.set
local saga = require('lspsaga')

-- Lps finder
keymap("n", "gñ", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
keymap("n", "<M-CR>", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("v", "<M-CR>", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })

-- Rename
keymap("n", "<F2>", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Definition preview
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- Show line diagnostics
keymap("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostic
keymap("n", "gc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })

-- Only jump to error
keymap("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Outline
keymap("n","<leader>o", "<cmd>LSoutlineToggle<CR>", { silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Floaterm
vim.keymap.set("n", "<leader>tf", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
vim.keymap.set("t", "<C-esc>", "<C-\\><C-n><cmd>Lspsaga close_floaterm<CR>", { silent = true })

-- Options
saga.init_lsp_saga({
    border_style = "single",

    saga_winblend = 0,

    move_in_saga = { prev = '<C-p>', next = '<C-n>'},

    diagnostic_header = { " ", " ", " ", "ﴞ " },

    max_preview_lines = 10,

    code_action_icon = " ",
    code_action_num_shortcut = true,
    code_action_lightbulb = {
	enable = true,
	sign = true,
	enable_in_insert = true,
	sign_priority = 20,
	virtual_text = true,
    },

    finder_icons = {
      def = '  ',
      ref = '諭 ',
      link = '  ',
    },
    finder_request_timeout = 1500,
    finder_action_keys = {
	open = "<CR>",
	vsplit = "s",
	split = "i",
	tabe = "t",
	quit = "q",
	scroll_down = "<C-f>",
	scroll_up = "<C-b>",
    },

    definition_action_keys = {
      edit = '<C-c>o',
      vsplit = '<C-c>v',
      split = '<C-c>i',
      tabe = '<C-c>t',
      quit = 'q',
    },

    code_action_keys = {
	quit = "<esc>",
	exec = "<CR>",
    },

    rename_action_quit = "<esc>",
    rename_in_select = true,

    symbol_in_winbar = {
	in_custom = false,
	enable = false,
	separator = ' ',
	show_file = true,
	click_support = false,
    },

    show_outline = {
      win_position = 'right',
      win_with = '',
      win_width = 30,
      auto_enter = true,
      auto_preview = true,
      virt_text = '┃',
      auto_refresh = true,
    },

    custom_kind = {},
})

