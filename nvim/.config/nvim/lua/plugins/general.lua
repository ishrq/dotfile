return{
    --General
    {
        "nvim-lua/plenary.nvim",
    },
    -- https://github.com/tzachar/highlight-undo.nvim
    {
        'tzachar/highlight-undo.nvim',
        config = function()
            require('highlight-undo').setup()
        end
    },
    --Lists
    {
        "gaoDean/autolist.nvim",
        ft = {"markdown","text"},
        event = "InsertEnter",
        config = true
    },
    --Preview colors
    {
        "NvChad/nvim-colorizer.lua",
        ft = {"html","css","js","lua"},
        cmd = "Colorizer",
        config = true
    },
}
