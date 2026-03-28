vim.cmd 'hi clear'
if vim.fn.exists 'syntax_on' == 1 then vim.cmd 'syntax reset' end
vim.g.colors_name = 'terminal-native'

vim.cmd [[
  " Follow terminal defaults for base UI
  hi Normal       ctermfg=NONE ctermbg=NONE
  hi NormalFloat  ctermfg=NONE ctermbg=NONE
  hi SignColumn   ctermfg=NONE ctermbg=NONE
  hi EndOfBuffer  ctermfg=8    ctermbg=NONE
  hi LineNr       ctermfg=8    ctermbg=NONE
  hi CursorLineNr ctermfg=15   ctermbg=NONE cterm=bold
  hi CursorLine   ctermbg=NONE
  hi StatusLine   ctermfg=7    ctermbg=NONE
  hi StatusLineNC ctermfg=8    ctermbg=NONE
  hi VertSplit    ctermfg=8    ctermbg=NONE
  hi WinSeparator ctermfg=8    ctermbg=NONE

  " Core syntax groups mapped to ANSI slots
  hi Comment      ctermfg=8                   cterm=italic
  hi Constant     ctermfg=3
  hi String       ctermfg=2
  hi Character    ctermfg=2
  hi Number       ctermfg=3
  hi Boolean      ctermfg=3                   cterm=bold
  hi Identifier   ctermfg=6
  hi Function     ctermfg=4
  hi Statement    ctermfg=5                   cterm=bold
  hi Keyword      ctermfg=5                   cterm=bold
  hi PreProc      ctermfg=5
  hi Type         ctermfg=6                   cterm=bold
  hi Special      ctermfg=1
  hi Underlined   ctermfg=4                   cterm=underline
  hi Error        ctermfg=15  ctermbg=1       cterm=bold
  hi Todo         ctermfg=0   ctermbg=3       cterm=bold

  " Common editor affordances
  hi Visual       cterm=reverse ctermfg=NONE ctermbg=NONE
  hi Search       ctermfg=0    ctermbg=3
  hi IncSearch    ctermfg=0    ctermbg=6
  hi Pmenu        ctermfg=7    ctermbg=0
  hi PmenuSel     ctermfg=0    ctermbg=6       cterm=bold
  hi MatchParen   ctermfg=NONE ctermbg=8       cterm=bold
]]
