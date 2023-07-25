local keymap = vim.keymap
--
--keymap.set("t", "<Leader>tc", "<C-\\><C-n>:FloatermNew<CR>", { noremap = true, silent = true })
--keymap.set("t", "<Leader>tp", "<C-\\><C-n>:FloatermPrev<CR>", { noremap = true, silent = true })
--keymap.set("t", "<Leader>tn", "<C-\\><C-n>:FloatermNext<CR>", { noremap = true, silent = true })

keymap.set("t", "<F4>", "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true, silent = true })
keymap.set("n", "<F4>", ":ToggleTerm direction=float<CR>", { noremap = true, silent = true })

require("toggleterm").setup {
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
    width = 90,
    height = 20,
  },
}
