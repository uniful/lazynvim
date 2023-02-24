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
        opts = {}
    },
    -- 启动界面
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        opts = function()
        local dashboard = require("alpha.themes.dashboard")
            local logo = [[
            ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
            ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
            ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
            ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
            ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
            ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
            ]]

            dashboard.section.header.val = vim.split(logo, "\n")
            dashboard.section.buttons.val = {
                dashboard.button("f", " " .. " Find file", "<cmd>Telescope find_files <CR>"),
                dashboard.button("e", " " .. " New file", "<cmd>ene <BAR> startinsert <CR>"),
                dashboard.button("h", " " .. " Recent files", "<cmd>Telescope oldfiles <CR>"),
                dashboard.button("g", " " .. " Find word", "<cmd>Telescope live_grep <CR>"),
                dashboard.button("r", " " .. " Frecency/MRU","<cmd>Telescope frecency<CR>"),
                dashboard.button("p", " " .. " Open last projects","<cmd>Telescope projects<CR>"),
                dashboard.button("l", "鈴" .. " Lazy", "<cmd>Lazy<CR>"),
                dashboard.button("q", " " .. " Quit", "<cmd>qa<CR>"),
            }
            for _, button in ipairs(dashboard.section.buttons.val) do
                button.opts.hl = "AlphaButtons"
                button.opts.hl_shortcut = "AlphaShortcut"
            end
            dashboard.section.footer.opts.hl = "Type"
            dashboard.section.header.opts.hl = "AlphaHeader"
            dashboard.section.buttons.opts.hl = "AlphaButtons"
            dashboard.opts.layout[1].val = 2
            return dashboard
        end,
        config = function(_, dashboard)
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "AlphaReady",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end

            require("alpha").setup(dashboard.opts)

            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
                    pcall(vim.cmd.AlphaRedraw)
                end,
            })
        end
    }
}
