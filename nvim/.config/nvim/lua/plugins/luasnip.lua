return {
    -- https://github.com/L3MON4D3/LuaSnip
    {
        'L3MON4D3/LuaSnip',
        event = 'InsertEnter',
        dependencies = {'rafamadriz/friendly-snippets' },
        opts = {
            history = true,
            delete_check_events = 'TextChanged',
        },
        keys = {
            { '<c-n>', '<Plug>luasnip-next-choice', mode = { 'i', 's'} },
            { '<c-p>', '<Plug>luasnip-prev-choice', mode = { 'i', 's' } },
            { '<tab>', function() return require('luasnip').jumpable(1) and '<Plug>luasnip-jump-next' or '<tab>' end, expr = true, silent = true, mode = 'i', },
            { '<tab>', function() require('luasnip').jump(1) end, mode = 's' },
            { '<s-tab>', function() require('luasnip').jump(-1) end, mode = { 'i', 's' } },
        },
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load({ exclude = {'all', 'fish', 'html', 'markdown'} })
            require('luasnip.loaders.from_lua').lazy_load()
        end
    }
}

