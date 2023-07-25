local builtin = require('telescope.builtin')

local keymap = vim.keymap

-- 进入telescope页面会是插入模式，回到正常模式就可以用j和k来移动了
keymap.set('n', '<Leader>ff', builtin.find_files, {})
keymap.set('n', '<Leader>fg', builtin.live_grep, {}) -- 环境里要安装ripgrep
keymap.set('n', '<Leader>fb', builtin.buffers, {})
keymap.set('n', '<Leader>fh', builtin.help_tags, {})
keymap.set('n', '<Leader>fw', builtin.grep_string, {})
keymap.set('n', '<Leader>fo', builtin.oldfiles, { desc = '[?] Find recently opened files' })
keymap.set("n", "<F5>", "<cmd>Telescope undo<CR>", { noremap = true, silent = true })

require("telescope").setup({
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
  },
})

require("telescope").load_extension("undo")
