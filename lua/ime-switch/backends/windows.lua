-- Windows IME backend using PowerShell
local M = {}

-- 获取当前输入法
function M.get()
  -- 使用 PowerShell 获取当前输入法
  local ps = [[powershell -NoProfile -Command "Get-WinUserLanguageList | Select-Object -ExpandProperty InputMethodTip"]]
  local result = vim.fn.system(ps)
  if vim.v.shell_error == 0 then
    return vim.trim(result)
  end
  return nil
end

-- 设置输入法
function M.set(ime_code)
  if not ime_code then return false end
  -- 使用 PowerShell 设置输入法
  local ps = string.format(
    [[powershell -NoProfile -Command "$list = Get-WinUserLanguageList; $list[0].InputMethodTip = '%s'; Set-WinUserLanguageList $list -Force"]],
    ime_code
  )
  vim.fn.system(ps)
  return vim.v.shell_error == 0
end

-- 切换到英文输入法
function M.set_to_english()
  -- 常见英文输入法代码
  -- 00000409: US English
  -- 00000809: UK English
  local english_codes = {"00000409", "00000809"}

  for _, code in ipairs(english_codes) do
    if M.set(code) then
      return true
    end
  end

  -- 尝试直接设置为英文键盘
  local ps = [[powershell -NoProfile -Command "$list = Get-WinUserLanguageList; $list[0].InputMethodTip = '00000409'; Set-WinUserLanguageList $list -Force"]]
  vim.fn.system(ps)
  return vim.v.shell_error == 0
end

return M