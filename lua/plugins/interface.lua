return {
    --侧边栏
    {
        "sidebar-nvim/sidebar.nvim",
        lazy = true,
        cmd = {"SidebarNvimToggle","SidebarNvimOpen","SidebarNvimClose","SidebarNvimUpdate",
              "SidebarNvimFocus","SidebarNvimResize"},
        config = function ()
            local sidebar = require("sidebar-nvim")
            sidebar.setup({})
        end
    },
    -- 终端
    {
        "akinsho/toggleterm.nvim",
        lazy = true,
        version = '*',
        cmd = {"ToggleTerm","TermExec","ToggleTermToggleAll","ToggleTermSendCurrentLine",
        "ToggleTermSendVisualLines","ToggleTermSendVisualSelection"},
        keys = {
            -- 打开终端
            {"<leader>ttf","<cmd>ToggleTerm<CR>",desc = "Open Float Terminal"},
            -- 打开lazygit terminal
            {"<leader>ttg", "<cmd>lua _lazygit_toggle()<CR>",desc="Open Lazygit Terminal"}
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
        lazy = true,
        cmd = "Neotree",
        dependencies = "nvim-window-picker",
        init = function ()
            vim.g.neo_tree_remove_legacy_commands = 1
            if vim.fn.argc() == 1 then
                local stat = vim.loop.fs_stat(vim.fn.argv(0))
                if stat and stat.type == "directory" then
                    require("neo-tree")
                end
            end
        end,
        opts = {
            filesystem = {
                follow_current_file = true,
                use_libuv_file_watcher = true,
            },
            default_component_configs = {
                indent = {
                    with_expander = true,
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                }
            },
            source_selector = {
                winbar = true,
                statusline = true
            }
        }
    },
    -- 在悬浮窗中运行ranger
    {
        "kevinhwang91/rnvimr",
        lazy = true,
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
