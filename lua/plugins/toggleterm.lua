local M = {
  "akinsho/toggleterm.nvim",
  version = '*',
  keys = {
    --
    --keymap.set("t", "<Leader>tc", "<C-\\><C-n>:FloatermNew<CR>", { noremap = true, silent = true })
    --keymap.set("t", "<Leader>tp", "<C-\\><C-n>:FloatermPrev<CR>", { noremap = true, silent = true })
    --keymap.set("t", "<Leader>tn", "<C-\\><C-n>:FloatermNext<CR>", { noremap = true, silent = true })

    {'<F4>', "<C-\\><C-n>:ToggleTerm<CR>", mode = "t", { noremap = true, silent = true }},
    {'<F4>', ":ToggleTerm direction=float<CR>", mode = "n", { noremap = true, silent = true }},
  },
  opts = {
    -- size can be a number or function which is passed the current terminal
    size = function(term)
      if term.direction == "horizontal" then
        return vim.o.lines * 0.3
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,

      float_opts = {
      border = 'single',
      -- width = 90,
      -- height = 20,
      width = function (term)
        return math.floor(vim.o.columns * 0.6)
      end,
      height = function (term)
        return math.floor(vim.o.lines * 0.6)
      end,
    },
  },
}

return M
