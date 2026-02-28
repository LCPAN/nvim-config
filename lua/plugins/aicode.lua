local M = {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },
  --{
  --  "greggh/claude-code.nvim",
  --  dependencies = {
  --    "nvim-lua/plenary.nvim", -- Required for git operations
  --  },
  --  config = function()
  --    require("claude-code").setup()
  --  end,
  --  keys = {
  --    { "<leader>a", nil, desc = "AI/Claude Code" },
  --    { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
  --    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
  --    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
  --    { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
  --    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
  --    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
  --    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
  --    {
  --      "<leader>as",
  --      "<cmd>ClaudeCodeTreeAdd<cr>",
  --      desc = "Add file",
  --      ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
  --    },
  --    -- Diff management
  --    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
  --    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
  --  },
  --},
  --{
  --  "sudo-tee/opencode.nvim",
  --  config = function()
  --    require("opencode").setup({ })
  --  end,
  --  dependencies = {
  --    "nvim-lua/plenary.nvim",
  --    {
  --      "MeanderingProgrammer/render-markdown.nvim",
  --      opts = {
  --        anti_conceal = { enabled = false },
  --        file_types = { 'markdown', 'opencode_output' },
  --      },
  --      ft = { 'markdown', 'Avante', 'copilot-chat', 'opencode_output' },
  --    },
  --    -- Optional, for file mentions and commands completion, pick only one
  --    --'saghen/blink.cmp',
  --    'hrsh7th/nvim-cmp',

  --    -- Optional, for file mentions picker, pick only one
  --    'folke/snacks.nvim',
  --    --'nvim-telescope/telescope.nvim',
  --    --'ibhagwan/fzf-lua',
  --    --'nvim-mini/mini.nvim',
  --  },
  --}
  {
    "nickjvandyke/opencode.nvim",
    version = "*", -- Latest stable release
    dependencies = {
      {
        -- `snacks.nvim` integration is recommended, but optional
        ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
        "folke/snacks.nvim",
        optional = true,
        opts = {
          input = {}, -- Enhances `ask()`
          picker = { -- Enhances `select()`
            actions = {
              opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
            },
            win = {
              input = {
                keys = {
                  ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
                },
              },
            },
          },
        },
      },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any; goto definition on the type or field for details
        lsp = { enabled = true }
      }
  
      vim.o.autoread = true -- Required for `opts.events.reload`
  
      -- Recommended/example keymaps
      vim.keymap.set({ "n", "x" }, "<Leader>oa", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode…" })
      vim.keymap.set({ "n", "x" }, "<Leader>oe", function() require("opencode").select() end,                          { desc = "Execute opencode action…" })
      vim.keymap.set({ "n", "t" }, "<Leader>ot", function() require("opencode").toggle() end,                          { desc = "Toggle opencode" })
  
      vim.keymap.set({ "n", "x" }, "<Leader>or",  function() return require("opencode").operator("@this ") end,        { desc = "Add range to opencode", expr = true })
      vim.keymap.set("n",          "<Leader>ol", function() return require("opencode").operator("@this ") .. "_" end, { desc = "Add line to opencode", expr = true })
  
      vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,   { desc = "Scroll opencode up" })
      vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "Scroll opencode down" })
  
      -- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above — otherwise consider `<leader>o…` (and remove terminal mode from the `toggle` keymap)
      vim.keymap.set("n", "+", "<Leader>oi", { desc = "Increment under cursor", noremap = true })
      vim.keymap.set("n", "-", "<Leader>od", { desc = "Decrement under cursor", noremap = true })
    end,
  }
}

return M
