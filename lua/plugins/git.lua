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
        cmd = "Neogit",
        opts = {}
    },
    -- 环浏览任何 git 版本的所有修改文件的差异
    {
        "sindrets/diffview.nvim",
        cmd = {"DifffviewFileHistory","DiffviewClose","DiffviewOpen","DiffviewRefresh",
        "DiffviewLog","DiffviewFocusFiles","DiffviewToggleFiles"},
        opts = {}
    }
}

