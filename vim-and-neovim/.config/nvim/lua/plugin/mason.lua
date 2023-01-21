local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then
  return
end

local options = { ui = { border = 'double' } }

mason.setup(options)
