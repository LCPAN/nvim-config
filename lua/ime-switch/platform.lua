local M = {}
local backend = nil

-- 检测操作系统
M.os_name = vim.loop.os_uname().sysname

-- 加载 backend
local function load_backend()
  if M.os_name == "Darwin" then
    backend = require("ime-switch.backends.macos")
  elseif M.os_name == "Linux" then
    backend = require("ime-switch.backends.linux")
  elseif M.os_name:find("Windows") then
    backend = require("ime-switch.backends.windows")
  else
    vim.notify("[ime-switch] Unsupported platform: " .. M.os_name, vim.log.levels.WARN)
  end
end

function M.get()
  return backend and backend.get()
end

function M.set(ime)
  return backend and backend.set(ime)
end

function M.set_to_english()
  return backend and backend.set_to_english()
end

-- 模块加载时初始化
load_backend()

return M