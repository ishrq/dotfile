-- Author: IA
-- Machine: PC

--Set <Space> as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Define map function
local map = vim.keymap.set
local def = { noremap = true, silent = true }

-- General
map('v', '.', ':normal .<CR>', { desc = "Apply repeat on select"})
map('i', '<c-f>', '<C-g>u<Esc>[S1z=`]a<c-g>u', def, {desc = "Fix spelling"})
map("n", "<leader>=", ":set spell!<cr>", { desc = "Spelling" })
map("n", "<leader>8", ':execute "set cc=" . (&cc == "" ? "80" : "")<cr>', def, { desc = "Column color" })
map("n", "<leader>a", ":keepjumps normal! GVgg<cr>", def, { desc = "Select all" })
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Substitute word under cursor" })
map("n", "<leader>x", ":!chmod +x %<CR>", def, { desc = "Make executable" })

-- Better indenting
map("v", "<", "<gv^")
map("v", ">", ">gv^")

-- Register
map("", "gp", "`[v`]", def, { desc = "Select pasted" })
map("x", "<leader>p", [["_dP]], { desc = "Replace selection with register" })

-- Command mode movement
map("c", "<c-n>", "<down>")
map("c", "<c-p>", "<up>")
map("c", "<c-f>", "<right>")
map("c", "<c-b>", "<left>")

-- Insert mode movement
map("i", "<c-h>", "<left>")
map("i", "<c-l>", "<right>")

-- Move through line breaks
map({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })


-- Buffer
map("n", "]b", "<cmd>bnext<CR>", def, { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<CR>", def, { desc = "Previous buffer" })

-- Move text up/down
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Line down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Line up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Line down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Line up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Line down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Line up" })

-- Less cursor movement
map("", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map('n', '{', '{zz')
map('n', '}', '}zz')
map('v', 'y', 'ygv<ESC>')

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- Tabs, windows, frequent files
map("n", ",b", ":tab drop ~/ARCHIVE/Journal/backlog.txt<cr>", { desc = "Open backlog.txt" })
map("n", ",j", ":tab drop ~/ARCHIVE/Journal/journal.txt<cr>", { desc = "Open journal.txt" })
map("n", ",k", ":tab drop ~/.config/nvim/lua/keymaps.lua<cr>", { desc = "Open keymap.lua" })
map('n', '<Leader>t1', '<CMD>tabnext1<CR>', {desc = "1st tab"})
map('n', '<Leader>t2', '<CMD>tabnext2<CR>', {desc = "2nd tab"})
map('n', '<Leader>t3', '<CMD>tabnext3<CR>', {desc = "3rd tab"})
map('n', '<Leader>t4', '<CMD>tabnext4<CR>', {desc = "4th tab"})
map('n', '<Leader>t5', '<CMD>tabnext5<CR>', {desc = "5th tab"})
map('n', '<Leader>t6', '<CMD>tabnext6<CR>', {desc = "6th tab"})
map('n', '<Leader>t7', '<CMD>tabnext7<CR>', {desc = "7th tab"})
map('n', '<Leader>t8', '<CMD>tabnext8<CR>', {desc = "8th tab"})
map('n', '<Leader>t9', '<CMD>tabnext9<CR>', {desc = "9th tab"})
map('n', '[t', '<CMD>tabprevious<CR>', {desc = "Previous tab"})
map('n', ']t', '<CMD>tabnext<CR>', {desc = "Next tab"})
map('n', '[T', '<CMD>tabmove -1<CR>', {desc = "Shift to previous tab"})
map('n', ']T', '<CMD>tabmove +1<CR>', {desc = "Shift to next tab"})


-- Diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, def)
map("n", "]d", vim.diagnostic.goto_next, def)
map('n', '<leader>e', vim.diagnostic.open_float)
-- map('n', '<leader>q', vim.diagnostic.setloclist, def)
