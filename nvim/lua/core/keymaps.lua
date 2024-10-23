-- This file is automatically loaded by lazyvim.config.init

-- DO NOT USE `LazyVim.safe_keymap_set` IN YOUR OWN CONFIG!!
-- use `vim.keymap.set` instead

local map = vim.keymap.set

-- better up/down
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
map({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window', remap = true })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window', remap = true })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window', remap = true })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window', remap = true })

-- delete single character without copying into register
map('n', 'x', '"_x', { noremap = true, silent = true })

-- Horizontal split with leader + |
-- Vertical split with leader + \
vim.api.nvim_set_keymap('n', '<leader>|', ':split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>\\', ':vsplit<CR>', { noremap = true, silent = true })

-- Close the current split or buffer with leader + q
vim.api.nvim_set_keymap('n', '<leader>q', ':close<CR>', { noremap = true, silent = true })

-- Resize window using <ctrl> arrow keys
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- Move Lines
map('n', '<Esc>j', '<cmd>m .+1<cr>==', { desc = 'Move Down' })
map('n', '<Esc>k', '<cmd>m .-2<cr>==', { desc = 'Move Up' })
map('i', '<Esc>j', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
map('i', '<Esc>k', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
map('v', '<Esc>j', ":m '>+1<cr>gv=gv", { desc = 'Move Down' })
map('v', '<Esc>k', ":m '<-2<cr>gv=gv", { desc = 'Move Up' })

-- buffers
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
map('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
map('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
map('n', '<leader>`', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
map('n', '<leader>bd', '<cmd>:bd<cr>', { desc = 'Delete Buffer and Window' })

-- Clear search with <esc>
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and Clear hlsearch' })

-- Clear search, diff update and redraw
map('n', '<leader>ur', '<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>', { desc = 'Redraw / Clear hlsearch / Diff Update' })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next Search Result' })
map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
map('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev Search Result' })
map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })
map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })

-- Add undo break-points
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', ';', ';<c-g>u')

-- save file
map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

--keywordprg
map('n', '<leader>K', '<cmd>norm! K<cr>', { desc = 'Keywordprg' })

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- commenting
map('n', 'gco', 'o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Below' })
map('n', 'gcO', 'O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Above' })

-- lazy
map('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })

-- new file
map('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })

map('n', '<leader>xl', '<cmd>lopen<cr>', { desc = 'Location List' })
map('n', '<leader>xq', '<cmd>copen<cr>', { desc = 'Quickfix List' })

map('n', '[q', vim.cmd.cprev, { desc = 'Previous Quickfix' })
map('n', ']q', vim.cmd.cnext, { desc = 'Next Quickfix' })

-- formatting
-- map({ 'n', 'v' }, '<leader>cf', function()
--   LazyVim.format { force = true }
-- end, { desc = 'Format' })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end
map('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })
map('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
map('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })
map('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
map('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
map('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
map('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })

-- toggle options
-- Toggle options
local function toggle_format(force)
  vim.lsp.buf.format { async = true, force = force }
end

-- You can define toggle functions or use existing commands for these features.
local toggle_spell = function()
  vim.o.spell = not vim.o.spell
end
local toggle_wrap = function()
  vim.o.wrap = not vim.o.wrap
end
local toggle_relative_number = function()
  vim.o.relativenumber = not vim.o.relativenumber
end
local toggle_diagnostics = function()
  --  vim.diagnostic.disable()
  vim.diagnostic.enable(false)
end -- Update this with more robust logic if needed
local toggle_number = function()
  vim.o.number = not vim.o.number
end
local toggle_conceallevel = function()
  vim.o.conceallevel = (vim.o.conceallevel == 0) and 2 or 0
end

-- Key mappings
vim.keymap.set('n', '<leader>uf', function()
  toggle_format(false)
end, { desc = 'Format' })
vim.keymap.set('n', '<leader>uF', function()
  toggle_format(true)
end, { desc = 'Force Format' })
vim.keymap.set('n', '<leader>us', toggle_spell, { desc = 'Toggle Spelling' })
vim.keymap.set('n', '<leader>uw', toggle_wrap, { desc = 'Toggle Wrap' })
vim.keymap.set('n', '<leader>uL', toggle_relative_number, { desc = 'Toggle Relative Number' })
vim.keymap.set('n', '<leader>ud', toggle_diagnostics, { desc = 'Toggle Diagnostics' })
vim.keymap.set('n', '<leader>ul', toggle_number, { desc = 'Toggle Line Numbers' })
vim.keymap.set('n', '<leader>uc', toggle_conceallevel, { desc = 'Toggle Conceal Level' })
