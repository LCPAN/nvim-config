local M = {}

-- 内存状态
local saved_insert_ime = nil
local saved_before_cmdline = nil

-- Insert 模式输入法状态
function M.save_insert_ime(ime)
  saved_insert_ime = ime
end

function M.get_saved_ime()
  return saved_insert_ime
end

-- 命令行模式输入法状态
function M.save_before_cmdline(ime)
  saved_before_cmdline = ime
end

function M.get_before_cmdline()
  return saved_before_cmdline
end

return M