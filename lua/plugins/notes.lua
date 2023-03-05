-- 笔记和任务清单
return {
    -- vim的org模式复刻
    {
        "nvim-orgmode/orgmode",
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
        ft = {"markdown"},
        opts = {
            mappings = {
                MkdnEnter = {{'i', 'n', 'v'}, '<CR>'}
            }
        }
    }
}
