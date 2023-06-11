return{
    --General
    {
        "nvim-lua/plenary.nvim",
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
