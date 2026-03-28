-- Then run: :colorscheme pink-black

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.g.colors_name = "pink-black"

local c = {
  bg         = "#1c1c1e",
  bg_dark    = "#141416",
  bg_subtle  = "#2a2a2e",
  bg_select  = "#4a2d4e",
  fg         = "#e0c8f0",
  fg_muted   = "#a89ab8",
  fg_subtle  = "#4a3d52",
  cursor     = "#eebebe",
  pink       = "#f4b8e4",
  pink_dim   = "#f08be0",
  pink_soft  = "#eebebe",
  pink_bright= "#ff99d4",
  red        = "#e78284",
  green      = "#a6d189",
  yellow     = "#e5c890",
  blue       = "#8caaee",
  teal       = "#81c8be",
  plum       = "#4a2d4e",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ── Editor ──────────────────────────────────────────────────────────
hi("Normal",          { fg = c.fg,        bg = c.bg })
hi("NormalFloat",     { fg = c.fg,        bg = c.bg_dark })
hi("NormalNC",        { fg = c.fg_muted,  bg = c.bg })
hi("Cursor",          { fg = c.bg,        bg = c.cursor })
hi("CursorLine",      { bg = c.bg_subtle })
hi("CursorColumn",    { bg = c.bg_subtle })
hi("CursorLineNr",    { fg = c.pink_soft, bold = true })
hi("LineNr",          { fg = c.fg_subtle })
hi("SignColumn",      { fg = c.fg_subtle, bg = c.bg })
hi("ColorColumn",     { bg = c.bg_subtle })
hi("Visual",          { bg = c.bg_select, fg = c.pink })
hi("VisualNOS",       { bg = c.bg_select })
hi("Search",          { fg = c.bg,        bg = c.pink_bright })
hi("IncSearch",       { fg = c.bg,        bg = c.cursor })
hi("CurSearch",       { fg = c.bg,        bg = c.cursor })
hi("Pmenu",           { fg = c.fg,        bg = c.bg_dark })
hi("PmenuSel",        { fg = c.bg,        bg = c.pink_dim })
hi("PmenuSbar",       { bg = c.bg_subtle })
hi("PmenuThumb",      { bg = c.pink })
hi("StatusLine",      { fg = c.pink_soft, bg = c.bg_dark })
hi("StatusLineNC",    { fg = c.fg_subtle, bg = c.bg_dark })
hi("WinSeparator",    { fg = c.bg_subtle })
hi("TabLine",         { fg = c.fg_muted,  bg = c.bg_dark })
hi("TabLineSel",      { fg = c.pink,      bg = c.bg, bold = true })
hi("TabLineFill",     { bg = c.bg_dark })
hi("MatchParen",      { fg = c.pink_bright, bold = true, underline = true })
hi("NonText",         { fg = c.fg_subtle })
hi("SpecialKey",      { fg = c.fg_subtle })
hi("Whitespace",      { fg = c.bg_subtle })
hi("Folded",          { fg = c.fg_muted,  bg = c.bg_dark, italic = true })
hi("FoldColumn",      { fg = c.fg_subtle, bg = c.bg })
hi("Title",           { fg = c.pink,      bold = true })
hi("Directory",       { fg = c.pink_dim })
hi("EndOfBuffer",     { fg = c.bg_subtle })
hi("QuickFixLine",    { bg = c.bg_select })

-- ── Syntax ──────────────────────────────────────────────────────────
hi("Comment",         { fg = c.fg_subtle, italic = true })
hi("String",          { fg = c.green })
hi("Character",       { fg = c.green })
hi("Number",          { fg = c.pink_soft })
hi("Float",           { fg = c.pink_soft })
hi("Boolean",         { fg = c.pink_bright, bold = true })
hi("Keyword",         { fg = c.pink_dim,  bold = true })
hi("Conditional",     { fg = c.pink_dim,  bold = true })
hi("Repeat",          { fg = c.pink_dim,  bold = true })
hi("Exception",       { fg = c.red,       bold = true })
hi("Operator",        { fg = c.pink })
hi("Function",        { fg = c.blue })
hi("Identifier",      { fg = c.fg })
hi("Type",            { fg = c.yellow })
hi("StorageClass",    { fg = c.yellow,    italic = true })
hi("Structure",       { fg = c.yellow })
hi("Typedef",         { fg = c.yellow })
hi("Constant",        { fg = c.pink_bright })
hi("Define",          { fg = c.pink_dim })
hi("Macro",           { fg = c.pink_dim })
hi("PreProc",         { fg = c.pink_dim })
hi("Include",         { fg = c.pink_dim })
hi("Special",         { fg = c.pink })
hi("SpecialChar",     { fg = c.pink_soft })
hi("Tag",             { fg = c.pink })
hi("Delimiter",       { fg = c.fg_muted })
hi("SpecialComment",  { fg = c.pink_soft, italic = true })
hi("Debug",           { fg = c.red })
hi("Error",           { fg = c.red,       bold = true })
hi("Warning",         { fg = c.yellow })
hi("Todo",            { fg = c.bg,        bg = c.pink_bright, bold = true })
hi("Underlined",      { underline = true })

-- ── Treesitter ───────────────────────────────────────────────────────
hi("@comment",            { link = "Comment" })
hi("@string",             { link = "String" })
hi("@number",             { link = "Number" })
hi("@float",              { link = "Float" })
hi("@boolean",            { link = "Boolean" })
hi("@keyword",            { link = "Keyword" })
hi("@keyword.return",     { fg = c.pink_bright, bold = true })
hi("@keyword.function",   { fg = c.pink_dim, bold = true })
hi("@conditional",        { link = "Conditional" })
hi("@repeat",             { link = "Repeat" })
hi("@operator",           { link = "Operator" })
hi("@function",           { link = "Function" })
hi("@function.call",      { fg = c.blue })
hi("@function.builtin",   { fg = c.teal })
hi("@method",             { fg = c.blue })
hi("@method.call",        { fg = c.blue })
hi("@type",               { link = "Type" })
hi("@type.builtin",       { fg = c.yellow, italic = true })
hi("@variable",           { fg = c.fg })
hi("@variable.builtin",   { fg = c.pink_soft, italic = true })
hi("@parameter",          { fg = c.pink_soft })
hi("@field",              { fg = c.teal })
hi("@property",           { fg = c.teal })
hi("@constructor",        { fg = c.yellow })
hi("@constant",           { link = "Constant" })
hi("@constant.builtin",   { fg = c.pink_bright, bold = true })
hi("@namespace",          { fg = c.yellow, italic = true })
hi("@tag",                { fg = c.pink })
hi("@tag.attribute",      { fg = c.pink_soft })
hi("@tag.delimiter",      { fg = c.fg_muted })
hi("@punctuation",        { fg = c.fg_muted })
hi("@text.uri",           { fg = c.teal, underline = true })
hi("@text.emphasis",      { italic = true })
hi("@text.strong",        { bold = true })
hi("@text.title",         { fg = c.pink, bold = true })

-- ── LSP ──────────────────────────────────────────────────────────────
hi("DiagnosticError",     { fg = c.red })
hi("DiagnosticWarn",      { fg = c.yellow })
hi("DiagnosticInfo",      { fg = c.blue })
hi("DiagnosticHint",      { fg = c.teal })
hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.yellow })
hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.blue })
hi("DiagnosticUnderlineHint",  { undercurl = true, sp = c.teal })
hi("LspReferenceText",    { bg = c.plum })
hi("LspReferenceRead",    { bg = c.plum })
hi("LspReferenceWrite",   { bg = c.plum, bold = true })

-- ── Git ───────────────────────────────────────────────────────────────
hi("DiffAdd",             { fg = c.green,  bg = "#1e3028" })
hi("DiffChange",          { fg = c.yellow, bg = "#2e2a1e" })
hi("DiffDelete",          { fg = c.red,    bg = "#2e1e1e" })
hi("DiffText",            { fg = c.yellow, bg = "#3a3010", bold = true })
hi("GitSignsAdd",         { fg = c.green })
hi("GitSignsChange",      { fg = c.yellow })
hi("GitSignsDelete",      { fg = c.red })
