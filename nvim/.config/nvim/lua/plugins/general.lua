return{
    -- https://github.com/tzachar/highlight-undo.nvim
    {
        'tzachar/highlight-undo.nvim',
        event = 'VeryLazy',
        config = true
    },
    -- https://github.com/gaoDean/autolist.nvim
    {
        'gaoDean/autolist.nvim',
        ft = {'markdown', 'text', 'tex', 'plaintex'},
        config = function()
            local autolist = require('autolist')
            autolist.setup()
            autolist.create_mapping_hook('i', '<CR>', autolist.new)
            autolist.create_mapping_hook('i', '<Tab>', autolist.indent)
            autolist.create_mapping_hook('i', '<S-Tab>', autolist.indent, '<C-D>')
            autolist.create_mapping_hook('n', 'o', autolist.new)
            autolist.create_mapping_hook('n', 'O', autolist.new_before)
            autolist.create_mapping_hook('n', '>>', autolist.indent)
            autolist.create_mapping_hook('n', '<<', autolist.indent)
            autolist.create_mapping_hook('n', '<C-r>', autolist.force_recalculate)
            autolist.create_mapping_hook('n', '<leader>x', autolist.invert_entry, "")
        end,
    },
    -- https://github.com/norcalli/nvim-colorizer.lua
    {
        'NvChad/nvim-colorizer.lua',
        ft = {'html','css','js','lua'},
        cmd = 'Colorizer',
        config = true
    },
}
