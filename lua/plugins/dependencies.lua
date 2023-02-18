-- 此文件作为其它插件公共依赖调用
return {
    -- 减少lua函数的编写
    {
        "nvim-lua/plenary.nvim",
        lazy = true
    },
    -- 支持异步
    {
        "kevinhwang91/promise-async",
        lazy = true
    },
    -- 改进了默认vim.ui界面
    {
        "stevearc/dressing.nvim",
        lazy = true,
        opts = {
            input = {
                enabled = true,
                default_prompt = "Input:",
                prompt_align = "left",
                insert_only = true,
                start_in_insert = true,
                anchor = "SW",
                border = "rounded",
                relative = "cursor",
                prefer_width = 40,
                width = nil,
                max_width = { 140, 0.9 },
                min_width = { 20, 0.2 },
                buf_options = {},
                win_options = {
                    winblend = 10,
                    wrap = false,
                },
                mappings = {
                    n = {
                        ["<Esc>"] = "Close",
                        ["<CR>"] = "Confirm",
                    },
                    i = {
                        ["<C-c>"] = "Close",
                        ["<CR>"] = "Confirm",
                        ["<Up>"] = "HistoryPrev",
                        ["<Down>"] = "HistoryNext",
                    },
                },
                override = function(conf)
                    return conf
                end,
                get_config = nil,
            },
            select = {
                enabled = true,
                backend = { "telescope","fzf_lua", "builtin", "nui" },
                trim_prompt = true,
                telescope = nil,
                fzf_lua = {
                    winopts = {
                        width = 0.5,
                        height = 0.4,
                    },
                },
                nui = {
                    position = "50%",
                    size = nil,
                    relative = "editor",
                    border = {
                        style = "rounded",
                    },
                    buf_options = {
                        swapfile = false,
                        filetype = "DressingSelect",
                    },
                    win_options = {
                        winblend = 10,
                    },
                    max_width = 80,
                    max_height = 40,
                    min_width = 40,
                    min_height = 10,
                },
                builtin = {
                    anchor = "NW",
                    border = "rounded",
                    relative = "editor",

                    buf_options = {},
                    win_options = {
                        winblend = 10,
                    },
                    width = nil,
                    max_width = { 140, 0.8 },
                    min_width = { 40, 0.2 },
                    height = nil,
                    max_height = 0.9,
                    min_height = { 10, 0.2 },
                    mappings = {
                        ["<Esc>"] = "Close",
                        ["<C-c>"] = "Close",
                        ["<CR>"] = "Confirm",
                    },

                    override = function(conf)
                        return conf
                    end,
                },
                format_item_override = {},
                get_config = nil,
            }
        }
    },
    -- neovim的UI组件库
    {
        "MunifTanjim/nui.nvim",
        lazy = true
    },
    -- 图标支持插件
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        opts = {
            override = {
                zsh = {
                    icon = "",
                    color = "#428850",
                    cterm_color = "65",
                    name = "Zsh"
                }
            };
          color_icons = true;
          default = true;
        }
    },
    -- 避免重复回调
    {
        "tpope/vim-repeat",
        event = "VeryLazy"
    },
    -- 提供对sqlite的操作，用户保存会话，输入历史
    {
        "kkharji/sqlite.lua",
        lazy = true
    }
}
