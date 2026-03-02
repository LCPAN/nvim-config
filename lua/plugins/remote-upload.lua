local M = {
  dir = vim.fn.stdpath("data") .. "/plugins/remote-upload.nvim",
  name = "remote-upload",
  event = 'VeryLazy',
  config = function()
    require("remote-upload").setup()
  end,
  keys = {
    { '<leader>up', '<Cmd>RemoteUpload<CR>', mode = 'n', desc = 'Upload files' },
    { '<leader>ua', '<Cmd>RemoteUploadAll<CR>', mode = 'n', desc = 'Upload all files' },
    { '<leader>Up', '<Cmd>RemoteUploadCurrent<CR>', mode = 'n', desc = 'Upload current file' },
  },
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
}

return M
