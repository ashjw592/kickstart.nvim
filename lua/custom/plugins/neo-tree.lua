-- lua/custom/plugins/neo-tree.lua
vim.pack.add {
  'https://github.com/nvim-neo-tree/neo-tree.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/MunifTanjim/nui.nvim',
}

require('neo-tree').setup {}

vim.keymap.set('n', '\\', ':Neotree toggle<CR>', { desc = 'NeoTree toggle', silent = true })
