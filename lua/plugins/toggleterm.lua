return {
    -- 用于在编辑会话期间保留和切换多个终端
    {
        "akinsho/toggleterm.nvim",
        version = '*',
        event = "VeryLazy",
        config = function()
            local Terminal  = require('toggleterm.terminal').Terminal

            -- 自定义lazygit终端
            local lazygit = Terminal:new({
                cmd = "lazygit",
                hidden = true,
                -- 默认使用浮动终端
                direction = "float",
                float_opts = {
                    border = "single",
                }
            })
            function _lazygit_toggle()
                lazygit:toggle()
            end

            require("toggleterm").setup({
                persist_size = false,
                -- 默认使用浮动终端
                direction = "float",
                float_opts = {
                    border = "shadow"
                }
            })
        end
    }
}
