-- 笔记和任务清单
return {
    -- vim的org模式复刻
    {
        "nvim-orgmode/orgmode",
        lazy = true,
        ft = "org",
        config = function ()
            require("orgmode").setup_ts_grammar()
            require("orgmode").setup({})
        end
    },
    -- 基于结构化笔记、项目和任务管理、时间跟踪、幻灯片、编写排版文档等等
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        lazy = true,
        ft = "norg",
        opts = {
            load = {
                ["core.defaults"] = {},
                ["core.norg.concealer"] = {},
                ["core.norg.dirman"] = {
                    config = {
                        workspaces = {
                            notes = "~/Notes",
                            work = "~/Notes/work",
                            home = "~/Notes/home"
                        }
                    }
                }
            }
        }
    },
    -- markdown笔记管理
    {
        "jakewvincent/mkdnflow.nvim",
        lazy = true,
        ft = "markdown",
        opts = {
            mappings = {
                MkdnEnter = {{'i', 'n', 'v'}, '<CR>'}
            }
        }
    },
    -- markdown代码块管理
    {
        "AckslD/nvim-FeMaco.lua",
        lazy = true,
        ft = "markdown",
        keys = {
            {"<leader>fm","<cmd>FeMaco<CR>",desc="调用窗口编辑代码块"}
        },
        opts = {}
    },
    -- 任务工作流
    {
        "phaazon/mind.nvim",
        lazy = true,
        branch = "v2.2",
        event = {"BufReadPre","BufNewFile"},
        opts = {}
    }
}
