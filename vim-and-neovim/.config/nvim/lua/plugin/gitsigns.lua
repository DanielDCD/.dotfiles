local gitsigns_ok, gitsigns = pcall(require, 'gitsigns')
if not gitsigns_ok then
  return
end

local options = {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        return ']c'
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return '<Ignore>'
    end, { expr = true })

    map('n', '[c', function()
      if vim.wo.diff then
        return '[c'
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return '<Ignore>'
    end, { expr = true })

    -- Actions
    map({ 'n', 'v' }, '<leader>ghs', ':Gitsigns stage_hunk<CR>')
    map({ 'n', 'v' }, '<leader>ghr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>gsb', gs.stage_buffer)
    map('n', '<leader>ghu', gs.undo_stage_hunk)
    map('n', '<leader>grb', gs.reset_buffer)
    map('n', '<leader>ghp', gs.preview_hunk)
    map('n', '<leader>gbl', function()
      gs.blame_line({ full = true })
    end)
    map('n', '<leader>gtb', gs.toggle_current_line_blame)
    map('n', '<leader>gdt', gs.diffthis)
    map('n', '<leader>gDt', function()
      gs.diffthis('~')
    end)
    map('n', '<leader>gtd', gs.toggle_deleted)

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end,
}

gitsigns.setup(options)

-- This is necessary to make LSP diagnostics not overlap with gitsigns.
vim.cmd('set signcolumn=auto:2')
