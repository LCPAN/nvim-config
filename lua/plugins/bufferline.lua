local M = {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    {"<Leader>bn","<Cmd>bnext<CR>", mode = "n", { silent = true }},
    {"<Leader>bp","<Cmd>bprevious<CR>", mode = "n", { silent = true }},
    {"<Leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", mode = "n", { noremap = true, silent = true }},
    {"<Leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", mode = "n", { noremap = true, silent = true }},
    {"<Leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", mode = "n", { noremap = true, silent = true }},
    {"<Leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", mode = "n", { noremap = true, silent = true }},
    {"<Leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", mode = "n", { noremap = true, silent = true }},
    {"<Leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", mode = "n", { noremap = true, silent = true }},
    {"<Leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", mode = "n", { noremap = true, silent = true }},
    {"<Leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", mode = "n", { noremap = true, silent = true }},
    {"<Leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", mode = "n", { noremap = true, silent = true }},
    {"<Leader>$", "<Cmd>BufferLineGoToBuffer -1<CR>", mode = "n", { noremap = true, silent = true }},
  },
  opts = {
    options = {
      -- mode = 'tabs',
      -- show_buffer_icons = true,
      -- show_buffer_close_icons = true,
      -- separator_style = "thin",
      -- right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
      left_trunc_marker = '',
      right_trunc_marker = '',
      -- 使用 nvim 内置lsp
      diagnostics = "nvim_lsp",
      -- 左侧让出 nvim-tree 的位置
      offsets = { {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left"
      } },
      -- name_formatter = function(buf)
      -- end,
      numbers = function(opts)
        return string.format('%s', opts.ordinal)
      end,
      hover = {
        enabled = true,
        delay = 200,
        reveal = { 'close' }
      },
    },
  },
}

return M
