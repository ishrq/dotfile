-- Set <Space> as Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Declare variables
local map = vim.keymap.set
local default = { noremap=true, silent=true }
local allow_remap = { noremap=false, silent=true }
local expr = { expr=true, silent=true }

-- General
map('n', '<Leader>=', ':set spell!<CR>', {desc='Toggle spell check'})
map('n', '<Leader>8', ':execute "set cc=" . (&cc == "" ? "80" : "")<CR>', default, {desc='Toggle character column'})
map('n', 'X', ':keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<CR>', {desc='Split line'})

-- Better indenting
map('v', '<', '<gv^')
map('v', '>', '>gv^')

-- Command mode movement
map('c', '<C-a>', '<Home>')
map('c', '<C-n>', '<Down>')
map('c', '<C-p>', '<Up>')

-- Less cursor movement
map('', 'J', 'mzJ`z')
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', '*', '*zz')
map('n', '#', '#zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', '{', '{zz')
map('n', '}', '}zz')
map('v', 'y', 'ygv<Esc>')

-- Add undo break-points
map('i', ',', ',<C-g>u')
map('i', '.', '.<C-g>u')
map('i', ';', ';<C-g>u')

-- Explorer, Tabs, windows, frequent files
map('n', '\\b', ":tab drop ~/ARCHIVE/Journals/Backlog/capture.txt<CR>", {desc='Open backlog.txt'})
map('n', '\\d', ":tab drop ~/ARCHIVE/Journals/Backlog/done.txt<CR>", {desc='Open done.txt'})
map('n', '\\t', ":tab drop ~/ARCHIVE/Journals/Backlog/todo.txt<CR>", {desc='Open todo.txt'})
map('n', '<C-t>', ':15Le %:p:h<CR>', default, {desc='Open netrw in file directory'})
map('n', '<C-e-t>', ':15Le<CR>', default, {desc='Open netrw in working directory'})

-- Diagnostic keymaps
map('n', '<Leader>e', vim.diagnostic.open_float)
map('n', '<leader>q', vim.diagnostic.setloclist, default)

-- mini.basic
map({ 'n', 'i', 'x' }, '<C-s>', '<Nop>')
map({ 'n' }, '<C-z>', '<Nop>')

-- mini.trailspace
map('n', '<Leader>t', '<Cmd>lua MiniTrailspace.trim()<CR>', {desc='Trim trailing space'})
map('n', '<Leader>T', '<Cmd>lua MiniTrailspace.trim_last_lines()<CR>', {desc='Trim trailing lines'})

-- mini.ai
local nxo = {'n','x','o'}
map(nxo, ']a', "<Cmd>lua MiniAi.move_cursor('left', 'i', 'a')<CR>", {desc='Next argument'})
map(nxo, ']A', "<Cmd>lua MiniAi.move_cursor('right', 'i', 'a')<CR>", {desc='Next argument end'})
map(nxo, '[a', "<Cmd>lua MiniAi.move_cursor('left', 'i', 'a', {search_method='prev'})<CR>", {desc='Previous argument'})
map(nxo, '[A', "<Cmd>lua MiniAi.move_cursor('right', 'i', 'a', {search_method='prev'})<CR>", {desc='Previous argument end'})
map(nxo, ']F', "<Cmd>lua MiniAi.move_cursor('left', 'i', 'f')<CR>", {desc='Next function'})
map(nxo, '[F', "<Cmd>lua MiniAi.move_cursor('left', 'i', 'f', {search_method='prev'})<CR>", {desc='Previous function'})
