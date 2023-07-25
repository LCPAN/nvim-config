--local go_on_attach = function(client, bufnr)
--  vim.bo['omnifunc'].omnifunc = 'v:lua.vim.lsp.omnifunc'
--  local opts = {}
--
--  -- Buffer local mappings.
--  -- See `:help vim.lsp.*` for documentation on any of the below functions
--  vim.keymap.set('n', 'gi', vim.lsp.buf.definition, opts)
--  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--  -- 查看所有引用当前对象的地方
--  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
--  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
--  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
--end

vim.cmd [[ au BufRead,BufNewFile *.sld set filetype=scheme ]]
vim.cmd [[ au BufRead,BufNewFile *.sls set filetype=scheme ]]

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
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
}

require("lspconfig").gopls.setup {
  -- on_attach = go_on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

require("lspconfig").rust_analyzer.setup {
  capabilities = capabilities,
}

require("lspconfig").clangd.setup {
  capabilities = capabilities,
}

require("lspconfig").scheme_langserver.setup {
  --capabilities = capabilities,
}
