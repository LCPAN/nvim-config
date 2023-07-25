vim.opt.termguicolors = true

local keymap = vim.keymap

keymap.set("n", "<Leader>bn", ":bnext<CR>", { silent = true })
keymap.set("n", "<Leader>bp", ":bprevious<CR>", { silent = true })

keymap.set("n", "<Leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
keymap.set("n", "<Leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
keymap.set("n", "<Leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
keymap.set("n", "<Leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
keymap.set("n", "<Leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
keymap.set("n", "<Leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true })
keymap.set("n", "<Leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true })
keymap.set("n", "<Leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true })
keymap.set("n", "<Leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true })
keymap.set("n", "<Leader>$", "<Cmd>BufferLineGoToBuffer -1<CR>", { noremap = true, silent = true })

require("bufferline").setup {
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
}
