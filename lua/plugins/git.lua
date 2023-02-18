return {
    -- 状态栏显示git信息
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("gitsigns").setup()
            require("scrollbar.handlers.gitsigns").setup()
        end
    },
    -- neovim的magit
    {
        "TimUntersberger/neogit",
        event = "VeryLazy",
        opts = {}
    },
    -- 环浏览任何 git 版本的所有修改文件的差异
    {
        "sindrets/diffview.nvim",
        event = "BufReadPre",
        opts = {}
    }
}

