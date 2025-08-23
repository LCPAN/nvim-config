local M = {
  {
    'projekt0n/github-nvim-theme',
    lazy = false,
  },
  {
    "folke/tokyonight.nvim",
    --lazy = true,
    --opts = {
    --  theme = 'tokyonight',
    --  style = "moon",
    --},
    config = function()
      -- load the colorscheme here
      vim.cmd[[colorscheme tokyonight-moon]]
    end,
  },
}

return M
