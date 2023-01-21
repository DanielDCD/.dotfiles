local null_ls_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_ok then
  return
end

-- Sources
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local hover = null_ls.builtins.hover
local completion = null_ls.builtins.completion

local sources = {

  -- Formatters
  formatting.stylua,
  formatting.autopep8,
  formatting.autoflake,
  formatting.isort,
  formatting.beautysh,

}

-- Options
null_ls.setup({
  debug = false,
  sources = sources,
})

-- Functions
vim.api.nvim_create_user_command('FormatBuffer', function()
  vim.lsp.buf.format()
end, { nargs = 0 })
