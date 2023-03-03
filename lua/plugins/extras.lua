-- 一些有用的小玩意
return {
    -- 命令面板
    {
        "mrjones2014/legendary.nvim",
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
        cmd = {"CccPick","CccConvert","CccHighlighterToggle","CccHighlighterEnable","CccHighlighterDisable"},
        config = function ()
            local ccc = require("ccc")
            local mapping = ccc.mapping
            ccc.setup({})
        end
    },
    -- 页面切换器
    {
        "toppair/reach.nvim",
        cmd="ReachOpen",
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
        cmd = {"Twilight","TwilightEnable","TwilightDisable"},
        opts = {}
    },
    -- 禅模式
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        opts = {}
    },
    -- 图标选择器
    {
        "ziontee113/icon-picker.nvim",
        cmd = {"IconPickerNormal","IconPickerYank","IconPickerInsert"},
        dependencies = "telescope.nvim",
        opts = {
            disable_legacy_commands =true,
        }
    }
}
