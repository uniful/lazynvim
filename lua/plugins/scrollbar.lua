return {
     -- 显示滚动条
     {
        "petertriho/nvim-scrollbar",
        evnet = "VeryLazy",
        config = function()
            local colors = {
                Handle = "#492E42",
                Search = "#FC8671",
                Error  = "#FD6883",
                Warn   = "#FFD886",
                Info   = "#A9DC76",
                Hint   = "#78DCE8",
                Misc   = "#AB9DF2"
            }
            require("scrollbar").setup({
                handle = {
                    -- 滚动条颜色
                    color  = colors.Handle
                },
                marks = {
                    -- 诊断颜色
                    Search = {color = colors.Search},
                    Error  = {color = colors.Error},
                    Warn   = {color = colors.Warn},
                    Info   = {color = colors.Info},
                    Hint   = {color = colors.Hint},
                    Misc   = {color = colors.Misc}
                },
                handlers = {
                    gitsigns = true,
                    search = true,
                }
            })
        end
    }
}
