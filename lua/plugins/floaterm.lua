vim.g.floaterm_keymap_toggle = '<F4>'

local keymap = vim.keymap

keymap.set("t", "<Leader>tc", "<C-\\><C-n>:FloatermNew<CR>", { noremap = true, silent = true })
keymap.set("t", "<Leader>tp", "<C-\\><C-n>:FloatermPrev<CR>", { noremap = true, silent = true })
keymap.set("t", "<Leader>tn", "<C-\\><C-n>:FloatermNext<CR>", { noremap = true, silent = true })
keymap.set("t", "<Leader>tt", "<C-\\><C-n>:FloatermToggle<CR>", { noremap = true, silent = true })
