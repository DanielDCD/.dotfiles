local heirline = require('heirline')
local utils = require('heirline.utils')
local conditions = require('heirline.conditions')
local devicons = require('nvim-web-devicons')
local os_sep = package.config:sub(1, 1)

-- Colors
local colors = require('dracula').colors()
heirline.load_colors(colors)

-- Separators
local seps = {
  lower = {
    left = '',
    right = '',
  },
  upper = {
    left = '',
    right = '',
  },
}

-- Utility components
local Align = {
  provider = '%=',
}

local Null = {
  provider = '',
}

-- MODE AREA

-- Vi mode
local ViMode = {
  static = {
    mode_names = {
      n = 'NORMAL',
      no = 'NORMAL?',
      nov = 'NORMAL?',
      noV = 'NORMAL?',
      ['no\22'] = 'NORMAL?',
      niI = 'INSERT (NORMAL)',
      niR = 'REPLACE (NORMAL)',
      niV = 'VIRTUAL REPLACE (NORMAL)',
      nt = 'TERMINAL (NORMAL)',
      v = 'VISUAL',
      vs = 'VISUAL',
      V = 'V-LINES',
      Vs = 'V-LINES',
      ['\22'] = 'V-BLOCK',
      ['\22s'] = 'V-BLOCK',
      s = 'SELECT',
      S = 'S-LINES',
      ['\19'] = 'S-BLOCK',
      i = 'INSERT ',
      ic = 'INSERT COMPLETION',
      ix = 'INSERT COMPLETION ^X (^]^D^E^F^I^K^L^N^O^Ps^U^V^Y)',
      R = 'REPLACE',
      Rc = 'REPLACE COMPLETION ',
      Rx = 'REPLACE COMPLETION ^X (^]^D^E^F^I^K^L^N^O^Ps^U^V^Y)',
      Rv = 'VIRTUAL REPLACE',
      Rvc = 'VIRTUAL REPLACE COMPLETION',
      Rvx = 'VIRTUAL REPLACE COMPLETION ^X (^]^D^E^F^I^K^L^N^O^Ps^U^V^Y)',
      c = 'COMMAND',
      cv = 'EX',
      r = '...',
      rm = 'M',
      ['r?'] = 'CONFIRM',
      ['!'] = 'SHELL',
      t = 'TERMINAL',
    },
  },
  provider = function(self)
    return '  %2(' .. self.mode_names[self.mode] .. '%)'
  end,
}

-- Spell
local Spell = {
  condition = function()
    return vim.wo.spell
  end,
  provider = ' SPELL',
}

-- Snippets
local Snippets = {
  condition = function()
    return vim.tbl_contains({ 's', 'i' }, vim.fn.mode())
  end,
  provider = function()
    local forward = (vim.fn['UltiSnips#CanJumpForwards']() == 1) and '  ' or ''
    local backward = (vim.fn['UltiSnips#CanJumpBackwards']() == 1) and '  ' or ''
    return backward .. forward
  end,
}

-- Compilation
local ModeArea = {
  ViMode,
  Spell,
  Snippets,
  hl = function(self)
    local mode = self.mode:sub(1, 1)
    return { fg = 'black', bg = self.mode_colors[mode], bold = true }
  end,
}
ModeArea = utils.surround({ nil, seps.lower.right }, nil, ModeArea)

-- GIT AREA

-- Current git branch
local GitBranch = {
  provider = function(self)
    return '  ' .. self.status_dict.head
  end,
  hl = { fg = 'orange', bold = true },
}

-- Lines added
local GitAdded = {
  provider = function(self)
    local count = self.status_dict.added or 0
    return count > 0 and ('  ' .. count)
  end,
  hl = { fg = 'green' },
}

-- Lines deleted
local GitDeleted = {
  provider = function(self)
    local count = self.status_dict.removed or 0
    return count > 0 and ('  ' .. count)
  end,
  hl = { fg = 'red' },
}

-- Lines changed
local GitChanged = {
  provider = function(self)
    local count = self.status_dict.changed or 0
    return count > 0 and (' 柳' .. count)
  end,
  hl = { fg = 'cyan' },
}

-- Git metrics
local GitMetrics = {
  {
    GitAdded,
    GitDeleted,
    GitChanged,
  },

  Null,
  flexible = 19,
}

-- Compilation

local GitArea = {
  GitBranch,
  GitMetrics,
}
GitArea = utils.surround({ seps.upper.left, seps.lower.right }, 'selection', GitArea)
GitArea = {
  GitArea,
  condition = conditions.is_git_repo,
  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0
      or self.status_dict.removed ~= 0
      or self.status_dict.changed ~= 0
  end,

  Null,
  flexible = 20,
}

