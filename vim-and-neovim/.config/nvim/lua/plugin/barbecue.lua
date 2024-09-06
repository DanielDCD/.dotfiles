local colors = require("catppuccin.palettes").get_palette("macchiato")

require('barbecue').setup({
  theme = {
    normal = { bg = colors.surface0 },
    separator = { fg = colors.mauve },
    modified = { fg = colors.text },
    dirname = { fg = colors.mauve },
    basename = { fg = colors.text, bold = true },
    context = { fg = colors.text },
  },
  show_modified = true,
  symbols = {
    separator = '',
  },
  attach_navic = false,
})
