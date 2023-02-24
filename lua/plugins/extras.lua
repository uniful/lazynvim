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
    }
}
