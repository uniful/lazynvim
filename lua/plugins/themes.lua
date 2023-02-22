return {
    -- 主题
    -- {
    --     "glepnir/zephyr-nvim",
    --     priority = 1000,
    --     config = function ()
    --         vim.cmd[[colorscheme zephyr]]
    --     end
    -- },
    {
        "rmehri01/onenord.nvim",
        priority = 1000,
        opts = {
            theme = "dark",
            fade_nc = true,
            inverse = {
                match_paren = true,
            }
        }
    }
}
