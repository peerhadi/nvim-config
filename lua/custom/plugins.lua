local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "typescript-language-server",
        "csharp-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls-custom"
      end,
      ft = { "javascript", "typescript", "typescript.tsx", "js", "jsx", "cs" },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig-custom"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools-config"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins/configs.cmp"
      table.insert(M.sources, { name = "crates" })
      return M
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "iamcco/markdown-preview.nvim",
  },
  {
    "lazyvim.plugins.extras.lang.terraform",
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
}

return plugins
