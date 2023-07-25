local opt = vim.opt

vim.g.python3_host_prog = '/usr/bin/python3'

-- 行号
-- "开启行号显示
opt.number = true
-- "使用相对行号
opt.relativenumber = true

-- 缩进
-- "设置（软）制表符宽度为4
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.smartindent = true  -- 开启新行时使用智能自动缩进
opt.expandtab = true
opt.autoindent = true

-- "设置使用 C/C++ 语言的自动缩进方式
opt.cindent = true

-- opt.t_Co = 256
opt.compatible = false

-- "光标离窗口上下边界5行时窗口自动滚动
opt.scrolloff = 5

-- 防止包裹
-- opt.wrap = false

-- 光标行
opt.cursorline = true

-- 启用鼠标
-- opt.mouse:append("a")
opt.mouse = ""

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认窗口右和下
-- opt.splitright = true
-- opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"

-- 基于缩进或语法进行代码折叠
opt.foldmethod = "indent"
opt.foldmethod = "syntax"
-- 启动 vim 时关闭折叠代码
opt.foldenable = false

-- opt.autoread = true

-- opt.undofile = true
-- opt.undodir = vim.fn.expand('$HOME/.local/share/nvim/undo')

vim.cmd[[colorscheme tokyonight-moon]]
