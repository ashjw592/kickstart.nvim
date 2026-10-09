-- Wrap inside a safe configuration file or init block
if not _G.copilot_initialized then
  -- 1. Safely add to runtime path
  vim.pack.add { 'https://github.com/zbirenbaum/copilot.lua' }

  -- 2. Prevent a double require().setup() if Neovim reloads this block
  _G.copilot_initialized = true

  -- 3. Run setup safely
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
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = false,
    },
  }
end

-- 4. Safe buffer-level toggle that won't kill the background process
vim.keymap.set('n', '<leader>ct', function() require('copilot.suggestion').toggle_auto_trigger() end, { desc = 'Toggle Copilot Suggestions' })
