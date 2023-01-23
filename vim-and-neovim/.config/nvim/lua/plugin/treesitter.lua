local treesitter_configs_ok, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if not treesitter_configs_ok then
  return
end

local options = {
  highlight = {
    enable = true,
    use_languagetree = true,
    disable = { 'latex' },
  },
  auto_install = true,
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'gni',
      scope_incremental = 'gns',
      node_decremental = 'gnd',
    },
  },
}

treesitter_configs.setup(options)
