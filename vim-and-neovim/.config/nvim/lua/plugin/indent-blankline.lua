local indent_blankline_ok, indent_blankline = pcall(require, 'indent_blankline')
if not indent_blankline_ok then
  return
end

local options = {
  show_current_context = true,
  show_current_context_start = true,
}

indent_blankline.setup(options)
