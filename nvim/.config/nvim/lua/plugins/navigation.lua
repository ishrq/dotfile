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
}
