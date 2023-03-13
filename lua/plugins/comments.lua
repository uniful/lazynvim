-- 注释类插件
return {
     -- 快速注释
     {
        "numToStr/Comment.nvim",
        lazy = true,
        keys = {
            {"gcc",mode = {"n"},desc = "line comment"},
            {"gCC",mode = {"n"},desc = "line block comment"},
            {"gcO",mode = {"n"},desc = "prev line comment"},
            {"gco",mode = {"n"},desc = "next line comment"},
            {"gcA",mode = {"n"},desc = "tail line comment"},
            {"gc",mode = {"v"},desc = "visual line comment"},
            {"gb",mode = {"v"},desc = "visual block comment"}
        },
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
        lazy = true,
        cmd = {"TodoTrouble","TodoTelescope","TodoQuickFix","TodoLocList"},
        keys={
            -- TODO标签跳转
            vim.keymap.set("n","[t",function()
                require("todo-comments").jump_prev()
            end,{desc="Prev Todo Comment"}),
            vim.keymap.set("n","]t",function()
                require("todo-comments").jump_next()
            end,{desc="Next Todo Comment"})
        },
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
    },
    -- 注释生成器
    {
        "danymat/neogen",
        lazy = true,
        cmd = "Neogen",
        keys = {
            {"<leader>nog","<cmd>Neogen<CR>",desc="Generate Comment"},
            {"<leader>nof","<cmd>Neogen func<CR>",desc="Generate Function Comment"},
            {"<leader>noc","<cmd>Neogen class<CR>",desc="Generate Class Comment"},
            {"<leader>not","<cmd>Neogen type<CR>",desc="Generate Type Comment"},
            {"<leader>noi","<cmd>Neogen file<CR>",desc="Generate File Comment"}
        },
        opts = {
            snippet_engine = "luasnip",
        }
    }
}
