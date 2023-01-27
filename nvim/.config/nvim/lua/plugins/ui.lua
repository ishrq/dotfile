-- Author: IA
-- Machine: PC


return {
    --Colorscheme
    {
        "jesseleite/nvim-noirbuddy",
        dependencies = {"tjdevries/colorbuddy.nvim", branch = "dev"},
        config = function()
            require("noirbuddy").setup {
                -- preset = 'minimal',
                preset = 'miami-nights',
                -- preset = 'kiwi',
                -- preset = 'crt-amber',
                -- preset = 'crt-green',
                -- preset = 'slate',
                colors = {
                    -- primary = '#e4609b',
                    -- secondary = '#6EE2FF',
                    background = '#000000',
                },
                styles = {
                    italic = true,
                    bold = true,
                    underline = true,
                    undercurl = true,
                },
            } end
    },
    --Statusline
    {
        'nvim-lualine/lualine.nvim',
        event = "FocusGained",
        config = function() require('lualine').setup{
            options = {
                globalstatus = true,
                icons_enabled = false,
                component_separators = '|',
                section_seperators = '',
            }
        } end
    },
    --Indent guides
    {
        'lukas-reineke/indent-blankline.nvim',
        event = "BufEnter",
        config = function()
            vim.opt.list = true
            vim.opt.listchars:append "eol:↴"
            require("indent_blankline").setup {
                show_end_of_line = true,
                show_current_context = true,
                show_current_context_start = true,
            }
        end
    },
    --Highlight window
    {
        'nvim-zh/colorful-winsep.nvim',
        event = "BufWinEnter",
        config = true
    },
}
