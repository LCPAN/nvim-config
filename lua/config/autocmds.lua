-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- scheme
vim.cmd [[ au BufRead,BufNewFile *.sld set filetype=scheme ]]
vim.cmd [[ au BufRead,BufNewFile *.sls set filetype=scheme ]]