-- PATH AREA

-- Read only icon
local ReadOnly = {
  condition = function()
    return not vim.bo.modifiable or vim.bo.readonly
  end,
  provider = ' ',
}

-- File icon
local FileIcon = {
  condition = function()
    return vim.bo.filetype ~= 'help'
  end,
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ':e')
    self.icon, self.icon_color = devicons.get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self)
    if self.icon then
      return self.icon .. ' '
    end
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end,
}

-- Current Workng Directory
local CWD = {
  condition = function(self)
    if vim.bo.buftype == '' then
      return self.pwd and vim.bo.filetype ~= 'help'
    end
  end,
  hl = { fg = 'white' },
  {
    provider = function(self)
      return self.pwd
    end,
  },
  {
    provider = function(self)
      return vim.fn.pathshorten(self.pwd)
    end,
  },

  Null,
  flexible = 2,
}

-- Path of current file
local CurrentPath = {
  condition = function(self)
    if vim.bo.buftype == '' then
      return self.current_path and vim.bo.filetype ~= 'help'
    end
  end,
  {
    provider = function(self)
      return self.current_path
    end,
  },
  {
    provider = function(self)
      return vim.fn.pathshorten(self.current_path, 2)
    end,
  },

  Null,
  flexible = 6,
}

-- Current file name
local FileName = {
  condition = function()
    return vim.bo.filetype ~= 'help'
  end,
  provider = function(self)
    return self.filename
  end,
  hl = { fg = 'bright_white', bold = true },
}

-- Current help file name
local HelpFileName = {
  condition = function()
    return vim.bo.filetype == 'help'
  end,
  provider = function()
    local filename = vim.api.nvim_buf_get_name(0)
    return vim.fn.fnamemodify(filename, ':t')
  end,
  hl = { fg = 'bright_white', bold = true },
}

-- File modified icon
local FileModified = {
  condition = function()
    return vim.bo.modified
  end,
  provider = ' ',
  hl = { fg = 'bright_white' },
}

-- Compilation
local PathArea = {
  {
    Align,
    ReadOnly,
    FileIcon,
    CWD,
    CurrentPath,
    FileName,
    HelpFileName,
    FileModified,
    Align,
  },
}
PathArea = utils.surround({ seps.upper.left, seps.upper.right }, 'selection', PathArea)

-- LSP AREA

-- LSP diagnostics
local LSPDiagnostics = {
  condition = conditions.has_diagnostics,
  static = {
    error_icon = vim.fn.sign_getdefined('DiagnosticSignError')[1].text,
    warn_icon = vim.fn.sign_getdefined('DiagnosticSignWarn')[1].text,
    info_icon = vim.fn.sign_getdefined('DiagnosticSignInfo')[1].text,
    hint_icon = vim.fn.sign_getdefined('DiagnosticSignHint')[1].text,
  },
  init = function(self)
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  end,
  {
    provider = function(self)
      if self.errors > 0 then
        return table.concat({ self.errors, self.error_icon, ' ' })
      end
    end,
    hl = { fg = 'red' },
  },
  {
    provider = function(self)
      if self.warnings > 0 then
        return table.concat({ self.warnings, self.warn_icon, ' ' })
      end
    end,
    hl = { fg = 'yellow' },
  },
  {
    provider = function(self)
      if self.info > 0 then
        return table.concat({ self.info, self.info_icon, ' ' })
      end
    end,
    hl = { fg = 'cyan' },
  },
  {
    provider = function(self)
      if self.hints > 0 then
        return table.concat({ self.hints, self.hint_icon, ' ' })
      end
    end,
    hl = { fg = 'cyan' },
  },
  on_click = {
    callback = function()
      require('trouble').toggle({ mode = 'document_diagnostics' })
    end,
    name = 'heirline_diagnostics',
  },
}

-- Current language servers
local LSPActive = {
  condition = conditions.lsp_attached,
  update = { 'LspAttach', 'LspDetach' },
  provider = function()
    local names = {}
    for i, server in pairs(vim.lsp.buf_get_clients(0)) do
      table.insert(names, server.name)
    end
    return '' .. table.concat(names, ' ') .. '  '
  end,
  hl = { fg = 'cyan', bold = true },
  on_click = {
    name = 'heirline_LSP',
    callback = function()
      vim.schedule(function()
        vim.cmd('LspInfo')
      end)
    end,
  },
}

-- Compilation
local LSPArea = {
  LSPDiagnostics,
  LSPActive,
}
LSPArea = utils.surround({ seps.lower.left, seps.upper.right }, 'selection', LSPArea)
LSPArea = {
  LSPArea,
  condition = conditions.lsp_attached or conditions.has_diagnostics,

  Null,
  flexible = 10,
}

