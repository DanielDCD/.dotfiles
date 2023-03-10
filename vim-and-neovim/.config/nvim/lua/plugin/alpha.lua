local alpha_ok, alpha = pcall(require, 'alpha')
if not alpha_ok then
  return
end

local dashboard = require('alpha.themes.dashboard')

local path_ok, plenary_path = pcall(require, 'plenary.path')
if not path_ok then
  return
end

local cdir = vim.fn.getcwd()

local icons = require('nvim-web-devicons')

local fortune = require('alpha.fortune')

-- LOGO
local header = {
  type = 'text',
  val = {
    [[                                                                   ]],
    [[      ████ ██████           █████      ██                    ]],
    [[     ███████████             █████                            ]],
    [[     █████████ ███████████████████ ███   ███████████  ]],
    [[    █████████  ███    █████████████ █████ ██████████████  ]],
    [[   █████████ ██████████ █████████ █████ █████ ████ █████  ]],
    [[ ███████████ ███    ███ █████████ █████ █████ ████ █████ ]],
    [[██████  █████████████████████ ████ █████ █████ ████ ██████]],
  },
  opts = { hl = 'Statement', position = 'center' },
}

-- RECENT FILES
local if_nil = vim.F.if_nil

local nvim_web_devicons = { enabled = true, highlight = true }

local function get_extension(fn)
  local match = fn:match('^.+(%..+)$')
  local ext = ''
  if match ~= nil then
    ext = match:sub(2)
  end
  return ext
end

local function icon(fn)
  local nwd = icons
  local ext = get_extension(fn)
  return nwd.get_icon(fn, ext, { default = true })
end

local function file_button(fn, sc, short_fn)
  short_fn = short_fn or fn
  local ico_txt
  local fb_hl = {}

  if nvim_web_devicons.enabled then
    local ico, hl = icon(fn)
    local hl_option_type = type(nvim_web_devicons.highlight)
    if hl_option_type == 'boolean' then
      if hl and nvim_web_devicons.highlight then
        table.insert(fb_hl, { hl, 0, 3 })
      end
    end
    if hl_option_type == 'string' then
      table.insert(fb_hl, { nvim_web_devicons.highlight, 0, 3 })
    end
    ico_txt = ico .. '  '
  else
    ico_txt = ''
  end
  local file_button_el = dashboard.button(sc, ico_txt .. short_fn, '<cmd>e ' .. fn .. ' <CR>')
  local fn_start = short_fn:match('.*[/\\]')
  if fn_start ~= nil then
    table.insert(fb_hl, { 'Keyword', #ico_txt - 2, #fn_start + #ico_txt })
  end
  file_button_el.opts.hl = fb_hl
  file_button_el.opts.hl_shortcut = 'Special'
  return file_button_el
end

local default_mru_ignore = { 'gitcommit' }

local mru_opts = {
  ignore = function(path, ext)
    return (string.find(path, 'COMMIT_EDITMSG')) or (vim.tbl_contains(default_mru_ignore, ext))
  end,
}

--- @param start number
--- @param cwd string? optional
--- @param items_number number? optional number of items to generate, default = 10
local function mru(start, cwd, items_number, opts)
  opts = opts or mru_opts
  items_number = if_nil(items_number, 10)

  local oldfiles = {}
  for _, v in pairs(vim.v.oldfiles) do
    if #oldfiles == items_number then
      break
    end
    local cwd_cond
    if not cwd then
      cwd_cond = true
    else
      cwd_cond = vim.startswith(v, cwd)
    end
    local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
    if (vim.fn.filereadable(v) == 1) and cwd_cond and not ignore then
      oldfiles[#oldfiles + 1] = v
    end
  end
  local target_width = 35

  local tbl = {}
  for i, fn in ipairs(oldfiles) do
    local short_fn
    if cwd then
      short_fn = vim.fn.fnamemodify(fn, ':.')
    else
      short_fn = vim.fn.fnamemodify(fn, ':~')
    end

    if #short_fn > target_width then
      short_fn = plenary_path.new(short_fn):shorten(1, { -2, -1 })
      if #short_fn > target_width then
        short_fn = plenary_path.new(short_fn):shorten(1, { -1 })
      end
    end

    local shortcut = tostring(i + start - 1)

    local file_button_el = file_button(fn, shortcut, short_fn)
    tbl[i] = file_button_el
  end
  return { type = 'group', val = tbl, opts = {} }
end

local section_mru = {
  type = 'group',
  val = {
    {
      type = 'text',
      val = 'Recent files',
      opts = {
        hl = 'Statement',
        shrink_margin = false,
        position = 'center',
      },
    },
    { type = 'padding', val = 1 },
    {
      type = 'group',
      val = function()
        return { mru(1, cdir, 9) }
      end,
      opts = { shrink_margin = false },
    },
  },
}

-- QUICK LINKS
local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = 'StorageClass'
  b.opts.hl_shortcut = 'Special'
  return b
end

local buttons = {
  type = 'group',
  val = {
    {
      type = 'text',
      val = 'Quick links',
      opts = { hl = 'Statement', position = 'center' },
    },
    { type = 'padding', val = 1 },
    button('e', '  New file', '<cmd>ene<CR>'),
    button('SPC f', '  Find file', '<cmd>Telescope find_files<CR>'),
    button('SPC h', '  Recently opened files', '<cmd>Telescope oldfiles<CR>'),
    button('SPC j', '  Jump List', '<cmd>Telescope jumplist<CR>'),
    button('SPC g', '  Live grep', '<cmd>Telescope live_grep<CR>'),
    button('SPC p', '  Projects', '<cmd>Telescope projects<CR>'),
    button('SPC l', '  Manage plugins', '<cmd>Lazy<CR>'),
    button('SPC u', '  Update plugins', '<cmd>Lazy update<CR>'),
    button('q', '  Quit', '<cmd>qa<CR>'),
  },
  position = 'center',
}

-- FOOTER
local footer = {
  type = 'text',
  val = fortune(),
  opts = { position = 'center', hl = 'String' },
}

local opts = {
  layout = {
    { type = 'padding', val = 2 },
    header,
    { type = 'padding', val = 2 },
    section_mru,
    { type = 'padding', val = 2 },
    buttons,
    { type = 'padding', val = 2 },
    footer,
  },
  opts = { margin = 5 },
}

alpha.setup(opts)
