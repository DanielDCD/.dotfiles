require("neo-tree").setup({
  popup_border_style = "single",
  sort_case_insensitive = true,
  default_component_configs = {
    git_status = {
      symbols = {
	added = "✚",
	modified = "",
      }
    },
  },
  window = {
    width = 30,
    mappings = {
      ["<space>"] = {
	  "toggle_node",
	  nowait = false,
      },
      ["<2-LeftMouse>"] = "open",
      ["<cr>"] = "open",
      ["<esc>"] = "revert_preview",
      ["P"] = { "toggle_preview", config = { use_float = true } },
      ["S"] = "open_split",
      ["s"] = "open_vsplit",
      ["t"] = "open_tabnew",
      ["w"] = "open_with_window_picker",
      ["C"] = "close_node",
      ["z"] = "close_all_nodes",
      ["Z"] = "expand_all_nodes",
      ["n"] = {
	"add",
	config = {
	  show_path = "none"
	}
      },
      ["N"] = "add_directory",
      ["d"] = "delete",
      ["r"] = "rename",
      ["y"] = "copy_to_clipboard",
      ["x"] = "cut_to_clipboard",
      ["p"] = "paste_from_clipboard",
      ["c"] = "copy",
      ["m"] = "move",
      ["q"] = "close_window",
      ["<leader>e"] = "close_window",
      ["R"] = "refresh",
      ["?"] = "show_help",
      ["<S-Tab>"] = "prev_source",
      ["<Tab>"] = "next_source",
    }
  },
  nesting_rules = {},
  filesystem = {
    filtered_items = {
      hide_by_name = {},
      hide_by_pattern = {},
      always_show = {},
      never_show = {},
      never_show_by_pattern = {},
    },
    follow_current_file = true,
    group_empty_dirs = true,
    hijack_netrw_behavior = "open_current",
    window = {
      mappings = {
	["u"] = "navigate_up",
	["."] = "set_root",
	["H"] = "toggle_hidden",
	["/"] = "fuzzy_finder",
	["D"] = "fuzzy_finder_directory",
	["f"] = "filter_on_submit",
	["<c-x>"] = "clear_filter",
	["[g"] = "prev_git_modified",
	["]g"] = "next_git_modified",
      }
    }
  },
  buffers = {
    follow_current_file = true,
    group_empty_dirs = true,
    window = {
      mappings = {
	["d"] = "buffer_delete",
	["u"] = "navigate_up",
	["."] = "set_root",
      }
    },
  },
  git_status = {
    window = {
      position = "float",
      mappings = {
	["A"] = "git_add_all",
	["gu"] = "git_unstage_file",
	["ga"] = "git_add_file",
	["gr"] = "git_revert_file",
	["gc"] = "git_commit",
	["gp"] = "git_push",
	["gg"] = "git_commit_and_push",
      }
    }
  },
  source_selector = {
    winbar = true,
    statusline = false,
  }
})

--Diagnostics icons
vim.fn.sign_define("DiagnosticSignError",
  {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
  {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
  {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
  {text = "", texthl = "DiagnosticSignHint"})

-- Mappings
vim.keymap.set('n', '<leader>e', ':Neotree left<CR>', {silent = true})
vim.keymap.set('n', '<leader>fe', ':Neotree float<CR>', {silent = true})

