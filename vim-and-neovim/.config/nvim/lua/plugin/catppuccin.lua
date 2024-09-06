local catppuccin_ok, catppuccin = pcall(require, "catppuccin")
if not catppuccin_ok then
  return
end

catppuccin.setup({
  flavour = "macchiato",
  show_end_of_buffer = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    treesitter = true,
    lsp_saga = true,
    neotree = true,
    mason = true,
    fidget = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    leap = true,
    lsp_trouble = true,
    alpha = true,
  },
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
