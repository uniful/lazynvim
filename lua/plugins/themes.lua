return {
    -- 主题
    -- {
    --     "glepnir/zephyr-nvim",
    --     priority = 1000,
    --     config = function ()
    --         vim.cmd[[colorscheme zephyr]]
    --     end
    -- },
    --{
    --    "rmehri01/onenord.nvim",
    --    priority = 1000,
    --    opts = {
    --        theme = "dark",
    --        fade_nc = true,
    --        styles = {
    --            comments = "italic",
    --            strings = "bold",
    --            keywords = "bold",
    --            functions = "bold",
    --            variables = "bold",
    --        },
    --        inverse = {
    --            match_paren = true,
    --        }
    --    }
    --},
    -- {
    --     "navarasu/onedark.nvim",
    --     priority = 1000,
    --     config = function ()
    --         require("onedark").setup({
    --             style = "darker",
    --             code_style = {
    --                 comments = "italic",
    --                 keywords = "bold",
    --                 functions = "bold,italic"
    --             }
    --         })
    --         require("onedark").load()
    --     end
    -- },
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        config = function ()
            require("kanagawa").setup({
                functionStyle = {italic=true,bold=true}
            })
            vim.cmd("colorscheme kanagawa")
        end
    }
}
