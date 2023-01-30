-- Author: IA
-- Machine: PC


local augroup = vim.api.nvim_create_augroup  --Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd  --Create autocommand

augroup('bufcheck', {clear = true})

-- reload config file on change
autocmd('BufWritePost', {
  group   = 'bufcheck',
  pattern = vim.env.MYVIMRC,
  command = 'silent source %'})

-- highlight yanks
autocmd('TextYankPost', {
  group    = 'bufcheck',
  pattern  = '*',
  callback = function() vim.highlight.on_yank{timeout=300} end })

-- resume previous position
autocmd('BufReadPost', {
  pattern = '*',
  command = [[ if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]], })

-- remove whitespace on write
autocmd('BufWritePre', {
  pattern = '*',
  command = ":%s/\\s\\+$//e" })

-- don't auto comment new lines
autocmd('BufEnter', {
  pattern = '*',
  command = 'set fo-=c fo-=r fo-=o' })

-- start git messages in insert mode
autocmd('FileType', {
  group   = 'bufcheck',
  pattern = { 'gitcommit', 'gitrebase', },
  command = 'startinsert | 1' } )

-- no backup, swapfile, undofile for gopass
autocmd({'BufRead', 'BufNewFile'}, {
  pattern = { '/dev/shm/gopass*' },
  command = ' setlocal noswapfile nobackup noundofile shada="" ' } )

-- spellcheck
autocmd({'BufRead', 'BufNewFile'}, {
  pattern = { '*.txt', '*.md', '*.tex'},
  command = 'setlocal spell cc=80' } )

-- disable color column
autocmd('BufRead', {
  pattern = {'*/Journal/*', '*/Finance/*', '*/House/*', '*/List/*'},
  command = 'setlocal cc=' })

-- fold
autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()' end })


-- auto create directory on save
-- https://jdhao.github.io/2022/08/21/you-do-not-need-a-plugin-for-this/
autocmd({ "BufWritePre" }, {
  pattern = "*",
  group = augroup("auto_create_dir", { clear = true }),
  callback = function(ctx)
    local dir = vim.fn.fnamemodify(ctx.file, ":p:h")
    vim.fn.mkdir(dir, "p")
  end
})

--Toggle relative number in Insert mode
--https://libreddit.spike.codes/r/neovim/comments/10bmy9w/lets_see_your_status_columns/
local numbertogglegroup = augroup("numbertoggle", { clear = true })

autocmd({ "BufEnter", "FocusGained", "InsertLeave" }, {
    pattern = "*",
    callback = function()
        vim.wo.relativenumber = true
    end,
    group = numbertogglegroup, })

autocmd({ "BufLeave", "FocusLost", "InsertEnter" }, {
    pattern = "*",
    callback = function()
        vim.wo.relativenumber = false
    end,
    group = numbertogglegroup, })


--SKELETON

--Ledger
autocmd('BufNewFile', {
    pattern = '*/Finance/Ledger/ledger*.txt',
    command = '0r ~/.config/nvim/skeletons/ledger.txt' })

--HTML
autocmd('BufNewFile', {
    pattern = '*.html',
    command = '0r ~/.config/nvim/skeletons/html-skeleton.html' })

--CSS
autocmd('BufNewFile', {
    pattern = {'style.css', 'reset.css'},
    command = '0r ~/.config/nvim/skeletons/css-reset.css' })
