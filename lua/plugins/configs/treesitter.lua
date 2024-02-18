local options = {
  ensure_installed = { "lua", "rust", "typescript", "javascript" },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>ss", -- set to `false` to disable one of the mappings
      node_incremental = "<leader>si",
      scope_incremental = "<leader>sc",
      node_decremental = "<leader>sd",
    },
  },
}

return options
