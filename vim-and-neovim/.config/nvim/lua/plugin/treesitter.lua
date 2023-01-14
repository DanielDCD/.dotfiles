require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    use_languagetree = true
  },
  auto_install = true,
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "gni",
      scope_incremental = "gns",
      node_decremental = "gnd",
    },
  },
}
