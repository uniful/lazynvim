-- 一些有用的小玩意
return {
    -- 命令面板
    {
        "mrjones2014/legendary.nvim",
        lazy = true,
        cmd = "Legendary",
        keys = {
            {"<leader>ldy","<cmd>Legendary<CR>",desc="Show Legendary"},
            {"<leader>ldc","<cmd>Legendary commands<CR>",desc="Search Commands"},
            {"<leader>ldf","<cmd>Legendary functions<CR>",desc="Search Functions"},
            {"<leader>lda","<cmd>Legendary autocmds<CR>",desc="Search Autocmds"}
        },
        dependencies = "telescope.nvim",
        opts = {}
    },
    -- 颜色选择器
    {
        "uga-rosa/ccc.nvim",
        lazy = true,
        cmd = {"CccPick","CccConvert","CccHighlighterToggle","CccHighlighterEnable","CccHighlighterDisable"},
        opts = {}
    },
    -- 页面切换器
    {
        "toppair/reach.nvim",
        lazy = true,
        keys = {
            {"<leader>rb","<cmd>ReachOpen buffers<CR>",desc="Switch Buffers Page"},
            {"<leader>rc","<cmd>ReachOpen colorschemes<CR>",desc="Switch Scheme Page"},
            {"<leader>rm","<cmd>ReachOpen marks<CR>",desc="Switch Mark Page"},
            {"<leader>rt","<cmd>ReachOpen tabpages<CR>",desc="Switch Tab Page"}
        },
        opts = {
            notifications = true
        }
    },
    -- 非活动代码变暗
    {
        "folke/twilight.nvim",
        lazy = true,
        keys = {
            {"<leader>twl","<cmd>Twilight<CR>",desc = "Inactive Code Shade"},
            {"<leader>twe","<cmd>TwilightEnable<CR>",desc = "Enable Inactive Code Shade"},
            {"<leader>twd","<cmd>TwilightDisable<CR>",desc = "Disable Inactive Code Shade"}
        },
        opts = {}
    },
    -- 禅模式
    {
        "folke/zen-mode.nvim",
        lazy = true,
        keys = {"<leader>zm","<cmd>ZenMode<CR>",desc = "Zen Mode"},
        opts = {}
    },
    -- 图标选择器
    {
        "ziontee113/icon-picker.nvim",
        lazy = true,
        cmd = {"IconPickerNormal","IconPickerYank","IconPickerInsert"},
        dependencies = "telescope.nvim",
        opts = {
            disable_legacy_commands =true,
        }
    }
}
