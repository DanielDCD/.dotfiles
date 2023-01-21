local nvim_autopairs_ok, nvim_autopairs = pcall(require, 'nvim-autopairs')
if not nvim_autopairs_ok then
  return
end

local options = {
  disable_filetype = { 'TelescopePrompt', 'vim' },
}

nvim_autopairs.setup(options)

-- CMP integration
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
  return
end
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
