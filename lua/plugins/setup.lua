local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

---vim.cmd([[
---  augroup packer_user_config
---    autocmd!
---    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
---  augroup end
---  ]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional
      },
    },
    {
      'nvim-lualine/lualine.nvim',
      requires = {
        'nvim-tree/nvim-web-devicons', opt = true
      }
    },
    {
      'mg979/vim-visual-multi',
      branch = 'master' -- 多光标
    },
    -- 'christoomey/vim-tmux-navigator'
    {
      'fatih/vim-go',
      run = ':GoUpdateBinaries'
    },
    'tpope/vim-fugitive', -- git
    'tpope/vim-repeat',
    'jiangmiao/auto-pairs',
    'tpope/vim-surround',
    'liuchengxu/vista.vim',    -- Viewer & Finder for LSP symbols and tags
    'preservim/nerdcommenter', -- Comment functions
    'Chiel92/vim-autoformat',
    -- 'voldikss/vim-floaterm',
    {"akinsho/toggleterm.nvim", tag = '*'},
    {
      'kenn7/vim-arsync', -- async local files to the remote server
      commit = "c953680"
    },

    'skywind3000/asyncrun.vim',
    'vimwiki/vimwiki',
    --'puremourning/vimspector',
    'chrisbra/csv.vim',
    {
      'nvim-treesitter/nvim-treesitter', -- 语法高亮
    },
    'p00f/nvim-ts-rainbow',              -- 配合treesitter，不同括号颜色区分
    'projekt0n/github-nvim-theme',
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim", -- 这个相当于mason.nvim和lspconfig的桥梁
    {
      "neovim/nvim-lspconfig",
      -- event = {"BufReadPost", "BufNewFile"},
    },
    {
      "ufo5260987423/scheme-langserver",
    },
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    {
      "L3MON4D3/LuaSnip", -- snippets引擎，不装这个自动补全会出问题
      tag = "v2.*",       -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      run = "make install_jsregexp",
    },
    { "saadparwaiz1/cmp_luasnip" },
    { "rafamadriz/friendly-snippets" },
    { "hrsh7th/cmp-path" },                       -- 补全文件路径
    { "akinsho/bufferline.nvim",     tag = "*" }, -- buffer分割线
    {
      "mfussenegger/nvim-dap",
      requires = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim",
        "leoluz/nvim-dap-go",
      },
    },
    {
      "folke/tokyonight.nvim",
      opts = {},
    },
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.2',
      requires = {
        {
          'nvim-lua/plenary.nvim',
        },
        {
          'debugloop/telescope-undo.nvim',
        },
      }
    },

    'folke/flash.nvim',
    'ethanholz/nvim-lastplace',
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
