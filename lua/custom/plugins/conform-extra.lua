require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    local enabled_filetypes = {
      lua = true,
      python = true,
      javascript = true,
      typescript = true,
      javascriptreact = true,
      typescriptreact = true,
      rust = true,
      go = true,
      cpp = true,
    }
    if enabled_filetypes[vim.bo[bufnr].filetype] then
      return { timeout_ms = 500 }
    else
      return nil
    end
  end,
  default_format_opts = {
    lsp_format = 'fallback',
  },
}

local formatter_map = {
  lua = { 'stylua' },
  python = { 'isort', 'black' },
  javascript = { 'prettierd', 'prettier', stop_after_first = true },
  typescript = { 'prettierd', 'prettier', stop_after_first = true },
  javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
  typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
  rust = { 'rustfmt' },
  go = { 'gofumpt', 'goimports' },
}

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('custom-conform-formatters', { clear = true }),
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    local formatters = formatter_map[ft]
    if formatters then require('conform').formatters_by_ft[ft] = formatters end
  end,
})
