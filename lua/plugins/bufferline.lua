-- buffer栏及其关闭工具
return {
    -- 支持LSP状态的buffer栏
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        version = "v3.*",
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
    -- 删除缓冲区不改变布局
    {
        "famiu/bufdelete.nvim",
        event = "VeryLazy"
    },
    -- 改进缓冲区的删除
    {
        "ojroques/nvim-bufdel",
        event = "VeryLazy",
        opts = {
            next = 'cycle',
            quit = false,
        }
    }
}
