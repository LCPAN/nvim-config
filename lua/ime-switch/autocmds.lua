-- Auto commands for IME switching
local M = {}

local state = require("ime-switch.state")
local platform = require("ime-switch.platform")

function M.setup()
  local group = vim.api.nvim_create_augroup("ImeSwitch", { clear = true })
  
  -- 进入 Normal 模式: 保存当前输入法，切换到英文
  vim.api.nvim_create_autocmd("ModeChanged", {
    group = group,
    pattern = "*:n",  -- 从任意模式到 Normal
    callback = function()
      local current = platform.get()
      if current then
        state.save_insert_ime(current)
      end
      platform.set_to_english()
    end,
  })
  
  -- 进入 Insert 模式: 恢复上次保存的输入法
  vim.api.nvim_create_autocmd("ModeChanged", {
    group = group,
    pattern = "*:i",  -- 从任意模式到 Insert
    callback = function()
      local saved = state.get_saved_ime()
      if saved then
        platform.set(saved)
      end
    end,
  })
  
  -- 进入命令行: 切换到英文
  vim.api.nvim_create_autocmd("CmdlineEnter", {
    group = group,
    callback = function()
      local current = platform.get()
      if current then
        state.save_before_cmdline(current)
      end
      platform.set_to_english()
    end,
  })
  
  -- 退出命令行: 恢复
  vim.api.nvim_create_autocmd("CmdlineLeave", {
    group = group,
    callback = function()
      local saved = state.get_before_cmdline()
      if saved then
        platform.set(saved)
      end
    end,
  })
end

return M