-- Formatters per filetype. Every filetype listed here is also formatted on save.
-- Filetypes mapped to `{}` have no external formatter and use the LSP formatter instead.
-- Formatters are installed by Mason (see the `formatters` list in lsp.lua).
local prettier = { 'prettierd', 'prettier', stop_after_first = true }

local formatters_by_ft = {
  lua = { 'stylua' },
  python = { 'ruff_organize_imports', 'ruff_format' },
  rust = { 'rustfmt' },
  go = { 'gofumpt', 'goimports' },
  c = {},
  cpp = {},
  sh = { 'shfmt' },
  bash = { 'shfmt' },

  -- web (all prettier, so they share one style)
  javascript = prettier,
  typescript = prettier,
  javascriptreact = prettier,
  typescriptreact = prettier,
  vue = prettier,
  html = prettier,
  css = prettier,
  scss = prettier,
  less = prettier,
  json = prettier,
  jsonc = prettier,
  yaml = prettier,
  markdown = prettier,
}

require('conform').setup {
  notify_on_error = false,
  formatters_by_ft = formatters_by_ft,
  formatters = {
    shfmt = { prepend_args = { '-i', '2' } }, -- 2-space indent, matching everything else
  },
  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return end
    if formatters_by_ft[vim.bo[bufnr].filetype] then return { timeout_ms = 500 } end
  end,
  default_format_opts = {
    lsp_format = 'fallback',
  },
}

-- :FormatToggle  -> toggle format-on-save everywhere
-- :FormatToggle! -> toggle it for the current buffer only
vim.api.nvim_create_user_command('FormatToggle', function(opts)
  local scope, label
  if opts.bang then
    scope, label = vim.b, 'this buffer'
  else
    scope, label = vim.g, 'all buffers'
  end
  scope.disable_autoformat = not scope.disable_autoformat
  vim.notify(('Format on save %s for %s'):format(scope.disable_autoformat and 'disabled' or 'enabled', label))
end, { bang = true, desc = 'Toggle format on save' })
