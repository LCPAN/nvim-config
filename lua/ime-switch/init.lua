local M = {}

function M.setup(opts)
  opts = opts or {}
  -- 初始化逻辑，后续由其他模块补充
  
  -- 尝试加载 autocmds 模块（如果存在）
  local ok, autocmds = pcall(require, "ime-switch.autocmds")
  if ok and autocmds and autocmds.setup then
    autocmds.setup()
  end
end

return M