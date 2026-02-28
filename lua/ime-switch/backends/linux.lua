-- Linux IME backend with auto-detection
local M = {}

local framework = nil
local detected = false

-- 检测可用的输入法框架
local function detect_framework()
  if detected then return framework end
  detected = true

  -- 检测 fcitx5
  if vim.fn.executable("fcitx5-remote") == 1 then
    framework = "fcitx5"
    return framework
  end

  -- 检测 fcitx
  if vim.fn.executable("fcitx-remote") == 1 then
    framework = "fcitx"
    return framework
  end

  -- 检测 ibus
  if vim.fn.executable("ibus") == 1 then
    framework = "ibus"
    return framework
  end

  vim.notify("[ime-switch] No supported IME framework found (fcitx5/fcitx/ibus)", vim.log.levels.WARN)
  return nil
end

-- 获取当前输入法状态
function M.get()
  local fw = detect_framework()
  if not fw then return nil end

  if fw == "fcitx5" or fw == "fcitx" then
    -- 返回 "1" 表示激活, "2" 表示非激活
    local remote = fw .. "-remote"
    local result = vim.fn.system(remote)
    if vim.v.shell_error == 0 then
      return vim.trim(result)
    end
  elseif fw == "ibus" then
    -- ibus 需要获取当前 engine
    local result = vim.fn.system("ibus read")
    if vim.v.shell_error == 0 then
      return vim.trim(result)
    end
  end
  return nil
end

-- 设置输入法状态
function M.set(state)
  local fw = detect_framework()
  if not fw then return false end

  if fw == "fcitx5" or fw == "fcitx" then
    local remote = fw .. "-remote"
    -- state: "1" 或 true = 激活中文, "0" 或 false = 关闭
    if state == "1" or state == true then
      vim.fn.system(remote .. " -o")
    else
      vim.fn.system(remote .. " -c")
    end
    return vim.v.shell_error == 0
  elseif fw == "ibus" then
    -- ibus 设置 engine
    if state then
      vim.fn.system("ibus engine " .. state)
      return vim.v.shell_error == 0
    end
  end
  return false
end

-- 切换到英文输入法
function M.set_to_english()
  local fw = detect_framework()
  if not fw then return false end

  if fw == "fcitx5" or fw == "fcitx" then
    -- fcitx: -c 关闭输入法（回到英文模式）
    local remote = fw .. "-remote"
    vim.fn.system(remote .. " -c")
    return vim.v.shell_error == 0
  elseif fw == "ibus" then
    -- ibus: 切换到 xkb:us:eng 引擎
    vim.fn.system("ibus engine xkb:us::eng")
    return vim.v.shell_error == 0
  end
  return false
end

return M