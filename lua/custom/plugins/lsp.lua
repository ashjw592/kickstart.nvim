-- Add any additional LSP servers here. Names must match nvim-lspconfig's
-- server names, which also correspond to mason-lspconfig package names.
-- See :help lspconfig-all for the full list of supported servers.
---@type table<string, vim.lsp.Config>
local servers = {
  pyright = {},
  ts_ls = {}, -- TypeScript / JavaScript
  rust_analyzer = {},
  gopls = {},
  html = {},
  cssls = {},
  jsonls = {},
  bashls = {},
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
