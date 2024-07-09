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

options = {}

ibl.setup(options)
