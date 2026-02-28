-- macOS IME backend using defaults and keyboard shortcuts
local M = {}

-- 获取当前输入法名称
-- 使用 defaults read 从 plist 获取当前输入法
function M.get()
  local cmd = [[defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID 2>/dev/null]]
  local result = vim.fn.system(cmd)
  if vim.v.shell_error == 0 then
    -- 输出格式: com.apple.keylayout.ABC 或 com.apple.inputmethod.SCIM.ITABC
    return vim.trim(result)
  end
  -- 备用方案: 尝试获取 KeyboardLayout Name
  cmd = [[defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources 2>/dev/null | grep "KeyboardLayout Name" | head -1 | cut -d'"' -f2]]
  result = vim.fn.system(cmd)
  if vim.v.shell_error == 0 and result ~= "" then
    return vim.trim(result)
  end
  return nil
end

-- 切换输入法 (通过模拟 Ctrl+Space 快捷键)
-- 注意: 需要给终端/iTerm2 或 Neovim 所在应用授予辅助功能权限
function M.set(ime)
  -- macOS 上直接设置输入法比较困难，使用快捷键切换
  -- 这里假设用户使用 Ctrl+Space 切换输入法
  -- 实际切换取决于用户的系统设置

  -- 如果目标输入法已经是当前输入法，不需要切换
  local current = M.get()
  if current and current:find(ime, 1, true) then
    return true
  end

  -- 模拟 Ctrl+Space 切换输入法
  -- 注意: 这需要辅助功能权限
  local cmd = [[osascript -e 'tell application "System Events" to key code 49 using control down' 2>/dev/null]]
  vim.fn.system(cmd)
  return vim.v.shell_error == 0
end

-- 切换到英文输入法
function M.set_to_english()
  -- 检查当前是否已经是英文输入法
  local current = M.get()
  if current then
    if current:find("ABC", 1, true) or
       current:find("U%.S%.", 1, true) or
       current:find("American", 1, true) or
       current:find("keylayout%.ABC", 1, true) then
      return true
    end
  end

  -- 使用快捷键切换到英文输入法
  -- 常见方案: Ctrl+Space 切换，假设切换后会到英文
  local cmd = [[osascript -e 'tell application "System Events" to key code 49 using control down' 2>/dev/null]]
  vim.fn.system(cmd)

  if vim.v.shell_error == 0 then
    -- 验证是否切换成功
    vim.wait(100) -- 等待系统响应
    current = M.get()
    if current and (current:find("ABC", 1, true) or current:find("keylayout", 1, true)) then
      return true
    end
  end

  -- 备用方案: 尝试直接设置
  local english_sources = { "ABC", "U.S.", "American", "US" }
  for _, name in ipairs(english_sources) do
    if M.set(name) then
      return true
    end
  end

  return false
end

return M