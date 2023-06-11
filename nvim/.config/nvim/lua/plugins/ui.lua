return {
    --Colorscheme
    {
        'Everblush/nvim',
        name = 'everblush',
        config = function ()
            vim.cmd.colorscheme("everblush")
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
                component_separators = '│',
                section_seperators = '',
            }
        } end
    },
}
