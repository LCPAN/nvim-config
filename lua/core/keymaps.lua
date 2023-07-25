vim.g.mapleader = ";"

local keymap = vim.keymap

-- nvim-tree
keymap.set("n", "<F3>", ":NvimTreeToggle<CR>")

-- 定义快捷键保存当前窗口内容
keymap.set("n", "<Leader>wt", ":w<CR>")
keymap.set("n", "<Leader>qt", ":q<CR>")
keymap.set("n", "<Leader>wq", ":wq<CR>")
-- 定义快捷键在结对符之间跳转，助记pair
keymap.set("n", "<Leader>pa", "%")

keymap.set("n", "<Leader>ba", "<C-O>")
keymap.set("n", "<Leader>fr", "<C-I>")

-- 跳转至右方的窗口
keymap.set("n", "<Leader>lw", "<C-W>l", {noremap = true, silent = true})
-- 跳转至方的窗口
keymap.set("n", "<Leader>hw", "<C-W>h", {noremap = true, silent = true})
-- 跳转至上方的子窗口
keymap.set("n", "<Leader>kw", "<C-W>k", {noremap = true, silent = true})
-- 跳转至下方的子窗口
keymap.set("n", "k", "(v:count == 0 ? 'gk':'k')", {noremap = true, silent = true, expr = true})
keymap.set("n", "<Leader>jw", "<C-W>j", {noremap = true, silent = true})

keymap.set("n", "j", "(v:count == 0 ? 'gj':'j')", {noremap = true, silent = true, expr = true})
keymap.set("n", "<F12>", ":so ~/.config/nvim/init.lua<CR>", {noremap = true})

keymap.set('v', "J", ":m '>+1<CR>gv=gv'")
keymap.set('v', "K", ":m '<-2<CR>gv=gv'")

keymap.set('v', "<Leader>sy", "\"+y")
keymap.set('n', "<Leader>sp", "\"+p")
