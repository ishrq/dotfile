-- Indent 2 spaces
vim.o.tabstop     = 2
vim.o.softtabstop = 2
vim.o.shiftwidth  = 2

-- character column
vim.o.cc = 81

-- markdown-preview.nvim
vim.keymap.set('n', '<C-p>', '<Plug>MarkdownPreviewToggle', {desc='Markdown Preview'})

-- MiniAi textobjects
local spec_pair = require('mini.ai').gen_spec.pair
vim.b.miniai_config = {
  -- TODO: add textobject for footnotes, tasks, headings
  custom_textobjects = {
    ['*'] = spec_pair('*', '*', { type = 'greedy' }),
    ['_'] = spec_pair('_', '_', { type = 'greedy' }),
    ['~'] = spec_pair('~', '~', { type = 'greedy' }),
    d = {{ '()%d%d%d%d[-|/]%d%d[-|/]%d%d()', '()%d%d[-|/]%d%d[-|/]%d%d%d%d()', }}, -- date
    -- HACK: url registers characters like '>', ']', ')', etc.
    u = { 'http[s]?://[%S]+' }, -- url
  },
}

local nxo = {'n', 'x', 'o'}
vim.keymap.set(nxo, ']d', "<Cmd>lua MiniAi.move_cursor('left', 'i', 'd', {n_lines='200'})<CR>", {desc='Next Date'})
vim.keymap.set(nxo, '[d', "<Cmd>lua MiniAi.move_cursor('left', 'i', 'd', {search_method='prev', n_lines='200'})<CR>", {desc='Previous Date'})
vim.keymap.set(nxo, ']u', "<Cmd>lua MiniAi.move_cursor('left', 'i', 'u', {n_lines='200'})<CR>", {desc='Next URL'})
vim.keymap.set(nxo, '[u', "<Cmd>lua MiniAi.move_cursor('left', 'i', 'u', {search_method='prev', n_lines='200'})<CR>", {desc='Previous URL'})


-- MiniBracketed
vim.b.minibracketed_config = {
  treesitter = { suffix = '' },
}
