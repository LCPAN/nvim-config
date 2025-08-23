local M = {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    opts = {
      -- 确保安装，根据需要填写
      ensure_installed = {
        "lua_ls",
        "clangd",
        "gopls",
        "rust_analyzer",
      },
    },
  }

return M
