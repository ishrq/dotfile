-- Author: IA
-- Machine: PC



local opt = vim.o


--CONTEXT
vim.o.colorcolumn    = ''
vim.o.number         = true
vim.o.numberwidth    = 4
vim.o.relativenumber = true
vim.o.ruler          = true
vim.o.scrolloff      = 8
vim.o.sidescrolloff  = 4
vim.o.signcolumn     = 'yes'

--FILETYPE
vim.o.encoding       = 'utf-8'
vim.o.fileencoding   = 'utf-8'
vim.o.termencoding   = 'utf-8'

--THEME
vim.o.syntax = 'on'
vim.o.termguicolors  = true

--WHITESPACE
vim.o.expandtab      = true
vim.o.tabstop        = 4
vim.o.softtabstop    = 4
vim.o.shiftwidth     = 4

--SPLITS
vim.o.splitbelow    = 1
vim.o.splitright    = 1

--INDENT
vim.o.autoindent     = true
vim.o.breakindent    = true
vim.o.smartindent    = true

--WRAP
vim.o.lbr            = true
vim.o.wrap           = true
vim.o.whichwrap      = '<,>,h,l' -- <>hl to move up/down at line-end

--FOLD
vim.o.foldenable     = true
vim.o.foldlevel      = 99
vim.o.foldmethod     = 'indent' --manual, indent, syntax, expr, marker

--HISTORY
vim.o.swapfile       = false
vim.o.backup         = false
vim.o.undofile       = true
vim.o.undolevels     = 10000
vim.o.undodir        = os.getenv("HOME") .. "/.config/nvim/.undo-history/"

--GENERAL
vim.o.completeopt    = "menu,menuone,noselect"
vim.o.autoread       = true
vim.o.ch             = 1 -- hide commandbar
vim.o.clipboard      = "unnamedplus" -- use system clipboard
vim.o.cursorline     = true
vim.o.grepprg        = 'rg' -- rg as default grep
vim.o.ls             = 2 --statusbar size
vim.o.lazyredraw     = true
vim.o.mouse          = 'a'
vim.o.showmatch      = true -- highlight [{()}]
vim.o.spo            = 'noplainbuffer' -- no spellcheck in code
vim.o.timeoutlen     = 1000  -- key timeout
vim.o.updatetime     = 50  -- decrease update time
-- opt.wbr            = "%f"


--SEARCH
-- vim.o.hlsearch       = true
vim.o.ignorecase     = true
vim.o.incsearch      = true
vim.o.smartcase      = true

--From: https://this-week-in-neovim.org/2023/Jan/9

local ns = vim.api.nvim_create_namespace('toggle_hlsearch')

local function toggle_hlsearch(char)
  if vim.fn.mode() == 'n' then
    local keys = { '<CR>', 'n', 'N', '*', '#', '?', '/' }
    local new_hlsearch = vim.tbl_contains(keys, vim.fn.keytrans(char))

    if vim.opt.hlsearch:get() ~= new_hlsearch then
      vim.opt.hlsearch = new_hlsearch
    end
  end
end

vim.on_key(toggle_hlsearch, ns)
