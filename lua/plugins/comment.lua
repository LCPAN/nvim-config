
local M = {
    'numToStr/Comment.nvim',
    lazy = false,
    opts = {
      toggler = {},
      opleader = {},
      extra = {},

      mapping = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = false,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = false,
      }
    },
  }

return M
