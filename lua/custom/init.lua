require 'custom.lsp'

local gitportal = require 'gitportal'

gitportal.setup {
  always_include_current_line = true,
}
vim.keymap.set('n', '<leader>gp', function()
  gitportal.open_file_in_browser()
end)
vim.keymap.set('v', '<leader>gp', function()
  gitportal.open_file_in_browser()
end)
vim.keymap.set('n', '<leader>ig', function()
  gitportal.open_file_in_neovim()
end)

require('colorizer').setup()

-- Buffer deletion keymaps
vim.keymap.set('n', '<leader>x', ':bd<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>X', ':bufdo bd<CR>', { noremap = true, silent = true })

-- Function to move register content to default register
vim.keymap.set('n', '<leader>m', function()
  -- Get next character input
  local char = vim.fn.nr2char(vim.fn.getchar())
  -- Move content from specified register to default register
  vim.fn.setreg('"', vim.fn.getreg(char))
end, { desc = "[M]ove register [Name]'s content to default register" })
