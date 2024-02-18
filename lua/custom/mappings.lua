local M = {}

M.dap = {
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle breakpoint"
    },
    ["<leader>dus"] = {
      function()
        local widgets = require("dap.ui.widgets");
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.compiler = {
  n = {
    ["<leader>co"] = {
      "<cmd>CompilerOpen<cr>",
      opts = {
        silent = true,
        noremap = true,
      }
    },
    ["<leader>cq"] = {
      function()
        vim.lsp.buf.code_action({
          filter = function(a) return a.isPreferred end,
          apply = true
        })
      end,
      "Rust quickfix",
      {
        noremap = true,
        silent = true,
      }
    }
  },
}

return M
