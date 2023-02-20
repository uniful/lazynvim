return {
    -- 语法高亮
    {
        "nvim-treesitter/nvim-treesitter",
        build = {":TSUpdate"},
        event = {"BufReadPost","BufNewFile"},
        dependencies = {
            {"nvim-treesitter/nvim-treesitter-textobjects",lazy = true},
            {"JoosepAlviste/nvim-ts-context-commentstring",lazy = true},
            {"mrjones2014/nvim-ts-rainbow",lazy = true},
        },
        config = function()
            require("nvim-treesitter.configs").setup({
                -- 同步下载高亮支持
                sync_install = true,
                -- 安装高亮支持文件
                ensure_installed = { "c","cpp","python","lua","vim","cmake","bash","yaml","toml",
                    "markdown","markdown_inline","regex","org","norg","css","html","json","javascript","typescript"},
                -- 忽略安装
                ignore_install = { },
                -- 自动安装
                auto_install = true,
                -- 高亮相关
                highlight = {
                    -- 启用高亮支持
                    enable = true,
                    -- 使用treesitter高亮而不是neovim内置的高亮
                    additional_vim_regex_highlighting = false,
                },
                -- 范围选择
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        -- 初始化选择
                        init_selection = "gnn",
                        -- 递增
                        node_incremental = "grn",
                        -- 递减
                        node_decremental = "grc",
                        -- 选择一个范围
                        scope_incremental = "grm"
                    }
                },
                -- 缩进
                indent = {
                    enable = true
                },
                -- 彩虹括号，由nvim-ts-rainbow插件提供
                rainbow = {
                    enable = true,
                    extended_mode = true,
                    -- colors = {}, -- table of hex strings
                    -- termcolors = {} -- table of colour name strings
                    max_file_lines = nil
                },
                -- 根据当前上下文定义文件类型，由nvim-ts-context-commentstring插件提供
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },
                -- textobjects
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                        },
                        selection_modes = {
                            ['@parameter.outer'] = 'v', -- charwise
                            ['@function.outer'] = 'V', -- linewise
                            ['@class.outer'] = '<c-v>', -- blockwise
                        },
                        include_surrounding_whitespace = true,
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ["<leader>a"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["<leader>A"] = "@parameter.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["]m"] = "@function.outer",
                            ["]]"] = { query = "@class.outer", desc = "Next class start" },
                            ["]o"] = "@loop.*",
                            ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                        },
                        goto_next_end = {
                            ["]M"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[M"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                        goto_next = {
                            ["]d"] = "@conditional.outer",
                        },
                        goto_previous = {
                            ["[d"] = "@conditional.outer",
                        }
                    },
                    lsp_interop = {
                        enable = true,
                        border = 'none',
                        floating_preview_opts = {},
                        peek_definition_code = {
                            ["<leader>df"] = "@function.outer",
                            ["<leader>dF"] = "@class.outer",
                        }
                    }
                }
            })
        end
    },
    -- 显示当前可见缓冲区内容的上下文
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = {"BufReadPost","BufNewFile"},
        opts = {}
    },
    -- 在函数、方法、语句等之后显示当前上下文的虚拟文本
    {
        "haringsrob/nvim_context_vt",
        event = {"BufReadPost","BufNewFile"},
        opts = {
            prefix = ''
        }
    },
    -- 突出显示参数的定义和用法
    {
        "m-demare/hlargs.nvim",
        event = {"BufReadPost","BufNewFile"},
        opts = {}
    }
}
