-- personal vim options

vim.opt.relativenumber = true
vim.opt.scrolloff = 8

-- COLORSCHEME

vim.cmd.colorscheme 'catppuccin'

local transparent_groups = {
  'Normal',
  'NormalNC',
  'NormalFloat',
  'FloatBorder',
  'FloatTitle',
  'SignColumn',
  'EndOfBuffer',
  'LineNr',
  'CursorLineNr',
  'StatusLine',
  'StatusLineNC',
  'TabLine',
  'TabLineFill',
  'TabLineSel',
  'Pmenu',
  'PmenuSel',
  'PmenuSbar',
  'PmenuThumb',
  'WinSeparator',
  'VertSplit',
  'FoldColumn',
  'Folded',
  'NonText',
  'TelescopeNormal',
  'TelescopeBorder',
  'NeoTreeNormal',
  'NeoTreeNormalNC',
}

local function apply_transparency()
  for _, group in ipairs(transparent_groups) do
    local hl = vim.api.nvim_get_hl(0, { name = group })
    hl.bg = nil
    vim.api.nvim_set_hl(0, group, hl)
  end
end

vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('custom-transparency', { clear = true }),
  callback = apply_transparency,
})

-- Apply once immediately too, in case options.lua loads after the
-- colorscheme has already been set (covers the current session on startup)
apply_transparency()

vim.o.winblend = 0
vim.o.pumblend = 0

-- END COLORSCHEME
