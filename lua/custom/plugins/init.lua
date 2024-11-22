-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'typescript',
          'tsx',
          'javascript',
          'html',
          'css',
          'json',
          'lua',
          'vim',
          'vimdoc',
          'query',
        },
        auto_install = true,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<C-space>',
            node_incremental = '<C-space>',
            scope_incremental = '<C-s>',
            node_decremental = '<C-backspace>',
          },
        },
      }
    end,
  },
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      dashboard.section.header.val = {
        [[                               __                ]],
        [[  ___     ___    ___   __  __ /\_\    ___ ___   ]],
        [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\ ]],
        [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
        [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
      }

      dashboard.section.buttons.val = {
        dashboard.button('f', '  Find file', ':Telescope find_files <CR>'),
        dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('r', '  Recently used files', ':Telescope oldfiles <CR>'),
        dashboard.button('t', '  Find text', ':Telescope live_grep <CR>'),
        dashboard.button('c', '  Configuration', ':e $MYVIMRC <CR>'),
        dashboard.button('q', '  Quit Neovim', ':qa<CR>'),
      }

      dashboard.section.footer.val = 'Happy Coding!'

      dashboard.config.opts.noautocmd = true
      -- Set header padding
      dashboard.config.layout = {
        { type = 'padding', val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) } },
        dashboard.section.header,
        { type = 'padding', val = 5 },
        dashboard.section.buttons,
        { type = 'padding', val = 2 },
        dashboard.section.footer,
      }

      alpha.setup(dashboard.config)
    end,
  },
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      -- add any opts here
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = 'make',
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
      'zbirenbaum/copilot.lua', -- for providers='copilot'
      {
        -- support for image pasting
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
  },
  -- {
  -- 'nvim-neo-tree/neo-tree.nvim',
  -- version = '*',
  -- dependencies = {
  --   'nvim-lua/plenary.nvim',
  --   'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
  --   'MunifTanjim/nui.nvim',
  -- },
  -- cmd = 'Neotree',
  -- keys = {
  --   { '<leader>e', ':Neotree focus<CR>', desc = 'NeoTree focus current file', silent = true },
  --   { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  -- },
  -- opts = {
  --   filesystem = {
  --     filtered_items = {
  --       visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
  --       hide_dotfiles = false,
  --       hide_gitignored = true,
  --     },
  --     window = {
  --       mappings = {
  --         ['\\'] = 'close_window',
  --       },
  --     },
  --   },
  -- },
  --   config = function(_, opts)
  --     require('neo-tree').setup(opts)
  --     -- Make Neo-tree background transparent
  --     vim.api.nvim_set_hl(0, 'NeoTreeNormal', { bg = 'NONE', ctermbg = 'NONE' })
  --     vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { bg = 'NONE', ctermbg = 'NONE' })
  --     vim.api.nvim_set_hl(0, 'NeoTreeEndOfBuffer', { bg = 'NONE', ctermbg = 'NONE' })
  --   end,
  -- },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  { -- Bufferline for buffer tabs
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      local bufferline = require 'bufferline'
      bufferline.setup {
        options = {
          mode = 'buffers', -- tabs or buffers
          separator_style = 'thin',
          diagnostics = 'nvim_lsp',
          diagnostics_indicator = function(count, level)
            local icon = level:match 'error' and ' ' or ' '
            return ' ' .. icon .. count
          end,
          offsets = {
            {
              filetype = 'neo-tree',
              text = 'File Explorer',
              highlight = 'Directory',
              separator = true,
            },
          },
        },
      }

      -- Navigate buffers
      vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer tab' })
      vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer tab' })
      vim.keymap.set('n', '<leader>x', '<cmd>bdelete<CR>', { desc = 'Close buffer' })
      vim.keymap.set('n', '<leader>X', '<cmd>bdelete!<CR>', { desc = 'Force close buffer' })

      -- Move buffers
      vim.keymap.set('n', '<leader>bl', '<cmd>BufferLineMoveNext<CR>', { desc = 'Move buffer right' })
      vim.keymap.set('n', '<leader>bh', '<cmd>BufferLineMovePrev<CR>', { desc = 'Move buffer left' })

      -- Go to buffer
      vim.keymap.set('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<CR>', { desc = 'Go to buffer 1' })
      vim.keymap.set('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<CR>', { desc = 'Go to buffer 2' })
      vim.keymap.set('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<CR>', { desc = 'Go to buffer 3' })
      vim.keymap.set('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<CR>', { desc = 'Go to buffer 4' })
      vim.keymap.set('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<CR>', { desc = 'Go to buffer 5' })
      vim.keymap.set('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<CR>', { desc = 'Go to buffer 6' })
      vim.keymap.set('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<CR>', { desc = 'Go to buffer 7' })
      vim.keymap.set('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<CR>', { desc = 'Go to buffer 8' })
      vim.keymap.set('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<CR>', { desc = 'Go to buffer 9' })
    end,
  },

  {
    'andrew-george/telescope-themes',
    config = function()
      require('telescope').load_extension 'themes'
    end,
  },

  { -- Github Copilot
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = '[[',
            jump_next = ']]',
            accept = '<CR>',
            refresh = 'gr',
            open = '<M-CR>',
          },
          layout = {
            position = 'bottom',
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = '<M-l>',
            accept_word = '<M-w>',
            accept_line = '<M-]>',
            next = '<M-]>',
            prev = '<M-[>',
            dismiss = '<C-]>',
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ['.'] = false,
        },
      }

      -- hide copilot suggestions when cmp menu is open
      -- to prevent suggestion duplicates
      local cmp_status_ok, cmp = pcall(require, 'cmp')
      if cmp_status_ok then
        cmp.event:on('menu_opened', function()
          vim.b.copilot_suggestion_hidden = true
        end)

        cmp.event:on('menu_closed', function()
          vim.b.copilot_suggestion_hidden = false
        end)
      end
    end,
  },

  { -- File explorer
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '\\', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle NvimTree', silent = true },
    },
    opts = {
      sort_by = 'case_sensitive',
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      filters = {
        dotfiles = false,
      },
      git = {
        enable = true,
        ignore = false,
      },
      actions = {
        open_file = {
          quit_on_open = false,
          window_picker = {
            enable = true,
          },
        },
      },
      update_focused_file = {
        enable = true,
        update_root = false,
      },
    },
    config = function(_, opts)
      -- disable netrw at the very start of your init.lua
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require('nvim-tree').setup(opts)

      -- Make nvim-tree background transparent
      vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'NONE', ctermbg = 'NONE' })
      vim.api.nvim_set_hl(0, 'NvimTreeEndOfBuffer', { bg = 'NONE', ctermbg = 'NONE' })
    end,
  },
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
}
