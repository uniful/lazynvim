return {
    --侧边栏
    {
        "sidebar-nvim/sidebar.nvim",
        cmd = {"SidebarNvimToggle","SidebarNvimFocus","SidebarNvimOpen",
            "SidebarNvimResize","SidebarNvimClose","SidebarNvimUpdate"},
        opts = {}
    },
    -- 终端
    {
        "akinsho/toggleterm.nvim",
        version = '*',
        cmd = {"ToggleTerm","TermExec","ToggleTermToggleAll","ToggleTermSendCurrentLine",
        "ToggleTermSendVisualLines","ToggleTermSendVisualSelection"},
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
    },
    -- 文件目录树
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        opts = {}
    },
    -- 启动界面
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function ()
            require("alpha").setup(require'alpha.themes.dashboardt'.config)
        end
    }
}
