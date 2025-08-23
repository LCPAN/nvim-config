local builtin = require('telescope.builtin')

local M = {
  'nvim-telescope/telescope.nvim',
  --branch = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'debugloop/telescope-undo.nvim',
  },
  keys = {
    -- 进入telescope页面会是插入模式，回到正常模式就可以用j和k来移动了
    {"<F5>", "<Cmd>Telescope undo<CR>", mode = "n", { noremap = true, silent = true }},
    {'<Leader>ff', builtin.find_files, mode = "n", { noremap = true, silent = true }},
    {'<Leader>fg', builtin.live_grep, mode = "n", { noremap = true, silent = true }}, -- 环境里要安装ripgrep
    {'<Leader>fb', builtin.buffers, mode = "n", { noremap = true, silent = true }},
    {'<Leader>fh', builtin.help_tags, mode = "n", { noremap = true, silent = true }},
    {'<Leader>fw', builtin.grep_string, mode = "n", { noremap = true, silent = true }},
    {'<Leader>fo', builtin.oldfiles, mode = "n", { noremap = true, silent = true, desc = '[?] Find recently opened files' }},
  },
 opts = {
    extensions = {
      undo = {
        -- use_delta = true,
        -- side_by_side = false,
        -- layout_strategy = "vertical",
        -- diff_context_lines = vim.o.scrolloff,
        -- layout_config = {
        --   preview_height = 0.8,
        -- },
      },
      aerial = {
        -- Display symbols as <root>.<parent>.<symbol>
        show_nesting = {
          ["_"] = false, -- This key will be the default
          json = true, -- You can set the option for specific filetypes
          yaml = true,
        },
      },
    },
  }
}

return M
