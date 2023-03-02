-- 一些有用的小玩意
return {
    -- 命令面板
    {
        "mrjones2014/legendary.nvim",
        cmd = "Legendary",
        opts = {}
    },
    -- 创建自定义子模式和菜单
    {
        "anuvyklack/hydra.nvim",
        evnet = "VeryLazy",
        config = function ()
            local Hydra = require("hydra")
        end
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
        cmd = "ReachOpen",
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
