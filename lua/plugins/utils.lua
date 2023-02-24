-- 功能加强和优化
return {
    -- 完善旧的quickfix窗口
    {
        "kevinhwang91/nvim-bqf",
        ft = "qf",
        opts = {
            auto_resize_height = true,
            preview = {
                win_height = 12,
                win_vheight = 12,
                delay_syntax = 80,
                border_chars = {'┃', '┃', '━', '━', '┏', '┓', '┗', '┛', '█'},
                show_title = false,
                should_preview_cb = function(bufnr, qwinid)
                    local ret = true
                    local bufname = vim.api.nvim_buf_get_name(bufnr)
                    local fsize = vim.fn.getfsize(bufname)
                    if fsize > 100 * 1024 then
                        ret = false
                    elseif bufname:match('^fugitive://') then
                        ret = false
                    end
                    return ret
                end
            },
            func_map = {
                drop = 'o',
                openc = 'O',
                split = '<M-S>',
                tabdrop = '<M-T>',
                tabc = '',
                ptogglemode = 'z,',
            },
            filter = {
                fzf = {
                    action_for = {['ctrl-s'] = 'split', ['ctrl-t'] = 'tab drop'},
                    extra_opts = {'--bind', 'ctrl-o:toggle-all', '--prompt', '> '}
                }
            }
        }
    },
    -- 改进了Yank和Put功能
    {
        "gbprod/yanky.nvim",
        lazy = true,
        cmd = {"YankyClearHistory","YankyRingHistory"},
        opts = {
            ring = {
                history_length = 200,
                storage = "sqlite"
            },
            preserve_cursor_position = {
                enable = true
            }
        }
    },
    -- VIM中文文档
    {
        "yianwillis/vimcdoc",
        event = "CmdlineEnter"
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
    -- 测量启动时间
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime"
    },
    -- 更好的模式切换
    {
        "max397574/better-escape.nvim",
        event = {"BufReadPost","BufNewFile"},
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
        cmd = {"Twilight","TwilightEnable","TwilightDisable"},
        opts = {}
    },
    -- 禅模式
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        opts = {}
    },
    -- 提供对SchemaStore目录的访问
    {
        "b0o/SchemaStore.nvim",
        lazy = true
    },
     -- 平滑滚动
    {
        "karb94/neoscroll.nvim",
        event = "VeryLazy",
        opts = {}
    },
    -- 页面切换器
    {
        "toppair/reach.nvim",
        cmd = "ReachOpen",
        opts = {
            notifications = true
        }
    },
    -- 将缓冲区锁定到窗口
    {
        "stevearc/stickybuf.nvim",
        cmd = {"PinBuffer","PinBuftype","PinFIleType","UnpinBuffer"},
        opts = {}
    },
    -- 输入命令查看缓冲区
    {
        "nacro90/numb.nvim",
        event = "CmdlineEnter",
        opts = {
            number_only = true
        }
    }
}
