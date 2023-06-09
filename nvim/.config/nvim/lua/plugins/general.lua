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
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        cmd = { "TodoTelescope" },
        opts = {
            vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" }),
            vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" }),

            -- Can specify a list of valid jump keywords
            -- vim.keymap.set("n", "]t", function() require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }}) end, { desc = "Next error/warning todo comment" })
        }
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
