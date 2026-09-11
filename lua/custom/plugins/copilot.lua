vim.pack.add {
  'https://github.com/zbirenbaum/copilot.lua',
}

require('copilot').setup {
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept = '<Tab>',
      accept_word = false,
      accept_line = false,
      next = '<M-]>',
      prev = '<M-[>',
      dismiss = '<C-]>',
    },
  },
  panel = { enabled = false }, -- set true if you also want the sidebar suggestion panel
  filetypes = {
    markdown = true,
    help = false,
  },
}
