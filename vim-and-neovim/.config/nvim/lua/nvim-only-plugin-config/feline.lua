local feline = require('feline')

-- Theme
local colors = {
    bg = '#282a36',
    black = '#191a21',
    yellow = '#f1fa8c',
    cyan = '#8be9fd',
    oceanblue = '#a4ffff',
    green = '#50fa7b',
    orange = '#ffb86c',
    violet = '#bd93f9',
    magenta = '#ff79c6',
    white = '#abb2bf',
    fg = '#f8f8f2',
    skyblue = '#8be9fd',
    red = '#ff5555'
}

local vi_mode_colors = {
    NORMAL = colors.violet,
    INSERT = colors.green,
    VISUAL = colors.yellow,
    OP = colors.green,
    BLOCK = colors.yellow,
    REPLACE = colors.orange,
    ['V-REPLACE'] = colors.orange,
    ENTER = colors.pruple,
    MORE = colors.pruple,
    SELECT = colors.yellow,
    COMMAND = colors.violet,
    SHELL = colors.green,
    TERM = colors.green,
    NONE = colors.purple
}

-- Initialize the components table
local components = {active = {}, inactive = {}}

-- Insert two sections (left and right) for the active statusline
table.insert(components.active, {})
table.insert(components.active, {})

-- Insert one section for the inactive statusline
table.insert(components.inactive, {})

-- ACTIVE COMPONENTS --

-- Vi mode
table.insert(components.active[1], {
    provider = {
        name = 'vi_mode',
        opts = {show_mode_name = true, vi_mode_colors = vi_mode_colors}
    },
    hl = function()
        return {
            name = require('feline.providers.vi_mode').get_mode_highlight_name(),
            fg = colors.black,
            bg = require('feline.providers.vi_mode').get_mode_color(),
            style = 'bold'
        }
    end,
    left_sep = ' ',
    right_sep = '',
    truncate_hide = false,
    priority = 3
})

-- File path/name
table.insert(components.active[1], {
    provider = {
        name = 'file_info',
        opts = {colored_icon = true, type = 'relative'}
    },
    short_provider = {
        name = 'file_info',
        opts = {colored_icon = true, type = 'unique'}
    },
    hl = {fg = 'fg', bg = 'bg', style = 'bold'},
    left_sep = ' ',
    right_sep = ' ',
    truncate_hide = true,
    priority = 2
})

local lsp = require 'feline.providers.lsp'

-- LSP hints
table.insert(components.active[2], {
    provider = 'diagnostic_hints',
    enabled = function()
        return lsp.diagnostics_exist(vim.diagnostic.severity.HINT)
    end,
    hl = {fg = 'cyan', style = 'bold'},
    truncate_hide = true,
    priority = 2

})

-- LSP info
table.insert(components.active[2], {
    provider = 'diagnostic_info',
    enabled = function()
        return lsp.diagnostics_exist(vim.diagnostic.severity.INFO)
    end,
    hl = {fg = 'cyan', style = 'bold'},
    truncate_hide = true,
    priority = 2

})

-- LSP warnings
table.insert(components.active[2], {
    provider = 'diagnostic_warnings',
    enabled = function()
        return lsp.diagnostics_exist(vim.diagnostic.severity.WARN)
    end,
    hl = {fg = 'yellow', style = 'bold'},
    truncate_hide = true,
    priority = 2

})

-- LPS errors
table.insert(components.active[2], {
    provider = 'diagnostic_errors',
    enabled = function()
        return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR)
    end,
    hl = {fg = 'red', style = 'bold'},
    truncate_hide = true,
    priority = 2

})

-- LSP server name
table.insert(components.active[2], {
    provider = 'lsp_client_names',
    hl = {fg = 'black', bg = 'skyblue', style = 'bold'},
    left_sep = ' ',
    right_sep = '',
    truncate_hide = true,
    priority = 1

})

-- Git deletions
table.insert(components.active[2],
             {provider = 'git_diff_removed', hl = {fg = 'red'}})

-- Git changes
table.insert(components.active[2], {
    provider = 'git_diff_changed',
    hl = {fg = 'cyan'},
    truncate_hide = true,
    priority = 1

})

-- Git additions
table.insert(components.active[2], {
    provider = 'git_diff_added',
    hl = {fg = 'green'},
    truncate_hide = true,
    priority = 1
})

-- Current Git branch
table.insert(components.active[2], {
    provider = 'git_branch',
    hl = {fg = 'black', bg = 'orange', style = 'bold'},
    left_sep = ' ',
    right_sep = '',
    truncate_hide = true,
    priority = 1

})

-- File size
table.insert(components.active[2], {
    provider = 'file_size',
    hl = {fg = 'black', bg = 'magenta', style = 'bold'},
    left_sep = ' ',
    right_sep = '█',
    truncate_hide = true,
    priority = 1

})

-- File type
table.insert(components.active[2], {
    provider = 'file_type',
    hl = {fg = 'black', bg = 'magenta', style = 'bold'},
    left_sep = '█',
    right_sep = '█',
    truncate_hide = true,
    priority = 1

})

-- File encoding
table.insert(components.active[2], {
    provider = 'file_encoding',
    hl = {fg = 'black', bg = 'magenta', style = 'bold'},
    left_sep = '█',
    right_sep = '█',
    truncate_hide = true,
    priority = 1

})

-- OS info
local function file_osinfo()
    local os = vim.bo.fileformat:upper()
    local icon
    if os == 'UNIX' then
        icon = ' '
    elseif os == 'MAC' then
        icon = ' '
    else
        icon = ' '
    end
    return icon .. os
end

table.insert(components.active[2], {
    provider = file_osinfo,
    hl = {fg = 'black', bg = 'magenta', style = 'bold'},
    left_sep = '█',
    right_sep = {str = ' █', hl = {fg = 'violet', bg = 'magenta'}},
    truncate_hide = true,
    priority = 1

})

-- Line percentage
table.insert(components.active[2], {
    provider = 'line_percentage',
    hl = {fg = 'black', bg = 'violet', style = 'bold'},
    left_sep = '█',
    truncate_hide = true,
    priority = 2

})

-- Scroll bar
table.insert(components.active[2], {
    provider = 'scroll_bar',
    hl = {fg = 'green', bg = 'violet', style = 'bold'},
    left_sep = '█',
    right_sep = '█',
    truncate_hide = true,
    priority = 1

})

-- Current position
table.insert(components.active[2], {
    provider = {name = 'position', opts = {format = '{line}:{col}'}},
    hl = {fg = 'black', bg = 'violet', style = 'bold'},
    right_sep = ' ',
    truncate_hide = true,
    priority = 3

})

-- INACTIVE COMPONENTS --

-- File path/name
table.insert(components.inactive[1], {
    provider = {
        name = 'file_info',
        opts = {colored_icon = true, type = 'relative'}
    },
    short_provider = {
        name = 'file_info',
        opts = {colored_icon = true, type = 'unique'}
    },
    hl = {fg = 'fg', bg = 'bg', style = 'bold'},
    left_sep = ' ',
    right_sep = ' ',
    truncate_hide = true,
    priority = 3

})

-- SETUP --
feline.setup {
    components = components,
    theme = colors,
    vi_mode_colors = vi_mode_colors
}
