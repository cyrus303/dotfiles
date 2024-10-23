return {
  {
    -- Catppuccin theme configuration
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { 'undercurl' },
            hints = { 'undercurl' },
            warnings = { 'undercurl' },
            information = { 'undercurl' },
          },
        },
        navic = { enabled = true, custom_bg = 'lualine' },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    config = function()
      -- vim.cmd [[colorscheme catppuccin]]
    end,
  },

  {
    -- Lackluster theme configuration
    'slugbyte/lackluster.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- NOTE: Uncomment one of the following lines to use a different theme variant
      -- vim.cmd [[colorscheme lackluster]]
      -- vim.cmd.colorscheme 'lackluster-hack'
      -- vim.cmd.colorscheme("lackluster-mint")
    end,
  },

  -- Define the rose-pine theme
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
      require('rose-pine').setup {
        variant = 'auto', -- auto, main, moon, or dawn
        dark_variant = 'main', -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlightt = true, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          italic = true,
          transparency = false,
        },

        groups = {
          border = 'muted',
          link = 'iris',
          panel = 'surface',

          error = 'love',
          hint = 'iris',
          info = 'foam',
          note = 'pine',
          todo = 'rose',
          warn = 'gold',

          git_add = 'foam',
          git_change = 'rose',
          git_delete = 'love',
          git_dirty = 'rose',
          git_ignore = 'muted',
          git_merge = 'iris',
          git_rename = 'pine',
          git_stage = 'iris',
          git_text = 'rose',
          git_untracked = 'subtle',

          h1 = 'iris',
          h2 = 'foam',
          h3 = 'rose',
          h4 = 'gold',
          h5 = 'pine',
          h6 = 'foam',
        },
      }

      -- Uncomment one of the following lines to select the desired variant
      -- vim.cmd 'colorscheme rose-pine'
      vim.cmd 'colorscheme rose-pine-main'

      vim.cmd [[highlight CursorLineNr guifg=#eb6f92]]
      -- vim.cmd("colorscheme rose-pine-dawn")
      -- vim.cmd 'colorscheme rose-pine-moon'
    end,
  },
  {
    'rebelot/kanagawa.nvim', -- The Kanagawa theme
    lazy = false, -- Load the theme immediately
    priority = 1000, -- Ensure it's loaded before other plugins
    config = function()
      -- Setup Kanagawa theme
      require('kanagawa').setup {
        colors = {
          theme = {
            -- Custom configurations for specific themes or all themes
            all = {
              ui = {
                float = {
                  bg = 'none',
                },
                bg_gutter = 'none', -- Remove gutter background for all themes
              },
            },
          },
        },
      }

      -- Apply the Kanagawa colorscheme
      -- Uncomment your desired theme:
      --      vim.cmd 'colorscheme kanagawa-wave'
      --      vim.cmd 'colorscheme kanagawa-dragon'
      -- vim.cmd 'colorscheme kanagawa-lotus'
    end,
  },
}
