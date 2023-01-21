local illuminate_ok, illuminate = pcall(require, 'illuminate')
if not illuminate_ok then
  return
end

-- Options
local options = {}

illuminate.configure(options)

-- Highlight groups
vim.cmd([[
    hi IlluminatedWordText guibg=#44475a gui=none
    hi IlluminatedWordRead guibg=#44475a gui=none
    hi IlluminatedWordWrite guibg=#44475a gui=none
]])
