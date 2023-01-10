local null_ls = require("null-ls")

-- Sources
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local hover = null_ls.builtins.hover
local completion = null_ls.builtins.completion

local sources = {

  -- Formatters
  formatting.stylua,

}

-- Options
null_ls.setup({
  debug = false,
  sources = sources,
})

-- Functions
vim.api.nvim_create_user_command("FormatBuffer", function()
  vim.lsp.buf.format()
end, { nargs = 0 })

