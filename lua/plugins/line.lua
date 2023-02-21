-- buffer栏和status栏
return {
    -- buffer栏
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        version = "v3.*",
        dependencies = {
            -- 删除缓冲区不改变布局
            {"famiu/bufdelete.nvim",lazy = true},
            -- 缓冲区删除增强
            {
                "ojroques/nvim-bufdel",lazy = true,
                opts = {
                    next = 'cycle',
                    quit = false,
                }
            },
        },
        opts = {
            options = {
                -- 为每个buffer都配置一个序数
                numbers = "ordinal",
                -- 使用内置 LSP 进行诊断
                diagnostics = "nvim_lsp",
                -- 分割符样式
                separator_style = "thin",
                -- 显示LSP报错图标
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local s = " "
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == "error" and " " or (e == "warning" and " " or "")
                        s = s .. n .. sym
                    end
                    return s
                end,
                offset = {
                    {
                        filetype = "neo-tree",
                        text = "Neo-tree",
                        highlight = "Directory",
                        "text_align",
                    }
                }
            }
        }
    },
    -- status栏插件
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                    globalstatus = true,
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {'filename'},
                    lualine_x = {
                        {'encoding', 'fileformat', 'filetype'},
                        {
                            require("lazy.status").updates,
                            cond = require("lazy.status").has_updates,
                            color = { fg = "#ff9e64" },
                        },
                        {
                            require("noice").api.status.message.get_hl,
                            cond = require("noice").api.status.message.has,
                        },
                        {
                            require("noice").api.status.command.get,
                            cond = require("noice").api.status.command.has,
                            color = { fg = "#ff9e64" },
                        },
                        {
                            require("noice").api.status.mode.get,
                            cond = require("noice").api.status.mode.has,
                            color = { fg = "#ff9e64" },
                        },
                        {
                            require("noice").api.status.search.get,
                            cond = require("noice").api.status.search.has,
                            color = { fg = "#ff9e64" },
                        },
                        {"aerial"}
                    },
                    lualine_y = {
                        {'progress'},
                        {"aerial",
                            sep = ' ) ',
                            depth = nil,
                            dense = false,
                            dense_sep = '.',
                            colored = true,
                        }
                    },
                    lualine_z = {'location'}
                }
            })
        end
    }
}
