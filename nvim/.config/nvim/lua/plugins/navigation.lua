-- Author: IA
-- Device: PC


return {
    --Fuzzy search
    {
        'nvim-telescope/telescope.nvim',
        event = 'VeryLazy',
        cmd = 'Telescope',
        dependencies = {
            {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
            'debugloop/telescope-undo.nvim'
        },
        config = function()
            require('telescope').setup {
                --TODO: Modify layout
                defaults = {
                    layout_strategy = 'flex',
                    prompt_position = 'bottom',
                    preview_height = '0.8',
                    preview_width = '0.7',
                },
            }
            require('telescope').load_extension('fzf')
            require('telescope').load_extension('undo')
        end
    },
    --Easy motion
    --NOTE: Find a replacement, author won't maintain
    {
        'phaazon/hop.nvim', branch = 'v2',
        event = 'VeryLazy',
        cmd = 'Hop',
        config = function() require('hop').setup{
            quit_key = '<SPC>', multi_windows = true
        } end
    },
}
