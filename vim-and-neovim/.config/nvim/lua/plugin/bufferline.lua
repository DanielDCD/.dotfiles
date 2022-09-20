-- Options
local present, bufferline = pcall(require, "bufferline")

if not present then
   return
end

local options = {
  options = {
    mode = "buffers",
    numbers = function(opts)
      return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
    end,
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    offsets = {{ filetype = "NvimTree", text = "Files", highlight = "Directory"}},
    indicator = {
	icon = '▎',
	style = 'icon'
    },
    buffer_close_icon = "",
    modified_icon = "",
    close_icon = "",
    show_close_icon = true,
    left_trunc_marker = " ",
    right_trunc_marker = " ",
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    show_tab_indicators = true,
    enforce_regular_tabs = false,
    view = "multiwindow",
    show_buffer_close_icons = true,
    separator_style = "slant",
    always_show_bufferline = true,
    diagnostics = "nvim_lsp" or "coc",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
          or (e == "warning" and " " or "" )
        s = s .. n .. sym
      end
      return s
    end,
    themable = true,
    custom_areas = {
	  right = function()
	    local result = {}
	    local seve = vim.diagnostic.severity
	    local error = #vim.diagnostic.get(0, {severity = seve.ERROR})
	    local warning = #vim.diagnostic.get(0, {severity = seve.WARN})
	    local info = #vim.diagnostic.get(0, {severity = seve.INFO})
	    local hint = #vim.diagnostic.get(0, {severity = seve.HINT})

	    if error ~= 0 then
	      table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
	    end

	    if warning ~= 0 then
	      table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
	    end

	    if hint ~= 0 then
	      table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E"})
	    end

	    if info ~= 0 then
	      table.insert(result, {text = "  " .. info, guifg = "#7EA9A7"})
	    end
	    return result
	  end,
    },
    groups = {
      items = {
	require('bufferline.groups').builtin.pinned:with({ icon = "" })
	}
    },
    custom_filter = function(buf_number)
       -- Func to filter out our managed/persistent split terms
       local present_type, type = pcall(function()
          return vim.api.nvim_buf_get_var(buf_number, "term_type")
       end)
       if present_type then
          if type == "vert" then
             return false
          elseif type == "hori" then
             return false
          end
          return true
       end

       return true
     end,
  },
}

bufferline.setup(options)

-- Mappings
vim.cmd([[
    nnoremap <silent> <Tab> :BufferLineCycleNext<CR>
    nnoremap <silent> <S-Tab> :BufferLineCyclePrev<CR>
    nnoremap <silent> gb :BufferLinePick<CR>
    nnoremap <silent> <Leader>bc <Cmd>:BufferLinePickClose<CR>
    nnoremap <silent> g1 <Cmd>:BufferLineGoToBuffer 1<CR>
    nnoremap <silent> g2 <Cmd>:BufferLineGoToBuffer 2<CR>
    nnoremap <silent> g3 <Cmd>:BufferLineGoToBuffer 3<CR>
    nnoremap <silent> g4 <Cmd>:BufferLineGoToBuffer 4<CR>
    nnoremap <silent> g5 <Cmd>:BufferLineGoToBuffer 5<CR>
    nnoremap <silent> g6 <Cmd>:BufferLineGoToBuffer 6<CR>
    nnoremap <silent> g7 <Cmd>:BufferLineGoToBuffer 7<CR>
    nnoremap <silent> g8 <Cmd>:BufferLineGoToBuffer 8<CR>
    nnoremap <silent> g9 <Cmd>:BufferLineGoToBuffer 9<CR>
    nnoremap <silent> <S-PageDown> :BufferLineMoveNext<CR>
    nnoremap <silent> <S-PageUp> :BufferLineMovePrev<CR>
]])
