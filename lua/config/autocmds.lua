-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- scheme
vim.cmd [[ au BufRead,BufNewFile *.sld set filetype=scheme ]]
vim.cmd [[ au BufRead,BufNewFile *.sls set filetype=scheme ]]

-- 增强文件自动重载（macOS 文件系统事件不可靠）
-- 1. 窗口获得焦点时检查文件变化
vim.api.nvim_create_autocmd("FocusGained", {
  callback = function() vim.cmd("checktime") end,
})

-- 2. 后台每秒轮询当前文件（checktime 只检查当前 buffer，开销可忽略）
vim.fn.timer_start(1000, function(_)
  vim.cmd("checktime")
end, { ["repeat"] = -1 })
