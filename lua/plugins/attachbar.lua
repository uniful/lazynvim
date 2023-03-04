return {
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        event = {"BufReadPre","BufNewFile"},
        dependencies = {
            {
                "SmiteshP/nvim-navic",
                config = function ()
                    local navic = require("nvim-navic")
                    navic.setup({
                        highlight = true,
                    })
                end
            }
        },
        config = function ()
            require("barbecue").setup({
                kinds = {
                    File = "",
                    Module = "",
                    Namespace = "",
                    Package = "",
                    Class = "",
                    Method = "",
                    Property = "",
                    Field = "",
                    Constructor = "",
                    Enum = "練",
                    Interface = "練",
                    Function = "",
                    Variable = "",
                    Constant = "",
                    String = "",
                    Number = "",
                    Boolean = "◩",
                    Array = "",
                    Object = "",
                    Key = "",
                    Null = "ﳠ",
                    EnumMember = "",
                    Struct = "",
                    Event = "",
                    Operator = "",
                    TypeParameter = "",
                }
            })
        end
    }
}
