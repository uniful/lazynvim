-- 注释类插件
return {
     -- 快速注释
     {
        "numToStr/Comment.nvim",
        event = "User FileOpened",
        config = function ()
            local opts = {
                -- Normal模式下注释命令
                toggler = {
                    line = "gcc",
                    block = "gCC",
                },
                -- Visual模式下注释命令
                opleader = {
                    line = "gc",
                    block = "gb",
                },
                -- 额外的注释命令
                extra = {
                    -- 上行注释
                    above = "gcO",
                    -- 下行注释
                    below = "gco",
                    -- 尾部注释
                    eol = "gcA",
                },
                mappings = {
                    basic = true,
                    extra = true,
                },
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            }
            require("Comment").setup(opts)
        end
    },
    -- TODO注释样式
    {
        "folke/todo-comments.nvim",
        cmd = {"TodoTrouble","TodoTelescope"},
        event = "BufReadPost",
        opts = {
            keywords = {
                -- alt:别名
                FIX =  {icon = " ", color = "#DC2626", alt = {"FIXME", "BUG", "FIXIT", "ISSUE", "!"}},
                TODO = {icon = " ", color = "#10B981"},
                HACK = {icon = " ", color = "#7C3AED"},
                WARN = {icon = " ", color = "#FBBF24", alt = {"WARNING", "XXX"}},
                PERF = {icon = " ", color = "#FC9868", alt = {"OPTIM", "PERFORMANCE", "OPTIMIZE"}},
                NOTE = {icon = " ", color = "#2563EB", alt = {"INFO"}},
                TEST = {icon = "⏲ ", color = "#FF00FF", alt = { "TESTING", "PASSED", "FAILED" }}
            }
        }
    }
}
