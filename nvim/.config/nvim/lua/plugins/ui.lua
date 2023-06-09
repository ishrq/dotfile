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
        event = "VeryLazy",
        config = function() require('lualine').setup{
            options = {
                theme = "auto",
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
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            char = "│",
            filetype_exclude = {
                "help",
                "alpha",
                "dashboard",
                "neo-tree",
                "Trouble",
                "lazy",
                "mason",
                "notify",
                "toggleterm",
                "lazyterm",
            },
            show_trailing_blankline_indent = false,
            show_end_of_line = true,
            show_current_context = true,
            show_current_context_start = true,
        },
    },
    --Highlight window
    {
        'nvim-zh/colorful-winsep.nvim',
        event = "BufWinEnter",
        config = true
    },
}
