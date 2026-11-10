-- Formatters per filetype. Every filetype listed here is also formatted on save.
-- Filetypes mapped to `{}` have no external formatter and use the LSP formatter instead.
local prettier = { 'prettierd', 'prettier', stop_after_first = true }

local formatters_by_ft = {
  lua = { 'stylua' },
  python = { 'isort', 'black' },
  rust = { 'rustfmt' },
  go = { 'gofumpt', 'goimports' },
  cpp = {},

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
  format_on_save = function(bufnr)
    if formatters_by_ft[vim.bo[bufnr].filetype] then return { timeout_ms = 500 } end
  end,
  default_format_opts = {
    lsp_format = 'fallback',
  },
}
