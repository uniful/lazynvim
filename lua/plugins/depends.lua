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
                prompt_align = "center",
                mappings = {
                    i = {
                        ["<M-c>"] = "Close"
                    },
                }
            },
            select = {
                backend = { "telescope","fzf_lua", "builtin", "nui" },
                builtin = {
                    mappings = {
                        ["<M-c>"] = "Close",
                    }
                }
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
    },
    -- 管理lsp,dap,diagnostics,formatting服务的安装
    {
        "williamboman/mason.nvim",
        lazy = true,
        cmd = {"Mason","MasonInstall","MasonUninstall","MasonUninstallAll","MasonLog"},
        opts = {
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    }
}
