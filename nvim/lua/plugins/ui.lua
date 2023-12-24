return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        main = "ibl",
        config = true,
        opts = {}
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    },
    {
        'RRethy/vim-illuminate',
        event = "VeryLazy",
        config = function()
            require('illuminate').configure()
        end
    },
}
