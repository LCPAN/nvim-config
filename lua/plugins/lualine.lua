require('lualine').setup({
  options = {
    -- theme = 'papercolor_dark'
    -- theme = 'papercolor_light'
    -- theme = 'powerline'
    -- theme = 'solarized_light'
    -- theme = 'gruvbox_dark'
    -- theme = 'gruvbox_light'
    -- theme = 'horizon'
    --theme = 'nord'
    theme = 'tokyonight',

  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { {
      'filename',
      path = 1,
    } },
    lualine_x = { 'encoding', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location', 'searchcount', 'selectioncount' }
  },
})
