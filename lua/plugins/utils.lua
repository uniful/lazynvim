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
    -- 代码折叠
    {
        "kevinhwang91/nvim-ufo",
        init = function ()
            vim.keymap.set('n', 'zF', require('ufo').openAllFolds)
            vim.keymap.set('n', 'zC', require('ufo').closeAllFolds)
        end,
        event = {"BufReadPre","BufNewFile"},
        config = function ()
            -- 自定义折叠文本
            local handler = function(virtText, lnum, endLnum, width, truncate)
                local newVirtText = {}
                local suffix = ('  %d '):format(endLnum - lnum)
                local sufWidth = vim.fn.strdisplaywidth(suffix)
                local targetWidth = width - sufWidth
                local curWidth = 0
                for _, chunk in ipairs(virtText) do
                    local chunkText = chunk[1]
                    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    if targetWidth > curWidth + chunkWidth then
                        table.insert(newVirtText, chunk)
                    else
                        chunkText = truncate(chunkText, targetWidth - curWidth)
                        local hlGroup = chunk[2]
                        table.insert(newVirtText, {chunkText, hlGroup})
                        chunkWidth = vim.fn.strdisplaywidth(chunkText)
                        if curWidth + chunkWidth < targetWidth then
                            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                        end
                        break
                    end
                    curWidth = curWidth + chunkWidth
                end
                table.insert(newVirtText, {suffix, 'MoreMsg'})
                return newVirtText
            end
            require('ufo').setup({
                fold_virt_text_handler = handler
            })
        end
    },
    -- 改进了Yank和Put功能
    {
        "gbprod/yanky.nvim",
        lazy = true,
        cmd = {"YankyRingHistory","YankyClearHistory"},
        dependencies = "telescope.nvim",
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
        lazy = true,
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
    },
    -- 不需要时隐藏颜色列
    {
        "m4xshen/smartcolumn.nvim",
        event = "VeryLazy",
        opts = {}
    }
}
