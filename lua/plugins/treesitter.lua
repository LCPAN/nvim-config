require 'nvim-treesitter.configs'.setup {
  -- 添加不同语言
  ensure_installed = { "vim", "bash", "c", "cpp", "json", "lua", "python", "rust", "markdown", "markdown_inline", "go" }, -- one of "all" or a list of languages

  highlight = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    -- 禁用 vim 基于正则达式的语法高亮，太慢
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },


  -- 不同括号颜色区分
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
