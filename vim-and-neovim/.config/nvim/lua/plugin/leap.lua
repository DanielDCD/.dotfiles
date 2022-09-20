local leap = require("leap")

local function leap_all_windows()
    leap.leap({
	target_windows = vim.tbl_filter(function(win)
	    return vim.api.nvim_win_get_config(win).focusable
	end, vim.api.nvim_tabpage_list_wins(0)),
    })
end

local function basic_leap()
    leap.leap {}
end

vim.keymap.set("n", "ñ", leap_all_windows, { silent = true })
vim.keymap.set("n", "Ñ", basic_leap, { silent = true })
