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
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  -- { -- Bufferline for buffer tabs
  --   'akinsho/bufferline.nvim',
  --   version = '*',
  --   dependencies = 'nvim-tree/nvim-web-devicons',
  --   config = function()
  --     local bufferline = require 'bufferline'
  --     bufferline.setup {
  --       options = {
  --         mode = 'buffers', -- tabs or buffers
  --         separator_style = 'thin',
  --         diagnostics = 'nvim_lsp',
  --         diagnostics_indicator = function(count, level)
  --           local icon = level:match 'error' and ' ' or ' '
  --           return ' ' .. icon .. count
  --         end,
  --         offsets = {
  --           {
  --             filetype = 'NvimTree',
  --             text = 'File Explorer',
  --             highlight = 'Directory',
  --             separator = true,
  --             text_align = 'left',
  --           },
  --         },
  --       },
  --     }
  --
  --     -- Navigate buffers
  --     vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer tab' })
  --     vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer tab' })
  --     vim.keymap.set('n', '<leader>x', '<cmd>bdelete<CR>', { desc = 'Close buffer' })
  --     vim.keymap.set('n', '<leader>X', '<cmd>bdelete!<CR>', { desc = 'Force close buffer' })
  --
  --     -- Move buffers
  --     vim.keymap.set('n', '<leader>bl', '<cmd>BufferLineMoveNext<CR>', { desc = 'Move buffer right' })
  --     vim.keymap.set('n', '<leader>bh', '<cmd>BufferLineMovePrev<CR>', { desc = 'Move buffer left' })
  --
  --     -- Go to buffer
  --     vim.keymap.set('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<CR>', { desc = 'Go to buffer 1' })
  --     vim.keymap.set('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<CR>', { desc = 'Go to buffer 2' })
  --     vim.keymap.set('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<CR>', { desc = 'Go to buffer 3' })
  --     vim.keymap.set('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<CR>', { desc = 'Go to buffer 4' })
  --     vim.keymap.set('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<CR>', { desc = 'Go to buffer 5' })
  --     vim.keymap.set('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<CR>', { desc = 'Go to buffer 6' })
  --     vim.keymap.set('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<CR>', { desc = 'Go to buffer 7' })
  --     vim.keymap.set('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<CR>', { desc = 'Go to buffer 8' })
  --     vim.keymap.set('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<CR>', { desc = 'Go to buffer 9' })
  --   end,
  -- },
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

  -- { -- File explorer
  --   'nvim-tree/nvim-tree.lua',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   keys = {
  --     { '\\', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle NvimTree', silent = true },
  --   },
  --   opts = {
  --     sort_by = 'case_sensitive',
  --     view = {
  --       width = 30,
  --     },
  --     renderer = {
  --       group_empty = true,
  --       icons = {
  --         show = {
  --           file = true,
  --           folder = true,
  --           folder_arrow = true,
  --           git = true,
  --         },
  --       },
  --     },
  --     filters = {
  --       dotfiles = false,
  --     },
  --     git = {
  --       enable = true,
  --       ignore = false,
  --     },
  --     actions = {
  --       open_file = {
  --         quit_on_open = false,
  --         window_picker = {
  --           enable = true,
  --         },
  --       },
  --     },
  --     update_focused_file = {
  --       enable = true,
  --       update_root = false,
  --     },
  --   },
  --   config = function(_, opts)
  --     -- disable netrw at the very start of your init.lua
  --     vim.g.loaded_netrw = 1
  --     vim.g.loaded_netrwPlugin = 1
  --
  --     require('nvim-tree').setup(opts)
  --
  --     -- Make nvim-tree background transparent
  --     vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'NONE', ctermbg = 'NONE' })
  --     vim.api.nvim_set_hl(0, 'NvimTreeEndOfBuffer', { bg = 'NONE', ctermbg = 'NONE' })
  --   end,
  -- },
  { -- Oil file explorer
    'stevearc/oil.nvim',
    opts = {
      -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
      default_file_explorer = true,
      -- Id is automatically added at the beginning, and name at the end
      -- See :help oil-columns
      columns = {
        'icon',
        'permissions',
        'size',
        'mtime',
      },
      -- Buffer-local options to use for oil buffers
      buf_options = {
        buflisted = false,
        bufhidden = 'hide',
      },
      -- Window-local options to use for oil buffers
      win_options = {
        wrap = false,
        signcolumn = 'no',
        cursorcolumn = false,
        foldcolumn = '0',
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = 'nvic',
      },
      -- Send deleted files to the trash instead of permanently deleting them
      delete_to_trash = false,
      -- Skip the confirmation popup for simple operations
      skip_confirm_for_simple_edits = false,
      -- Change this to customize the command used when deleting to trash
      trash_command = 'trash-put',
      -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
      prompt_save_on_select_new_entry = true,
      -- Oil will automatically delete hidden buffers after this delay
      -- You can set the delay to false to disable cleanup entirely
      -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
      cleanup_delay_ms = 2000,
      -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
      -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
      -- Additionally, if it is a string that matches "actions.<name>",
      -- it will use the mapping at require("oil.actions").<name>
      -- Set to `false` to remove a keymap
      -- See :help oil-actions for a list of all available actions
      keymaps = {
        ['g?'] = 'actions.show_help',
        ['<CR>'] = 'actions.select',
        ['<C-s>'] = 'actions.select_vsplit',
        ['<C-h>'] = 'actions.select_split',
        ['<C-t>'] = 'actions.select_tab',
        ['<C-p>'] = 'actions.preview',
        ['<C-c>'] = 'actions.close',
        ['<C-l>'] = 'actions.refresh',
        ['-'] = 'actions.parent',
        ['_'] = 'actions.open_cwd',
        ['`'] = 'actions.cd',
        ['~'] = 'actions.tcd',
        ['gs'] = 'actions.change_sort',
        ['gx'] = 'actions.open_external',
        ['g.'] = 'actions.toggle_hidden',
      },
      -- Set to false to disable all of the above keymaps
      use_default_keymaps = true,
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
        -- This function defines what is considered a "hidden" file
        is_hidden_file = function(name, bufnr)
          return vim.startswith(name, '.')
        end,
        -- This function defines what will never be shown, even when `show_hidden` is set
        is_always_hidden = function(name, bufnr)
          return false
        end,
        sort = {
          -- sort order can be "asc" or "desc"
          -- see :help oil-columns to see which columns are sortable
          { 'type', 'asc' },
          { 'name', 'asc' },
        },
      },
      -- Configuration for the floating window in oil.open_float
      float = {
        -- Padding around the floating window
        padding = 2,
        max_width = 0,
        max_height = 0,
        border = 'rounded',
        win_options = {
          winblend = 0,
        },
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf)
          return conf
        end,
      },
    },
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
    },
  },

  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  { -- Monokai Pro Theme
    'loctvl842/monokai-pro.nvim',
    priority = 1000,
    config = function()
      require('monokai-pro').setup {
        transparent_background = true,
        terminal_colors = true,
        devicons = true,
        filter = 'pro', -- classic | octagon | pro | machine | ristretto | spectrum
        background_clear = {
          'float_win',
          'toggleterm',
          'telescope',
          'which-key',
          'nvim-tree',
          'bufferline',
        },
        inc_search = 'background', -- underline | background
        italic_comments = true,
        plugins = {
          bufferline = {
            underline_selected = false,
            underline_visible = false,
          },
          indent_blankline = {
            context_highlight = 'default', -- default | pro
          },
        },
      }
    end,
  },
  { 'trevorhauter/gitportal.nvim' },
  { 'norcalli/nvim-colorizer.lua' },
  { 'EdenEast/nightfox.nvim' },
  {
    'folke/ts-comments.nvim',
    opts = {},
    event = 'VeryLazy',
    enabled = vim.fn.has 'nvim-0.10.0' == 1,
  },
  {
    'xiyaowong/transparent.nvim',
  },
  require 'custom.plugins.alpha-vim',
}