-- FILE INFO AREA

-- Current file's last modified date
local FileLastModified = {
  provider = function()
    local ftime = vim.fn.getftime(vim.api.nvim_buf_get_name(0))
    return (ftime > 0) and string.upper(os.date('%c', ftime) .. ' - ')
  end,

  Null,
  flexible = 1,
}

-- File size
local FileSize = {
  provider = function()
    local suffix = { 'b', 'k', 'M', 'G', 'T', 'P', 'E' }
    local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
    fsize = (fsize < 0 and 0) or fsize
    if fsize < 1024 then
      return fsize .. suffix[1] .. ' '
    end
    local i = math.floor((math.log(fsize) / math.log(1024)))
    return string.format('%.2g%s', fsize / 1024 ^ i, suffix[i + 1]) .. ' '
  end,

  Null,
  flexible = 3,
}

-- Current file's encoding
local FileEncoding = {
  provider = function()
    local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc
    if enc ~= 'utf-8' then
      return enc:upper() .. ' '
    else
      return nil
    end
  end,

  Null,
  flexible = 4,
}

-- Current file's format
local FileFormat = {
  provider = function()
    local fmt = vim.bo.fileformat
    if fmt ~= 'unix' then
      return fmt:upper() .. ' '
    else
      return nil
    end
  end,

  Null,
  flexible = 4,
}

-- Current file's type
local FileType = {
  provider = function()
    local ft = string.upper(vim.bo.filetype)
    if ft == '' then
      return 'NO-FT'
    else
      return ft
    end
  end,
  on_click = {
    name = 'heirline_filetype',
    callback = function()
      vim.schedule(function()
        vim.cmd('Telescope filetypes')
      end)
    end,
  },
}

-- Compilation
local FileInfoArea = {
  FileLastModified,
  FileSize,
  FileEncoding,
  FileFormat,
  FileType,
}
FileInfoArea = utils.surround({ seps.lower.left, seps.upper.right }, 'selection', FileInfoArea)
FileInfoArea = {
  FileInfoArea,

  Null,
  flexible = 5,
}

-- NAVIGATION AREA

-- Current line and column
local Ruler = {
  provider = '%l/%L %2c %P ',
}

-- ScrollBar
local ScrollBar = {
  static = {
    sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' },
  },
  provider = function(self)
    local curr_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)
    local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
    return string.rep(self.sbar[i], 2)
  end,
}

-- Compilation
local NavigationArea = {
  Ruler,
  ScrollBar,
  hl = function(self)
    local mode = self.mode:sub(1, 1)
    return { fg = 'black', bg = self.mode_colors[mode], bold = true }
  end,
}
NavigationArea = utils.surround({ seps.lower.left, nil }, nil, NavigationArea)

-- STATUSLINE
local StatusLine = {
  init = function(self)
    self.mode = vim.fn.mode(1)
    if not self.once then
      vim.api.nvim_create_autocmd('ModeChanged', {
        pattern = '*:*o',
        command = 'redrawstatus',
      })
      self.once = true
    end

    local pwd = vim.fn.getcwd(0)
    local current_path = vim.api.nvim_buf_get_name(0)
    local filename

    if current_path == '' then
      pwd = vim.fn.fnamemodify(pwd, ':~')
      current_path = nil
      filename = ' [No Name]'
    elseif current_path:find(pwd, 1, true) then
      filename = vim.fn.fnamemodify(current_path, ':t')
      current_path = vim.fn.fnamemodify(current_path, ':~:.:h')
      pwd = vim.fn.fnamemodify(pwd, ':~') .. os_sep
      if current_path == '.' then
        current_path = nil
      else
        current_path = current_path .. os_sep
      end
    else
      pwd = nil
      filename = vim.fn.fnamemodify(current_path, ':t')
      current_path = vim.fn.fnamemodify(current_path, ':~:.:h') .. os_sep
    end

    self.pwd = pwd
    self.current_path = current_path
    self.filename = filename
  end,
  {
    ModeArea,
    GitArea,

    PathArea,

    LSPArea,
    FileInfoArea,
    NavigationArea,
  },
  static = {
    mode_colors = {
      n = 'purple',
      i = 'green',
      v = 'yellow',
      V = 'yellow',
      ['\22'] = 'yellow',
      c = 'purple',
      s = 'cyan',
      S = 'cyan',
      ['\19'] = 'cyan',
      R = 'orange',
      r = 'orange',
      ['!'] = 'green',
      t = 'red',
    },
  },
  hl = function(self)
    local mode = self.mode:sub(1, 1)
    return { bg = 'black', fg = self.mode_colors[mode] }
  end,
}

-- Configuration
heirline.setup({
  statusline = StatusLine,
})
