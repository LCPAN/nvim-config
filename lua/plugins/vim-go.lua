local M = {
  "ray-x/go.nvim",
  dependencies = {  -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  event = {"CmdlineEnter"},
  init = function ()
    vim.g.go_def_mode = 'gopls'
    vim.g.go_info_mode = 'gopls'

    vim.g.go_highlight_fields = 1
    vim.g.go_highlight_functions = 1
    vim.g.go_highlight_function_calls = 1
    vim.g.go_highlight_extra_types = 1
    vim.g.go_highlight_operators = 1
    -- Auto formatting and importing
    vim.g.go_fmt_autosave = 1
    vim.g.go_fmt_command = "goimports"
    vim.g.go_auto_type_info = 1
  end,
  ft = {"go", 'gomod', "gowork", "gotmpl"},
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  opts = {},
  config = function(lp, opts)
    require("go").setup(opts)
    local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
      require('go.format').goimports()
      end,
      group = format_sync_grp,
    })
  end,
}

return M
