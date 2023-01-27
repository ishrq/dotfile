-- Author: IA
-- Machine: PC

--Set <Space> as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Define map function
local map = vim.keymap.set
local def = { noremap = true, silent = true }

--[[ Unused key guides
Leader  ; , . 0 2 3 4 6 7 c e f h i o r v w z
Comma   , . ; / = - <space>
]]

--General
map("n", "<leader>=", ":set spell!<cr>", { desc = "Spelling" })
map("n", "<leader>8", ':execute "set cc=" . (&cc == "" ? "80" : "")<cr>', def, { desc = "Column color" })
map("n", "<leader>a", ":keepjumps normal! GVgg<cr>", def, { desc = "Select all" })
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search replace current word" })
map("n", "<leader>x", ":!chmod +x %<CR>", def, { desc = "Make file executable" })

--Register
map("", "gp", "`[v`]", def, { desc = "Select pasted" })
map("", "<leader>y", ":lua require'telescope.builtin'.registers{}<cr>", def, { desc = "Search register" })
map("x", "<leader>p", [["_dP]], { desc = "Replace selection with register" })

--Navigate
map("i", "<c-h>", "<left>") --Move cursor left
map("i", "<c-l>", "<right>") --Move cursor right
map("", "<UP>", "gk", def)
map("", "<DOWN>", "gj", def)
map("n", "n", "nzzzv", def) --Center next search
map("n", "N", "Nzzzv", def) --Center previous search
map("n", "<C-d>", "<C-d>zz") --Center screen on up
map("n", "<C-u>", "<C-u>zz") --Center screen on down

--Buffer
map("n", "]b", ":bnext<CR>", def, { desc = "Next buffer" })
map("n", "[b", ":bprevious<CR>", def, { desc = "Previous buffer" })
map("n", "<leader>b", ":lua require'telescope.builtin'.buffers{}<cr>", def, { desc = "Search buffers" })

--Move text up/down
map("", "J", "mzJ`z", def, { desc = "Join line w/o moving cursor" })
map("n", "<A-j>", ":m .+1<CR>==", def, { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", def, { desc = "Move line up" })
map("x", "<A-j>", ":m '>+1<CR>gv-gv", def, { desc = "Move selection down" })
map("x", "<A-k>", ":m '<-2<CR>gv-gv", def, { desc = "Move selection up" })

--Tabs, windows, frequent files
map("n", ",b", ":tab drop ~/ARCHIVE/Journal/backlog.txt<cr>", { desc = "Open backlog.txt" })
map("n", ",j", ":tab drop ~/ARCHIVE/Journal/journal.txt<cr>", { desc = "Open journal.txt" })
map("n", ",k", ":tab drop ~/.config/nvim/lua/keymaps.lua<cr>", { desc = "Open keymap.lua" })

--Telescope
map("n", "<leader>1", ":lua require('telescope.builtin').oldfiles{}<cr>", { desc = "Search recent files" })
map("n", "<leader>fd", ":lua require('telescope.builtin').find_files{}<cr>", { desc = "Search project files" })
map("n", "<leader>m", ":lua require('telescope.builtin').marks{}<cr>", { desc = "Search marks" })
map("n", "<leader>j", ":lua require('telescope.builtin').jumplist{}<cr>", { desc = "Search jumplist" })
map("n", "<leader>k", ":lua require('telescope.builtin').keymaps{}<cr>", { desc = "Search keymaps" })
map("n", "<leader>rg", ":lua require('telescope.builtin').live_grep{}<cr>", { desc = "Grep" })
map("n", "z=", ":lua require('telescope.builtin').spell_suggest{}<cr>", { desc = "Spelling suggestions" })
map("n", "<leader>;", ":TodoTelescope<cr>", { desc = "Find TODO" }) --folke/todo-comments.nvim
map("n", "<leader>u", ":Telescope undo<cr>", { desc = "Search undotree" }) --folke/todo-comments.nvim

--Git
map("n", "<leader>gf", ":lua require('telescope.builtin').git_files{}<cr>", { desc = "Search git files" })
map("n", "<leader>gc", ":lua require('telescope.builtin').git_commits{}<cr>", { desc = "Search git commits" })
map("n", "<leader>gs", ":lua require('telescope.builtin').git_status{}<cr>", { desc = "Search git status" })

--phaazon/hop.nvim
map(
    "n",
    "<leader><space>",
    ":lua require'hop'.hint_words({current_line_only = true})<cr>",
    def,
    { desc = "Hop to word" }
)
map("n", "<leader>/", ":lua require'hop'.hint_patterns()<cr>", def, { desc = "Hop to pattern" })

-- Diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, def)
map("n", "]d", vim.diagnostic.goto_next, def)
map('n', '<leader>e', vim.diagnostic.open_float)
-- map('n', '<leader>q', vim.diagnostic.setloclist, def)
map("n", "<leader>q", "lua require('telescope.builtin').diagnostics{}<cr>", { desc = "Search Diagnostics" })
