return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      -- Telescope FZF Native for faster search
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font }, -- Nerd Font dependency
  },
  config = function()
    local actions = require 'telescope.actions'
    local builtin = require 'telescope.builtin'

    -- [[ Configure Telescope ]]
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous, -- move to previous result
            ['<C-j>'] = actions.move_selection_next, -- move to next result
            ['<C-l>'] = actions.select_default, -- select result
            ['<C-d>'] = actions.delete_buffer, -- delete buffer
          },
          n = {
            ['<C-d>'] = actions.delete_buffer, -- delete buffer in normal mode
            ['dd'] = actions.delete_buffer, -- alternative delete buffer in normal mode
            ['q'] = actions.close,
          },
        },
      },
      pickers = {
        find_files = {
          file_ignore_patterns = { 'node_modules', '.git' },
          hidden = true, -- Show hidden files
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Load Telescope extensions if available
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- Key mappings for Telescope
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files' })
    vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = '[S]earch [F]iles' })

    -- Fuzzy search within the current buffer
    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- Custom live grep to search in open files
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })
  end,
}