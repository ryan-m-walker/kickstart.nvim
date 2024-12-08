require('monokai-pro').setup {
  transparent_background = true,
  terminal_colors = true,
  devicons = true,
}

require('nightfox').setup {
  options = {
    transparent = true,
  },
}

-- Initialize current theme state
_G.current_theme = 'monokai-pro'

-- Function to toggle between themes
local function toggle_theme()
  if _G.current_theme == 'monokai-pro' then
    vim.cmd 'colorscheme dawnfox'
    _G.current_theme = 'dawnfox'
  else
    vim.cmd 'colorscheme monokai-pro'
    _G.current_theme = 'monokai-pro'
  end
end

-- Set initial theme based on system preference
local theme = vim.fn.system 'defaults read -g AppleInterfaceStyle'
if theme:match 'Dark' then
  vim.cmd 'colorscheme monokai-pro'
  _G.current_theme = 'monokai-pro'
else
  vim.cmd 'colorscheme dawnfox'
  _G.current_theme = 'dawnfox'
end

-- Add the toggle theme keymap
vim.keymap.set('n', '<leader>tt', toggle_theme, { noremap = true, silent = true, desc = '[T]oggle [T]heme' })
