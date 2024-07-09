local ibl_ok, ibl = pcall(require, 'ibl')
if not ibl_ok then
  return
end

local highlight = {
  'RainbowRed',
  'RainbowYellow',
  'RainbowBlue',
  'RainbowOrange',
  'RainbowGreen',
  'RainbowViolet',
  'RainbowCyan',
}

local colors = require('dracula').colors()

local hooks = require('ibl.hooks')

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, 'RainbowRed', { fg = colors.red })
  vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = colors.yellow })
  vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = colors.bright_blue })
  vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = colors.orange })
  vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = colors.green })
  vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = colors.purple })
  vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = colors.cyan })
end)

require('ibl').setup({ indent = { highlight = highlight } })

local options = {
  indent = { highlight = highlight },
}

ibl.setup(options)
