local M = {

  'nvim-lualine/lualine.nvim',

  dependencies = {

    {

      'nvim-tree/nvim-web-devicons',

      lazy = true,

    },

  },

  config = function()

    -- Add lualine progress component with safe remote-upload integration

    local function upload_status()

      local success, status_mod = pcall(require, "remote-upload.lualine")

      if success and status_mod and status_mod.status then

        return status_mod.status()

      end

      return ""

    end



    require('lualine').setup({

      options = {

        theme = 'tokyonight',

      },

      sections = {

        lualine_a = { 'mode' },

        lualine_b = { 'branch', 'diff', 'diagnostics' },

        lualine_c = { {

          'filename',

          path = 1,

        } },

        lualine_x = { upload_status, 'encoding', 'filetype' },

        lualine_y = { 'progress' },

        lualine_z = { 'location', 'searchcount', 'selectioncount' }

      },

    })

  end,

}



return M

