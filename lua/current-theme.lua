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

local theme = vim.fn.system 'defaults read -g AppleInterfaceStyle'
if theme:match 'Dark' then
  vim.cmd 'colorscheme monokai-pro'
else
  vim.cmd 'colorscheme dawnfox'
end
