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
