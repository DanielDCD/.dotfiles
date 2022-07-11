require("nvim-tree").setup({
    view = {
        adaptive_size = true,
        number = true,
        relativenumber = true,
        mappings = {
            custom_only = false,
            list = {
                {key = "<Tab>", action = ""},
                {key = "ñ", action = "preview"},
                {key = "D", action = "remove"},
                {key = "d", action = "trash"},
                {key = "a", action = ""},
                {key = "n", action = "create"}
            }
        }
    },
    renderer = {
        add_trailing = true,
        group_empty = true,
        highlight_git = false,
        full_name = true,
        highlight_opened_files = "name",
        indent_markers = {
            enable = true,
            icons = {corner = "└ ", edge = "│ ", item = "│ ", none = "  "}
        },
        icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {file = true, folder = true, folder_arrow = true, git = true},
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = ""
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌"
                }
            }
        },
        special_files = {"Cargo.toml", "Makefile", "README.md", "readme.md"}
    },
    update_focused_file = {enable = true},
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {hint = "", info = "", warning = "", error = ""}
    },
    filters = {
        dotfiles = false,
        custom = {"node_modules", "\\.cache", "\\.git"}
    },
    trash = {cmd = "gio trash", require_confirm = false},
    live_filter = {prefix = "[FILTER]: ", always_show_folders = true}
})

vim.keymap.set('n', '<Leader>e', ':NvimTreeToggle<CR>', {silent = true})
