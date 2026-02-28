-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gK', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    --vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    --vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    --vim.keymap.set('n', '<space>wl', function()
    --  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    --end, opts)
    vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, 'gc', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gf', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

vim.lsp.set_log_level("warn")

local M = {
  {
    "neovim/nvim-lspconfig",
    event = {"BufReadPost", "BufNewFile"},
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
            },
          },
        },
      },
      {
        "williamboman/mason-lspconfig.nvim", -- 这个相当于mason.nvim和lspconfig的桥梁
        opts = {
          -- 确保安装，根据需要填写
          ensure_installed = {
            "lua_ls",
            "clangd",
            "gopls",
            "rust_analyzer",
          },
        },
      },
    },

    keys = function(_, opts)
    end,

    config = function(_, opts)
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("gopls", {
        capabilities = capabilities,
        settings = {
          gopls = {
            -- more settings: https://github.com/golang/tools/blob/master/gopls/doc/settings.md
            -- not supported
            analyses = {
              unreachable = true,
              nilness = true,
              unusedparams = true,
              useany = true,
              unusedwrite = true,
              ST1003 = true,
              undeclaredname = true,
              fillreturns = true,
              nonewvars = true,
              fieldalignment = false,
              shadow = true,
            },
            codelenses = {
              generate = true, -- show the `go generate` lens.
              gc_details = true, -- Show a code lens toggling the display of gc's choices.
              test = true,
              tidy = true,
              vendor = true,
              regenerate_cgo = true,
              upgrade_dependency = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            matcher = 'Fuzzy',
            diagnosticsDelay = '500ms',
            symbolMatcher = 'fuzzy',
            --['local'] = get_current_gomod(),
            --gofumpt = _GO_NVIM_CFG.lsp_gofumpt or false, -- true|false, -- turn on for new repos, gofmpt is good but also create code turmoils
            buildFlags = { '-tags', 'integration' },
          },
        },
        flags = {
          allow_incremental_sync = true,
          debounce_text_changes = 500
        },
        -- NOTE: it is important to add handler to formatting handlers
        -- the async formatter will call these handlers when gopls responed
        -- without these handlers, the file will not be saved
        --handlers = {
        --  ['range_format'] = function(...)
        --    vim.lsp.handlers['range_format'](...)
        --    if vfn.getbufinfo('%')[1].changed == 1 then
        --      vim.cmd('noautocmd write')
        --    end
        --  end,
        --  ['formatting'] = function(...)
        --    vim.lsp.handlers['formatting'](...)
        --    if vfn.getbufinfo('%')[1].changed == 1 then
        --      vim.cmd('noautocmd write')
        --    end
        --  end,
        --},
        init_options = {
          usePlaceholders = true,
        },
      })
      
      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
        settings = {
          ['rust-analyzer'] = {
            diagnostics = {
              enable = true,
            },
            checkOnSave = {
              command = "clippy",
            },
            completion = {
              autoimport = {
                enable = true,
              },
              autoself = {
                enable = true,
              },
              fullFunctionSignatures = {
                enable = true,
              }
            },
          },
        },
      })

      vim.lsp.config("clangd", {
        capabilities = capabilities,
      })

      vim.lsp.config("scheme_langserver", {
        capabilities = capabilities,
      })

      vim.lsp.enable("lua_ls", "gopls", "rust_analyzer", "clangd", "scheme_langserver")
    end
  },

  {
    "ufo5260987423/scheme-langserver",
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
      "leoluz/nvim-dap-go",
    },
  },

  --{ 'h-hg/fcitx.nvim' },
}

return M
