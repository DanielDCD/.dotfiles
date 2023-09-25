local tabby_ok, tabby = pcall(require, 'tabby')
if not tabby_ok then
  return
end

vim.opt.sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize'

local colors = require('dracula').colors()
local theme = {
  fill = { bg = colors.black },
  head = { bg = colors.purple, fg = colors.black, style = 'bold' },
  current_tab = { bg = colors.green, fg = colors.black, style = 'bold' },
  tab = { bg = colors.purple, fg = colors.black },
  win = { bg = colors.bg, fg = colors.white },
  current_win = { bg = colors.selection, fg = colors.bright_white, style = 'bold' },
  tail = { bg = colors.purple, fg = colors.black, style = 'bold' },
}

require('tabby.tabline').set(function(line)
  return {
    {
      { ' 󰓩 ', hl = theme.head },
      line.sep('', theme.head, theme.fill),
    },
    {
      line.tabs().foreach(function(tab)
        local hl_tab = tab.is_current() and theme.current_tab or theme.tab

        local tab_name = tab.name()
        if tab_name ~= '' then
          tab_name = ' ' .. tab_name
        end

        return {
          {
            line.sep('', hl_tab, theme.fill),
            {
              tab.is_current() and '  ' or '  ',
              tab.number(),
              tab_name,
              hl = hl_tab,
            },
            line.sep('', hl_tab, theme.fill),
            hl = hl_tab,
          },
          line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            if not tab.is_current() then
              return
            end
            local hl_win = win.is_current() and theme.current_win or theme.win
            return {
              line.sep('', hl_win, theme.fill),
              {
                win.file_icon() .. ' ',
                win.buf_name(),
                hl = hl_win,
              },
              line.sep('', hl_win, theme.fill),
              hl = hl_win,
              margin = ' ',
            }
          end),
        }
      end),
    },
  }
end, {
  tab_name = {
    name_fallback = function()
      return ''
    end,
    buf_name = {
      mode = 'unique',
    },
  },
})
