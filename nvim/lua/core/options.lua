vim.g.mapleader = ' '
vim.g.maplocalleader = ' ' -- Hide deprecation warnings

-- Trigger `autoread` when files change on disk
vim.o.autoread = true
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  pattern = '*',
  callback = function()
    if vim.fn.mode() ~= 'c' then
      vim.cmd 'checktime'
    end
  end,
})

-- Notification after file change
vim.api.nvim_create_autocmd('FileChangedShellPost', {
  pattern = '*',
  callback = function()
    vim.api.nvim_echo({ { 'File changed on disk. Buffer reloaded.', 'WarningMsg' } }, false, {})
  end,
})

vim.g.deprecation_warnings = false

-- Set filetype to `bigfile` for files larger than 1.5 MB
vim.g.bigfile_size = 1024 * 1024 * 1.5 -- 1.5 MB

-- Show the current document symbols location from Trouble in lualine
vim.g.trouble_lualine = true

local opt = vim.opt

opt.autowrite = true -- Enable auto write
-- only set clipboard if not in ssh, to make sure the OSC 52 integration works automatically. Requires Neovim >= 0.10.0
opt.clipboard = 'unnamedplus' -- Sync with system clipboard
opt.completeopt = 'menu,menuone,noselect'
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = false -- Enable highlighting of the current line

opt.expandtab = true -- Use spaces instead of tabs
opt.fillchars = {
  foldopen = '',
  foldclose = '',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}
opt.foldlevel = 99
opt.grepformat = '%f:%l:%c:%m'
opt.grepprg = 'rg --vimgrep'
opt.ignorecase = true -- Ignore case
opt.inccommand = 'nosplit' -- preview incremental substitute
opt.jumpoptions = 'view'
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- Wrap lines at convenient points
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = 'a' -- Enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp', 'folds' }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append { W = true, I = true, c = true, C = true }
opt.showmode = false -- Don't show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = 'yes' -- Always show the signcolumn
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { 'en' }
opt.spelloptions:append 'noplainbuffer'
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = 'screen'
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = 'block' -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = 'longest:full,full' -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default (default: 'auto')

opt.number = true -- Make line numbers default (default: false)
opt.relativenumber = true -- Set relative numbered lines (default: false)
opt.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim. (default: '')
opt.wrap = false -- Display lines as one long line (default: true)
opt.linebreak = true -- Companion to wrap, don't split words (default: false)
opt.mouse = 'a' -- Enable mouse mode (default: '')
opt.autoindent = true -- Copy indent from current line when starting new one (default: true)
opt.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search (default: false)
opt.smartcase = true -- Smart case (default: false)
opt.shiftwidth = 2 -- The number of spaces inserted for each indentation (default: 8)
opt.tabstop = 2 -- Insert n spaces for a tab (default: 8)
opt.softtabstop = 2 -- Number of spaces that a tab counts for while performing editing operations (default: 0)
opt.expandtab = true -- Convert tabs to spaces (default: false)
opt.scrolloff = 4 -- Minimal number of screen lines to keep above and below the cursor (default: 0)
opt.sidescrolloff = 8 -- Minimal number of screen columns either side of cursor if wrap is `false` (default: 0)
opt.splitbelow = true -- Force all horizontal splits to go below current window (default: false)
opt.splitright = true -- Force all vertical splits to go to the right of current window (default: false)
opt.hlsearch = false -- Set highlight on search (default: true)
opt.showmode = false -- We don't need to see things like -- INSERT -- anymore (default: true)
opt.termguicolors = true -- Set termguicolors to enable highlight groups (default: false)
opt.whichwrap = 'bs<>[]hl' -- Which "horizontal" keys are allowed to travel to prev/next line (default: 'b,s')
opt.numberwidth = 4 -- Set number column width to 2 {default 4} (default: 4)
opt.swapfile = false -- Creates a swapfile (default: true)
opt.smartindent = true -- Make indenting smarter again (default: false)
opt.showtabline = 1 -- Always show tabs (default: 1)
opt.backspace = 'indent,eol,start' -- Allow backspace on (default: 'indent,eol,start')
opt.pumheight = 10 -- Pop up menu height (default: 0)
opt.conceallevel = 0 -- So that `` is visible in markdown files (default: 1)
opt.signcolumn = 'yes' -- Keep signcolumn on by default (default: 'auto')
opt.fileencoding = 'utf-8' -- The encoding written to a file (default: 'utf-8')
opt.cmdheight = 1 -- More space in the Neovim command line for displaying messages (default: 1)
opt.breakindent = true -- Enable break indent (default: false)
opt.updatetime = 250 -- Decrease update time (default: 4000)
opt.timeoutlen = 300 -- Time to wait for a mapped sequence to complete (in milliseconds) (default: 1000)
opt.backup = false -- Creates a backup file (default: false)
opt.writebackup = false -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited (default: true)
opt.undofile = true -- Save undo history (default: false)
opt.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience (default: 'menu,preview')
opt.shortmess:append 'c' -- Don't give |ins-completion-menu| messages (default: does not include 'c')
opt.iskeyword:append '-' -- Hyphenated words recognized by searches (default: does not include '-')
opt.formatoptions:remove { 'c', 'r', 'o' } -- Don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode. (default: 'croql')
opt.runtimepath:remove '/usr/share/vim/vimfiles' -- Separate Vim plugins from Neovim in case Vim is still in use (default: includes this path if Vim is installed)
opt.shortmess:append 'c' -- This will hide some command-line messages

-- Enable cursorline for the line number only
vim.opt.cursorline = true -- Enable cursorline
vim.opt.cursorlineopt = 'number' -- Only highlight the line number
