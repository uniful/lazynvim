-- 功能加强和优化
return {
    -- 完善旧的 quickfix 窗口
    {
        "kevinhwang91/nvim-bqf",
        event = "VeryLazy",
        opts = {}
    },
    -- 改进了Yank和Put功能
    {
        "gbprod/yanky.nvim",
        event = "VeryLazy",
        opts = {
            ring = {
                storage = "sqlite"
            }
        }
    },
    -- 带有nvim lua API的完整签名帮助、文档和补全
    {
        "folke/neodev.nvim",
        event = "VeryLazy",
        opts = {
            library = {
                plugins = {
                    "nvim-dap-ui",
                    "nvim-treesitter",
                    "plenary.nvim",
                    "telescope.nvim",
                    "trouble.nvim",
                    "null-ls.nvim",
                    "nvim-cmp",
                },
                type = true,
            }
        }
    },
    -- 中文文档
    {
        "yianwillis/vimcdoc",
        event = "VeryLazy"
    },
    -- 弹出按键绑定和输入命令窗口
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            plugins = {
                spelling = {
                    enabled = true
                }
            },
            windows = {
                border = "shadow"
            }
        }
    },
    -- 加快启动时间
    {
        "nathom/filetype.nvim",
        opts = {
            overrides = {
                extensions = {
                    pn = "potion",
                },
                literal = {
                    MyBackupFile = "lua",
                },
                complex = {
                    [".*git/config"] = "gitconfig",
                },
                function_extensions = {
                    ["cpp"] = function()
                        vim.bo.filetype = "cpp"
                        vim.bo.cinoptions = vim.bo.cinoptions .. "L0"
                    end,
                    ["pdf"] = function()
                        vim.bo.filetype = "pdf"
                        vim.fn.jobstart(
                            "open -a skim " .. '"' .. vim.fn.expand("%") .. '"'
                        )
                    end,
                },
                function_literal = {
                    Brewfile = function()
                        vim.cmd("syntax off")
                    end,
                },
                function_complex = {
                    ["*.math_notes/%w+"] = function()
                        vim.cmd("iabbrev $ $$")
                    end,
                },

                shebang = {
                    dash = "sh",
                },
            }
        }
    },
    -- 测量启动时间
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime"
    },
    -- 更好的模式切换
    {
        "max397574/better-escape.nvim",
        event = "BufReadPost",
        opts = {
            mapping = {"jk", "jj"},
            timeout = vim.o.timeoutlen,
            clear_empty_lines = false,
            keys = "<Esc>",
        }
    },
    -- 非活动代码变暗
    {
        "folke/twilight.nvim",
        event = "BufReadPost",
        opts = {}
    },
    -- 禅模式
    {
        "folke/zen-mode.nvim",
        event = "BufReadPost",
        opts = {}
    },
    -- 提供对SchemaStore目录的访问
    {
        "b0o/SchemaStore.nvim",
        lazy = true
    }
}
