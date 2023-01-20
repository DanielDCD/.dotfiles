local colors = require('dracula').colors()

require('barbecue').setup({
  theme = {
    normal = { bg = colors.bg },
    separator = { fg = colors.purple },
    modified = { fg = colors.bright_white },
    dirname = { fg = colors.purple },
    basename = { fg = colors.bright_white, bold = true },
    context = { fg = colors.bright_white },
  },
  show_modified = true,
  symbols = {
    separator = '',
  },
  attach_navic = false,
})
