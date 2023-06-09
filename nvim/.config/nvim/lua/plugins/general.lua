-- Author: IA
-- Machine: PC


return{
    --General
    {
        "nvim-lua/plenary.nvim",
    },
    --Surroundings
    {
        "kylechui/nvim-surround",
        event = "InsertEnter",
        config = true
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },
    --Comments
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = true
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
