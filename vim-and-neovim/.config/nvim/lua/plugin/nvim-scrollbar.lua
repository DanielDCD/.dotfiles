local scrollbar_ok, scrollbar = pcall(require, 'scrollbar')
if not scrollbar_ok then
  return
end

local options = {
  hide_if_all_visible = true,
  handlers = {
    gitsigns = true,
  },
}

scrollbar.setup(options)
