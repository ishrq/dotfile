return {
    --Colorscheme
    {
        "sainnhe/everforest",
        config = function ()
            vim.opt.termguicolors = true
            vim.g.everforest_background = "hard"
            vim.g.everforest_disable_italic_comment = true
            vim.cmd.colorscheme("everforest")
        end
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
