-- Add any additional LSP servers here. Names must match nvim-lspconfig's
-- server names, which also correspond to mason-lspconfig package names.
-- See :help lspconfig-all for the full list of supported servers.
---@type table<string, vim.lsp.Config>
-- Vue's TS plugin lives inside the mason-installed vue-language-server package
local vue_language_server_path = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/language-server'

local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}

local servers = {
  pyright = {},
  rust_analyzer = {},
  html = {},
  cssls = {},
  jsonls = {},
  bashls = {},
  clangd = {},
  millet = {},

  -- TS/JS + Vue (hybrid mode)
  vtsls = {
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    settings = {
      vtsls = {
        tsserver = {
          globalPlugins = { vue_plugin },
        },
      },
    },
  },
  vue_ls = {}, -- defaults are correct, don't override filetypes
}

-- Make sure mason/mason-lspconfig/nvim-lspconfig are available
-- (no-op if kickstart's Section 6 already added them)
vim.pack.add {
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
}

-- Extend Mason's ensure_installed list with our servers too
require('mason-tool-installer').setup {
  ensure_installed = vim.tbl_keys(servers),
}

for name, server in pairs(servers) do
  vim.lsp.config(name, server)
  vim.lsp.enable(name)
end
