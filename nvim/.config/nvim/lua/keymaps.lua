--Set <Space> as Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Define map function
local map = vim.keymap.set
local def = { noremap=true, silent=true }

-- General
map('', 'gV', '`[v`]', def, {desc='Select yanked/pasted/modified text'})
map('i', '<C-z>', '<C-g>u<Esc>[S1z=`]a<C-g>u', {desc='Fix spelling'})
map('n', '<Leader>=', ':set spell!<CR>', {desc='Toggle spell check'})
map('n', '<Leader>8', ':execute "set cc=" . (&cc == "" ? "80" : "")<CR>', def, {desc="Toggle character column"})
map('v', '.', ':normal .<CR>', {desc='Visual mode dot repeat'})
map('n', 'X', ':keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>', { silent=true, desc='Split line' })
map('x', 'g/', '<Esc>/\\%V', {silent=false, desc='Search inside selection'})

-- NOTE: use the new command mode abbr?
-- map('n', '<Leader>x', ":!chmod +x %<CR>", def, {desc='Make executable'})

-- NOTE: familiarize using 'C-r C-w' instead
-- map('n', '<Leader>r', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc='Replace current word'})

-- Search visually selected text
map('x', '*', [[y/\V<C-R>=escape(@", '/\')<CR><CR>]])
map('x', '#', [[y?\V<C-R>=escape(@", '?\')<CR><CR>]])

-- Better indenting
map('v', '<', '<gv^')
map('v', '>', '>gv^')

-- Register
map({'n', 'x'}, 'gy', '"+y', { desc = 'Yank to system clipboard' })
map({'n', 'x'}, 'gd', '"+d', { desc = 'Delete to system clipboard' })
map('n', 'gp', '"+p', { desc = 'Paste from system clipboard' })
map('x', 'gp', '"+P', { desc = 'Paste from system clipboard' })

-- Command mode movement
map('c', '<C-a>', '<Home>')
map('c', '<C-n>', '<Down>')
map('c', '<C-p>', '<Up>')
map('c', '<M-h>', '<Left>', {silent=false})
map('c', '<M-l>', '<Right>', {silent=false})

-- Insert mode movement
map('i', '<M-h>', '<Left>', {noremap=false})
map('i', '<M-j>', '<Down>', {noremap=false})
map('i', '<M-k>', '<Up>', {noremap=false})
map('i', '<M-l>', '<Right>', {noremap=false})

-- Move through line breaks
map({ 'n', 'x' }, 'j', 'v:count == 0 ? "gj" : "j"', {expr=true, silent=true })
map({ 'n', 'x' }, 'k', 'v:count == 0 ? "gk" : "k"', {expr=true, silent=true })

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

-- Tabs, windows, frequent files
map('n', '\\b', ":tab drop ~/ARCHIVE/Journal/backlog.txt<CR>", {desc='Open backlog.txt'})
map('n', '\\j', ":tab drop ~/ARCHIVE/Journal/journal.txt<CR>", {desc='Open journal.txt'})
map('n', '\\k', ":tab drop ~/.config/nvim/lua/keymaps.lua<CR>", {desc='Open keymap.lua'})
-- map('n', '<Leader>tl', '<Cmd>tabmove +1<CR>', {desc='Swap tab with next'})
-- map('n', '<Leader>th', '<Cmd>tabmove -1<CR>', {desc='Swap tab with previous'})

-- Diagnostic keymaps
map('n', '<Leader>e', vim.diagnostic.open_float)
-- map('n', '<leader>q', vim.diagnostic.setloclist, def)

-- mini.trailspace
map('n', '<Leader>t', '<Cmd>lua MiniTrailspace.trim()<CR>', {desc='Trim trailspace'})
map('n', '<Leader>T', '<Cmd>lua MiniTrailspace.trim_last_lines()<CR>', {desc='Trim trail lines'})
-- map('n', '<Leader>t', '<Cmd>%s/\\s\\+$//e<CR>', {desc='Trim trailspace'})

-- Textobjects

-- Around line: with leading and trailing whitespace
-- map('v', 'al', ':<c-u>silent! normal! 0v$<cr>', { silent = true })
-- map('o', 'al', ':normal val<cr>', { noremap = false, silent = true })

-- Inner line: without leading or trailing whitespace
-- map('v', 'il', ':<c-u>silent! normal! ^vg_<cr>', { silent = true })
-- map('o', 'il', ':normal vil<cr>', { noremap = false, silent = true })


-- mini.nvim: mini.ai
map({'n','x','o'}, ']a', "<Cmd>lua MiniAi.move_cursor('left', 'i', 'a')<CR>", {desc='Next argument'})
map({'n','x','o'}, ']A', "<Cmd>lua MiniAi.move_cursor('right', 'i', 'a')<CR>", {desc='Next argument end'})
map({'n','x','o'}, '[a', "<Cmd>lua MiniAi.move_cursor('left', 'i', 'a', {search_method='prev'})<CR>", {desc='Previous argument'})
map({'n','x','o'}, '[A', "<Cmd>lua MiniAi.move_cursor('right', 'i', 'a', {search_method='prev'})<CR>", {desc='Previous argument end'})
map({'n','x','o'}, ']f', "<Cmd>lua MiniAi.move_cursor('left', 'i', 'f')<CR>", {desc='Next function'})
map({'n','x','o'}, ']F', "<Cmd>lua MiniAi.move_cursor('right', 'i', 'f')<CR>", {desc='Next function end'})
map({'n','x','o'}, '[f', "<Cmd>lua MiniAi.move_cursor('left', 'i', 'f', {search_method='prev'})<CR>", {desc='Previous function'})
map({'n','x','o'}, '[F', "<Cmd>lua MiniAi.move_cursor('right', 'i', 'f', {search_method='prev'})<CR>", {desc='Previous function end'})
