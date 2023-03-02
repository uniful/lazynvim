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
        keys = {
            {"<leader>ttg", "<cmd>lua _lazygit_toggle()<CR>",desc="Lazygit Terminal"}
        },
        config = function()
            local Terminal  = require('toggleterm.terminal').Terminal
            -- 自定义lazygit终端
            local lazygit = Terminal:new({
                cmd = "lazygit",
                hidden = true,
                dir = "git_dir",
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
                },
                winbar = {
                    enable = true
                }
            })
        end
    },
    -- 文件目录树
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        init = function ()
            vim.g.neo_tree_remove_legacy_commands = 1
        end,
        opts = {}
    },
    -- 在悬浮窗中运行ranger
    {
        "kevinhwang91/rnvimr",
        keys = {
            {"<leader>rv","<cmd>RnvimrToggle<CR>",desc="Swith Ranger in Float Window"}
        }
    },
    -- 屏保
    {
        "folke/drop.nvim",
        event = "VimEnter",
        config = function ()
            math.randomseed(os.time())
            local themes = ({"stars","snow","xmas","leaves"})[math.random(1,4)]
            require("drop").setup({
                theme = themes,
            })
        end
    }
}
