-- Claude Code integration (https://github.com/coder/claudecode.nvim)
-- Requires the `claude` CLI on your PATH.
if not _G.claudecode_initialized then
  vim.pack.add { 'https://github.com/coder/claudecode.nvim' }
  _G.claudecode_initialized = true

  require('claudecode').setup {
    terminal = {
      split_side = 'right',
      split_width_percentage = 0.35,
      provider = 'native', -- no snacks.nvim needed
    },
  }
end

local map = function(mode, lhs, rhs, desc) vim.keymap.set(mode, lhs, rhs, { desc = desc }) end

map('n', '<leader>ac', '<cmd>ClaudeCode<cr>', 'Toggle Claude')
-- From inside the Claude terminal: hide the panel and jump back to your code
map('t', '<C-q>', '<cmd>ClaudeCode<cr>', 'Hide Claude panel')
-- From inside the Claude terminal: keep the panel open but move to the code window on the left
map('t', '<C-h>', '<C-\\><C-n><C-w>h', 'Move to left window')
map('n', '<leader>af', '<cmd>ClaudeCodeFocus<cr>', 'Focus Claude')
map('n', '<leader>ar', '<cmd>ClaudeCode --resume<cr>', 'Resume Claude')
map('n', '<leader>aC', '<cmd>ClaudeCode --continue<cr>', 'Continue Claude')
map('n', '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', 'Add current buffer to Claude')
map('v', '<leader>as', '<cmd>ClaudeCodeSend<cr>', 'Send selection to Claude')
map('n', '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', 'Accept Claude diff')
map('n', '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', 'Deny Claude diff')
