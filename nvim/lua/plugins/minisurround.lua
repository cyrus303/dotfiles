return {
  'echasnovski/mini.surround',
  version = '*', -- Optional: specify the version if needed
  config = function()
    require('mini.surround').setup {
      -- Add your custom configuration here
      custom_surroundings = nil,
      highlight_duration = 500,
      mappings = {
        add = 'gsa', -- Add surrounding in Normal and Visual modes
        delete = 'gsd', -- Delete surrounding
        find = 'gsf', -- Find surrounding (to the right)
        find_left = 'gsF', -- Find surrounding (to the left)
        highlight = 'gsh', -- Highlight surrounding
        replace = 'gsr', -- Replace surrounding
        update_n_lines = 'gsn', -- Update `n_lines`
      },
      n_lines = 20,
      respect_selection_type = false,
      search_method = 'cover',
      silent = false,
    }
  end,
}
